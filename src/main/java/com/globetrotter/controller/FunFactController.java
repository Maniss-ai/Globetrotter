package com.globetrotter.controller;

import com.globetrotter.service.FunFactService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/destinations")
public class FunFactController {
    private final FunFactService funFactService;

    @Autowired
    public FunFactController(FunFactService funFactService) {
        this.funFactService = funFactService;
    }

    // ✅ Fetch fun facts for a destination
    @GetMapping("/{destinationId}/fun-facts")
    public List<String> getFunFacts(@PathVariable Long destinationId) {
        return funFactService.getFunFactsByDestination(destinationId);
    }
}
