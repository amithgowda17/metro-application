package com.xworkz.metro.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name="metro_timings")
public class AddTimingsEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private  int id;

    @Column(name="source")
    private String sourceStation;

    @Column(name="destination")
    private String destinationStation;

    @Column(name="from_timings")
    private String fromTimings;

    @Column(name="to_timings")
    private String toTimings;

    @Column(name="metro_type")
    private String metroType;

    @Column(name = "from_day")
    private String from;

    @Column(name = "to_day")
    private String to;


}
