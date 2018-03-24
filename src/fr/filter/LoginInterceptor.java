package fr.filter;

import fr.form.LoginForm;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginInterceptor implements HandlerInterceptor{

    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response, Object handler) throws Exception {
        // Avoid a redirect loop for some urls
        System.out.println(request.getRequestURI());
        if(     !request.getRequestURI().equals("/login") &&
                !request.getRequestURI().equals("/user/add") &&
                !request.getRequestURI().equals("/login/social_network") &&
                // Authorize user to access resources if not connected
                !request.getRequestURI().startsWith("/resources"))
        {
            LoginForm userData = (LoginForm) request.getSession().getAttribute("LOGGEDIN_USER");
            if(userData == null)
            {
                response.sendRedirect("/login");
                return false;
            }
        }
        return true;
    }

    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
    //override postHandle() and afterCompletion()
}

