package com.xworkz.metro.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "metro_price")
public class AddPriceEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name="source")
    private String sourceStation;

    @Column(name="destination")
    private String destinationStation;

    @Column(name="metro_type")
    private String metroType;

    @Column(name="price")
    private String addPrice;


}
