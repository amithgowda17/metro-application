package com.xworkz.metro.service;

import com.xworkz.metro.dto.AddTrainDto;
import java.util.List;

public interface AddTrainService {

    boolean saveTrainTypeAndTrainNumber(AddTrainDto addTrainDto);


    List<AddTrainDto> readAddTrainData();


    AddTrainDto getDetails(Integer number);

    AddTrainDto findByTrainNumber(String trainNumber);

    boolean updatingMetroDetails(String trainType,String trainNumber,String source,String destination,String fromTime,String toTime,Integer price,String dayOfTheWeek );
}