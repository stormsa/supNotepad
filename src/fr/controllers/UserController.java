package fr.controllers;

import fr.dao.IUserDao;
import fr.entities.Notepad;
import fr.entities.UserAccount;
import fr.form.LoginForm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    IUserDao userBdd;
    UserAccount user;
    public void setUserDAO(IUserDao userDAO) {
        this.userBdd = userDAO;
    }
    @RequestMapping(value="/add", method=RequestMethod.GET)
    public ModelAndView add(){
        return new ModelAndView("userForm", "userAccount", new UserAccount());
    }

    @RequestMapping(value="/add", method=RequestMethod.POST)
    public String saveUser(@ModelAttribute("userAccount")UserAccount user,
                           BindingResult result, ModelMap model, HttpServletRequest request) throws Exception {

        user.setPassword(LoginForm.getEncryptedPassword(user.getPassword()));
        Date creationDate = new Date();
        user.setCreationDate(creationDate);
        userBdd.saveUser(user);
        // Create a loginform and check in bdd if users exists
        user = userBdd.checkCredentials(user.getEmail(), user.getPassword());
        LoginForm loginForm = new LoginForm();
        loginForm.setPassword(user.getPassword());
        loginForm.setUsername(user.getEmail());
        request.getSession().setAttribute("LOGGEDIN_USER", loginForm);
        request.getSession().setAttribute("USER_INFORMATIONS", user);
        return "redirect:/index";
    }
}
