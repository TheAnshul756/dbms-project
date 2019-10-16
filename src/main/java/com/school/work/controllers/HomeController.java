package com.school.work.controllers;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping("/")
    public String main(Model m){
        return "redirect:/home";
    }

    @GetMapping("/home")
    public String home(Model m){
        // String username = p.getName();
        return "index";
    }

}