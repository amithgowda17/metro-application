package com.xworkz.metro.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TicketDto {
    private Integer ticketId;
    private Integer userId;
    private String source;
    private String destination;
    private Integer price;
    private String tokenNumber;
}