package com.xworkz.metro.entity;

import lombok.Data;
import lombok.ToString;

import javax.persistence.*;
import java.util.List;

@Data
@Entity
@ToString
@Table(name = "addTrain")
@NamedQuery(name = "findByTrainNumberAndTrainType",
        query = "SELECT t FROM AddTrainEntity t WHERE t.trainNumber =:trainNumber AND t.trainType = :trainType")
@NamedQuery(name = "readTrain", query = "Select entities from AddTrainEntity entities")
@NamedQuery(name = "getAllDetailsById", query = "SELECT entity FROM AddTrainEntity entity WHERE entity.addTrainId=:addTrainId")
@NamedQuery(name="findNumber",query = "SELECT t FROM AddTrainEntity t WHERE  t.trainNumber = :number")

public class AddTrainEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "addTrainId")
    private Integer addTrainId;
    private String trainNumber;
    private String trainType;

    @OneToMany(mappedBy = "addTrain", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<LocationEntity> locations;
    @OneToMany(mappedBy = "addTrain",fetch = FetchType.LAZY,cascade = CascadeType.ALL)
    private List<PriceEntity> priceEntity;
    @OneToMany(mappedBy = "addTrain",fetch = FetchType.LAZY,cascade = CascadeType.ALL)
    private List<TimingEntity> timingEntity;

    @Override
    public String toString() {
        return "AddTrainEntity{" +
                "addTrainId=" + addTrainId +
                ", trainNumber='" + trainNumber + '\'' +
                ", trainType='" + trainType + '\'' +
                ", locations=" + (locations!=null?locations:"location not found") +
                ", priceEntity=" + (priceEntity!=null?priceEntity:"price not found")+
                ", timingEntity=" + (timingEntity!=null?timingEntity:"timing not found") +
                '}';
    }
}