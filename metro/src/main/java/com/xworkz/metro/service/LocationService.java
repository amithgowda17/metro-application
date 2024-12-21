package com.xworkz.metro.service;

import com.xworkz.metro.dto.LocationDto;

import java.util.List;

public interface LocationService {

    boolean onSaveLocationAndType(LocationDto locationDto);

    LocationDto findByTrainNumber(String trainNumber);

    List<LocationDto> readLocation();

}
