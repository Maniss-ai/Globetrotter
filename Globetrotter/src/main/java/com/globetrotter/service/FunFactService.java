package com.globetrotter.service;

import com.globetrotter.model.entity.FunFactPojo;
import com.globetrotter.repository.FunFactRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class FunFactService {
    private final FunFactRepository funFactRepository;

    @Autowired
    public FunFactService(FunFactRepository funFactRepository) {
        this.funFactRepository = funFactRepository;
    }

    // ✅ Fetch fun facts for a given destination
    public List<String> getFunFactsByDestination(Long destinationId) {
        List<FunFactPojo> funFacts = funFactRepository.findByDestinationPojoId(destinationId);

        return funFacts.stream()
                .map(FunFactPojo::getFactText)
                .collect(Collectors.toList());
    }
}
