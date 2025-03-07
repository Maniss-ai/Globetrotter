package com.globetrotter.controller;

import com.globetrotter.model.entity.GameSessionPojo;
import com.globetrotter.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/users")
public class UserController {
    private final UserService userService;

    @Autowired
    public UserController(UserService userService) {
        this.userService = userService;
    }

    @PostMapping("/register")
    public GameSessionPojo registerUser(@RequestParam String username) {
        return userService.registerOrGetSession(username);
    }
}
