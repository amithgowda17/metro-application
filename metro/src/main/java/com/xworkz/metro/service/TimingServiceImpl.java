package com.xworkz.metro.service;

import com.xworkz.metro.dto.TimingDto;
import com.xworkz.metro.entity.AddTrainEntity;
import com.xworkz.metro.entity.TimingEntity;
import com.xworkz.metro.repositry.AddTrainRepository;
import com.xworkz.metro.repositry.LocationRepository;
import com.xworkz.metro.repositry.TimingRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
@Slf4j
public class TimingServiceImpl implements TimingService{

    @Autowired
    LocationRepository locationRepository;

    @Autowired
    TimingRepository timingRepository;

    @Autowired
    AddTrainRepository addTrainRepository;

    @Override
    public boolean saveTimings(TimingDto timingDto) {
        AddTrainEntity addTrainType = addTrainRepository.findTrainNumber(timingDto.getTrainNumber());
        TimingEntity bySourceAndDestination = timingRepository.findBySourceAndDestination(timingDto.getSource(), timingDto.getDestination());
        TimingEntity timingEntity = new TimingEntity();
        if(bySourceAndDestination==null) {
            BeanUtils.copyProperties(timingDto, timingEntity);
            timingEntity.setAddTrain(addTrainType);
            timingRepository.saveTimingsFromRepo(timingEntity);
            return true;
        }
        return false;
    }



}
