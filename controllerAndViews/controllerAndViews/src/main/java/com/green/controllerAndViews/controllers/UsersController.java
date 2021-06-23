package com.green.controllerAndViews.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.green.controllerAndViews.models.LoginUser;
import com.green.controllerAndViews.models.User;
import com.green.controllerAndViews.services.UserService;


@Controller
public class UsersController {

	@Autowired
	private UserService userService;
    
    @GetMapping("/")
    public String index(Model model, @ModelAttribute("newUser") User user) {
    	model.addAttribute("newLogin", new LoginUser());
        return "index.jsp";
    }
    
    @GetMapping("/home")
    public String home(Model model, HttpSession session) {
    	if(session.getAttribute("user_id") == null) {
    		return "redirect:/";
    	}
    	Long loggedInId = (Long)session.getAttribute("user_id");
    	User loggedIn = this.userService.findOneUser(loggedInId);
    	model.addAttribute("loggedInUser", loggedIn);
    	return "homePage.jsp";
    }
    
    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User newUser, BindingResult result, Model model, HttpSession session) {
        this.userService.register(newUser, result);
        if(result.hasErrors()) {
        	model.addAttribute("newLogin", new LoginUser());
        	return "index.jsp";
        }
        session.setAttribute("user_id", newUser.getId());
        return "redirect:/home";
    }
    
    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, BindingResult result, Model model, HttpSession session) {
    	User user = this.userService.login(newLogin, result);
    	if(result.hasErrors()) {
    		model.addAttribute("newUser", new User());
    		return "index.jsp";
    	}
    	session.setAttribute("user_id", user.getId());
    
    	return "redirect:/home";
	}
    
    @GetMapping("/logout")
    public String logout(HttpSession session) {
    	session.removeAttribute("user_id");
    	return "redirect:/";
    }
}