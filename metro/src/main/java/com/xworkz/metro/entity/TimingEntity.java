package com.xworkz.metro.entity;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@NamedQuery(name = "getTimings",query = "Select entity from TimingEntity entity where entity.addTrain.addTrainId=:addTrainId")
@NamedQuery(name = "getBySourceAndDestination",query = "Select t from TimingEntity t where t.source=:source AND t.destination=:destination ")
@Table(name = "timings")

public class TimingEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer timingId;

    private String trainType;
    private String fromTime;
    private String toTime;
    private String source;
    private String destination;
    private String dayOfTheWeek;

    @ManyToOne
    private AddTrainEntity addTrain;


    @Override
    public String toString() {
        return "TimingEntity{" +
                "timingId=" + timingId +
                ", trainType='" + trainType + '\'' +
                ", fromTime='" + fromTime + '\'' +
                ", toTime='" + toTime + '\'' +
                ", source='" + source + '\'' +
                ", destination='" + destination + '\'' +
                ", dayOfTheWeek='" + dayOfTheWeek + '\'' +
                ", addTrain=" + (addTrain!=null?addTrain.getAddTrainId():"Train not found") +
                '}';
    }
}