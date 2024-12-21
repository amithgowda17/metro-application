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

import java.util.ArrayList;
import java.util.List;

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

    @Override
    public TimingDto findBySourceAndDestination(String source, String destination) {
        if(source !=null && destination !=null){
            TimingDto timingDto = new TimingDto();
            TimingEntity timingEntity = timingRepository.findBySourceAndDestination(source, destination);
            if(timingEntity != null){
                BeanUtils.copyProperties(timingEntity,timingDto);
                return timingDto;
            }
        }
        return null;
    }

    @Override
    public List<TimingDto> readTime() {
        List<TimingEntity> timingEntities = timingRepository.readTime();
        List<TimingDto> listOfDtos = new ArrayList<>();
        if(!timingEntities.isEmpty()){
            for(TimingEntity timingEntity :timingEntities){
                TimingDto timingDto = new TimingDto();
                BeanUtils.copyProperties(timingEntity,timingDto);
                listOfDtos.add(timingDto);
            }
            return listOfDtos;
        }
        return null;
    }

    @Override
    public TimingDto findByTrainType(String trainType) {
        TimingEntity timingEntity = timingRepository.findByTrainType(trainType);
        TimingDto timingDto = new TimingDto();
        BeanUtils.copyProperties(timingEntity,timingDto);
        return timingDto;
    }

    @Override
    public List<TimingDto> findBySourceAndDestinations(String source, String destination) {
        List<TimingEntity> timingEntities = timingRepository.findingSourceAndDestinations(source, destination);
        List<TimingDto> timingDtos = new ArrayList<>();
        for (TimingEntity timingEntity:timingEntities){
            TimingDto timingDto = new TimingDto();
            BeanUtils.copyProperties(timingEntity,timingDto);
            timingDtos.add(timingDto);
            return timingDtos;
        }
        return null;
    }

    @Override
    public TimingDto findById(Integer timingId) {
        if (timingId !=null){
            TimingDto timingDto = new TimingDto();
            TimingEntity timingEntity = timingRepository.findById(timingId);
            if (timingEntity!=null){
                BeanUtils.copyProperties(timingEntity,timingDto);
                log.info("timingDto {}",timingDto);
                return timingDto;
            }
            log.info("timingEntity",timingEntity);
        }
        return null;
    }

}
