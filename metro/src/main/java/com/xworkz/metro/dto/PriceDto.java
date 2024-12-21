package com.xworkz.metro.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PriceDto {

    private Integer priceId;
    @NotEmpty(message = "source must not be empty")
    @NotNull(message = "source must not be null")
    @NotBlank(message = "source must not be blank")
    private String source;
    @NotEmpty(message = "destination must not be empty")
    @NotNull(message = "destination must not be null")
    @NotBlank(message = "destination must not be blank")
    private String destination;
    private String trainType;
    private Double distance;
    private String station;
    private Integer stationNumber;
    private String trainNumber;
    private Integer price;
    private  AddTrainDto addTrainDto;

}
