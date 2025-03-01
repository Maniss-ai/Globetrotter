package com.globetrotter.model.entity;

import lombok.Data;
import lombok.NoArgsConstructor;
import jakarta.persistence.*;

@Entity
@Table(name = "fun_facts")
@Data
@NoArgsConstructor
public class FunFactPojo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "destination_id")
    private DestinationPojo destinationPojo;

    @Column(nullable = false, length = 500)
    private String factText;
}

