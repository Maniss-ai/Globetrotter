package com.globetrotter.model.entity;

import lombok.Data;
import lombok.NoArgsConstructor;
import jakarta.persistence.*;
import java.util.List;

@Entity
@Table(name = "destinations")
@Data
@NoArgsConstructor
public class DestinationPojo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String city;
    private String country;

    @OneToMany(mappedBy = "destinationPojo", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<CluePojo> cluePojos;

    @OneToMany(mappedBy = "destinationPojo", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<FunFactPojo> funFactPojos;

    @OneToMany(mappedBy = "destinationPojo", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<TriviaPojo> triviaPojo;
}

