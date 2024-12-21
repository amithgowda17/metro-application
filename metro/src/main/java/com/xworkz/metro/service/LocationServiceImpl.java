package com.xworkz.metro.service;

import com.xworkz.metro.dto.LocationDto;
import com.xworkz.metro.entity.AddTrainEntity;
import com.xworkz.metro.entity.LocationEntity;
import com.xworkz.metro.repositry.AddTrainRepository;
import com.xworkz.metro.repositry.LocationRepository;
import com.xworkz.metro.repositry.MetroRepo;
import com.xworkz.metro.repositry.PriceRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@Slf4j
public class LocationServiceImpl implements LocationService{

    @Autowired
    LocationRepository locationRepository;

    @Autowired
    MetroRepo metroRepo;

    @Autowired
    AddTrainRepository addTrainRepository;

    @Autowired
    PriceRepository priceRepository;

    @Override
    public boolean onSaveLocationAndType(LocationDto locationDto) {
        AddTrainEntity addTrainId = addTrainRepository.findByTrainNumberAndTrainType(locationDto.getTrainNumber(), locationDto.getTrainType());
        LocationEntity locationEntity = new LocationEntity();
        BeanUtils.copyProperties(locationDto, locationEntity);
        log.info("location Entity from Repo"+locationEntity);
        locationEntity.setAddTrain(addTrainId);
        log.info("addTrainId from addTrain Repo"+ addTrainId);
        locationRepository.onLocationSave(locationEntity);
        return true;
    }




    @Override
    public LocationDto findByTrainNumber(String trainNumber) {
        System.out.println(trainNumber);
        if(trainNumber !=null){
            log.info("============trainNumber===================="+trainNumber);
            LocationDto locationDto = new LocationDto();
            LocationEntity locationEntity = locationRepository.findByTrainNumber(trainNumber);
            System.out.println("");
            if(locationEntity != null){
                BeanUtils.copyProperties(locationEntity,locationDto);
                return locationDto;
            }
        }
        return null;
    }

    @Override
    public List<LocationDto> readLocation() {
        List<LocationEntity> listOfLocationEntities = locationRepository.readLocation();
        List<LocationDto> listOfDtos = new ArrayList<>();
        if(!listOfLocationEntities.isEmpty()){
            for (LocationEntity locationEntity :listOfLocationEntities){
                LocationDto locationDto = new LocationDto();
                BeanUtils.copyProperties(locationEntity,locationDto);
                listOfDtos.add(locationDto);
            }
            return listOfDtos;
        }
        return null;
    }

}
