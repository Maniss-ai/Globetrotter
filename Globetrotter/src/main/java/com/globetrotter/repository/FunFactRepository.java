package com.globetrotter.repository;

import com.globetrotter.model.entity.FunFactPojo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FunFactRepository extends JpaRepository<FunFactPojo, Long> {
    List<FunFactPojo> findByDestinationPojoId(Long destinationId);
}

