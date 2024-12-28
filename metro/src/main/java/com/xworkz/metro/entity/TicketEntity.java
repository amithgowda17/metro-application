package com.xworkz.metro.entity;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name = "TicketData")
@NamedQuery(name = "findUserIdTicketHistory",
        query = "SELECT entity FROM TicketEntity entity WHERE entity.userId=:userId")
public class TicketEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer ticketId;
    private Integer userId;
    private String source;
    private String destination;
    private Integer price;
    private String tokenNumber;

}