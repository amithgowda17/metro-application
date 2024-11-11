package com.xworkz.metro.entity;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "metro_location")
@NamedQuery(name = "ReadAllLocation",query="Select entities from AddLocationEntity entities")
public class AddLocationEntity {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name="metro_type")
    private String metroType;

    @Column(name="location_name")
    private String locationName;
}
