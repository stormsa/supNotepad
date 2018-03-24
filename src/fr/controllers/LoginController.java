package fr.controllers;

import fr.dao.IUserDao;
import fr.entities.UserAccount;
import fr.form.LoginForm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;

@Controller
@RequestMapping("/login")
public class LoginController {
    @Autowired
    IUserDao userBdd;
    UserAccount user;
    public void setUserDAO(IUserDao userDAO) {
        this.userBdd = userDAO;
    }
    // Redirect to home or login form
    @RequestMapping(method= RequestMethod.GET)
    public String index(Model model, LoginForm loginForm, HttpServletRequest request){
        LoginForm userData = (LoginForm) request.getSession().getAttribute("LOGGEDIN_USER");
        if(userData == null){
            model.addAttribute("loginForm", loginForm);
            return "login";
        }
        else{
            return "redirect:/index";
        }

    }
    // Login user
    @RequestMapping(method= RequestMethod.POST)
    public String connect(@ModelAttribute("login")LoginForm loginForm, HttpServletRequest request, Model model, ModelMap param){
        String username = loginForm.getUsername();
        String password = loginForm.getPassword();

        if(username != null && password != null){
            user = userBdd.checkCredentials(username, LoginForm.getEncryptedPassword(password));
            if( user != null ){
                request.getSession().setAttribute("LOGGEDIN_USER", loginForm);
                request.getSession().setAttribute("USER_INFORMATIONS", user);
                param.remove("error");
                return "redirect:/index";
            }else{
                model.addAttribute("loginAttribute", loginForm);
                param.put("error", "error");
                return "redirect:/login";
            }
        }else{
            model.addAttribute("loginAttribute", loginForm);
            return "redirect:/login";
        }
    }
    @RequestMapping(value="/logOff", method = RequestMethod.GET)
    public String logOff(Model model, LoginForm loginform, HttpServletRequest request, ModelMap param){
        HttpSession session = request.getSession();
        session.removeAttribute("LOGGEDIN_USER");
        session.removeAttribute("USER_INFORMATIONS");
        param.put("logout", "success");
        return "redirect:/login";
    }
    @RequestMapping(value = "/social_network", method = RequestMethod.GET)
    public String login(HttpServletRequest request)
    {
        //facebook & google login behavior
        String id = request.getParameter("userOAuthID");
        String firstName = request.getParameter("userOAuthFirstName");
        String lastName = request.getParameter("userOAuthLastName");

        if (lastName == null)
        {
            // handle facebook name :
            // API return first ans last name in the same string
            // we need to split it
            String[] split = firstName.split("\\s+");
            firstName = split[0];
            lastName = "";

            for (int j=1; j<split.length; j++)
                lastName += split[j] + " ";

            // trim last space
            lastName.trim();
        }

        if (id != null) {
            UserAccount userOAuth = userBdd.find(id);

            // if user not exist, we create it
            if (userOAuth == null) {
                userOAuth = new UserAccount();
                userOAuth.setEmail(id);
                userOAuth.setPassword(LoginForm.getEncryptedPassword(String.valueOf(id)));
                userOAuth.setFirstName(firstName);
                userOAuth.setLastName(lastName);
                Date creationDate = new Date();
                userOAuth.setCreationDate(creationDate);
                userBdd.saveUser(userOAuth);
            }
            String username = String.valueOf(id);
            String password = String.valueOf(id);

            // check user in DB and add it to the Session
            user = userBdd.checkCredentials(username, LoginForm.getEncryptedPassword(password));
            if (user != null) {
                LoginForm loginForm = new LoginForm();
                loginForm.setUsername(username); loginForm.setPassword(password);
                request.getSession().setAttribute("LOGGEDIN_USER", loginForm);
                request.getSession().setAttribute("USER_INFORMATIONS", user);
                return "redirect:/index";
            }
        }
        return "redirect:/login.failed";
    }

}