package com.xworkz.metro.entity;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name = "price")
@NamedQuery(name = "findBySourceAndDestination",
        query = "SELECT entities FROM PriceEntity entities WHERE entities.source=:source AND entities.destination=:destination")
@NamedQuery(name = "readPrice",query="Select entities from PriceEntity entities")
@NamedQuery(name="priceId",query = "SELECT p FROM PriceEntity p WHERE p.priceId = :priceId")
@NamedQuery(name="trainType",query = "SELECT s FROM PriceEntity s WHERE s.trainType = :trainType")
@NamedQuery(name = "findPrice",
        query = "SELECT entity FROM PriceEntity entity WHERE entity.price=:price")
@NamedQuery(name = "findPriceBySourceAndDestination",query = "SELECT p.price FROM PriceEntity p WHERE p.source = :source AND p.destination = :destination")

public class PriceEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer priceId;
    private String source;
    private String destination;
    private String trainType;
    private Double distance;
    private String station;
    private Integer stationNumber;
    private String trainNumber;
    private Integer price;

    @ManyToOne
    //   @JoinColumn(name = "addTrainId",referencedColumnName = "addTrainId")
    private AddTrainEntity addTrain;

    @Override
    public String toString() {
        return "PriceEntity{" +
                "priceId=" + priceId +
                ", source='" + source + '\'' +
                ", destination='" + destination + '\'' +
                ", trainType='" + trainType + '\'' +
                ", price=" + price +
                ", addTrain=" + (addTrain!=null?addTrain.getTrainType():"Train not found" )+
                '}';
    }
}