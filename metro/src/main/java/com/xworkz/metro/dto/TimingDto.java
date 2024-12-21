package com.xworkz.metro.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TimingDto {

    private Integer timingId;
    private String trainType;
    private String trainNumber;
    private String fromTime;
    private String toTime;
    private String source;
    private String destination;
    private String dayOfTheWeek;
    private AddTrainDto addTrainDto;

}