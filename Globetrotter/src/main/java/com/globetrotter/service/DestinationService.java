package com.globetrotter.service;

import com.globetrotter.model.entity.DestinationPojo;
import com.globetrotter.repository.DestinationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class DestinationService {
    private final DestinationRepository destinationRepository;

    @Autowired
    public DestinationService(DestinationRepository destinationRepository) {
        this.destinationRepository = destinationRepository;
    }

    public List<DestinationPojo> findAllDestinations() {
        return destinationRepository.findAll();
    }

    public Optional<DestinationPojo> findDestinationById(Long id) {
        return destinationRepository.findById(id);
    }

    public DestinationPojo saveDestination(DestinationPojo destinationPojo) {
        return destinationRepository.save(destinationPojo);
    }

    public DestinationPojo updateDestination(Long id, DestinationPojo newDestinationPojoData) {
        return destinationRepository.findById(id)
                .map(destination -> {
                    destination.setCity(newDestinationPojoData.getCity());
                    destination.setCountry(newDestinationPojoData.getCountry());
                    return destinationRepository.save(destination);
                })
                .orElseGet(() -> {
                    newDestinationPojoData.setId(id);
                    return destinationRepository.save(newDestinationPojoData);
                });
    }

    public void deleteDestination(Long id) {
        destinationRepository.deleteById(id);
    }
}

