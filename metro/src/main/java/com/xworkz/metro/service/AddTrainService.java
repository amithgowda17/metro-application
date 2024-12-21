package com.xworkz.metro.service;

import com.xworkz.metro.dto.AddTrainDto;
import java.util.List;

public interface AddTrainService {

    boolean saveTrainTypeAndTrainNumber(AddTrainDto addTrainDto);

    AddTrainDto findByTrainNumberAndTrainType(String trainNumber, String trainType);

    List<AddTrainDto> readAddTrainData();

    //Optional<AddTrainEntity> findById(Integer addTrainId);
    AddTrainDto getTrainTypeService(String trainType);

    AddTrainDto getDetails(Integer addTrainId);

    AddTrainDto findByTrainNumber(String trainNumber);

    boolean updatingMetroDetails(String trainType,String trainNumber,String source,String destination,String fromTime,String toTime,Integer price,String dayOfTheWeek );
}