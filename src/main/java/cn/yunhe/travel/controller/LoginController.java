package cn.yunhe.travel.controller;

import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class LoginController {

    @RequestMapping("/toLogin")
    public String toLogin(){
        return "login";
    }

    @RequestMapping("/toFail")
    public String toFail(){
        return "failer";
    }

    @RequestMapping("/fail")
    public String fail(){
        return "403";
    }

    @RequestMapping("/main")
    public String main(){
        return "index";
    }

    @RequestMapping("/getUsername")
    @ResponseBody
    public String getUsername(){
        User principal = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = principal.getUsername();
        return username;
    }
}
