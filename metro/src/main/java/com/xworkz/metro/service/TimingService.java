package com.xworkz.metro.service;

import com.xworkz.metro.dto.TimingDto;

import java.util.List;

public interface TimingService {

    boolean saveTimings(TimingDto timingDto);

    TimingDto findBySourceAndDestination(String source,String destination);

    List<TimingDto> readTime();

    TimingDto findByTrainType(String trainType);

    List<TimingDto> findBySourceAndDestinations(String source,String destination);

    TimingDto findById(Integer timingId);

}
