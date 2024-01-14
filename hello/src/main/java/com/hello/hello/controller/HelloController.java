package com.hello.hello.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {
    
    @RequestMapping("/hello")
    public String hello(){
        return "Test Spring Boot";
    }
}
