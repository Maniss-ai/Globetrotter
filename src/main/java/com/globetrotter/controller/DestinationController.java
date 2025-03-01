package com.globetrotter.controller;

import com.globetrotter.dto.DestinationDTO;
import com.globetrotter.mapper.DestinationMapper;
import com.globetrotter.model.entity.DestinationPojo;
import com.globetrotter.service.DestinationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping("/api/destinations")
public class DestinationController {
    private final DestinationService destinationService;

    @Autowired
    public DestinationController(DestinationService destinationService) {
        this.destinationService = destinationService;
    }

    @GetMapping("/{id}")
    public ResponseEntity<DestinationDTO> getDestinationById(@PathVariable Long id) {
        return destinationService.findDestinationById(id)
                .map(DestinationMapper::toDTO)
                .map(ResponseEntity::ok)
                .orElseGet(() -> ResponseEntity.notFound().build());
    }

    @PostMapping
    public DestinationDTO createDestination(@RequestBody DestinationDTO destinationDTO) {
        DestinationPojo savedDestinationPojo = destinationService.saveDestination(DestinationMapper.toEntity(destinationDTO));
        return DestinationMapper.toDTO(savedDestinationPojo);
    }

    @PutMapping("/{id}")
    public ResponseEntity<DestinationDTO> updateDestination(@PathVariable Long id, @RequestBody DestinationDTO destinationDTO) {
        DestinationPojo updatedDestinationPojo = destinationService.updateDestination(id, DestinationMapper.toEntity(destinationDTO));
        return ResponseEntity.ok(DestinationMapper.toDTO(updatedDestinationPojo));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteDestination(@PathVariable Long id) {
        destinationService.deleteDestination(id);
        return ResponseEntity.ok().build();
    }
}

