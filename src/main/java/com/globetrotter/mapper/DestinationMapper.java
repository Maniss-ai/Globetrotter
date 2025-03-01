package com.globetrotter.mapper;

import com.globetrotter.dto.DestinationDTO;
import com.globetrotter.model.entity.DestinationPojo;

public class DestinationMapper {
    public static DestinationDTO toDTO(DestinationPojo destinationPojo) {
        DestinationDTO dto = new DestinationDTO();
        dto.setId(destinationPojo.getId());
        dto.setCity(destinationPojo.getCity());
        dto.setCountry(destinationPojo.getCountry());
        return dto;
    }

    public static DestinationPojo toEntity(DestinationDTO dto) {
        DestinationPojo destinationPojo = new DestinationPojo();
        destinationPojo.setId(dto.getId());
        destinationPojo.setCity(dto.getCity());
        destinationPojo.setCountry(dto.getCountry());
        return destinationPojo;
    }
}

