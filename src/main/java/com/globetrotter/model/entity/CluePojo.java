package com.globetrotter.model.entity;

import lombok.Data;
import lombok.NoArgsConstructor;
import jakarta.persistence.*;
import lombok.ToString;

@Entity
@Table(name = "clues")
@Data
@NoArgsConstructor
@ToString(exclude = "destinationPojo") // ✅ Prevents infinite recursion
public class CluePojo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "destination_id")
    private DestinationPojo destinationPojo;

    private String clueText;
}

