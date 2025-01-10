package com.xworkz.metro.service;

import com.xworkz.metro.dto.AddTrainDto;
import com.xworkz.metro.dto.LocationDto;
import com.xworkz.metro.dto.PriceDto;
import com.xworkz.metro.dto.TimingDto;
import com.xworkz.metro.entity.AddTrainEntity;
import com.xworkz.metro.entity.PriceEntity;
import com.xworkz.metro.entity.TimingEntity;
import com.xworkz.metro.repositry.AddTrainRepository;
import com.xworkz.metro.repositry.LocationRepository;
import com.xworkz.metro.repositry.PriceRepository;
import com.xworkz.metro.repositry.TimingRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@Slf4j
public class AddTrainServiceImpl implements AddTrainService{

    @Autowired
    AddTrainRepository addTrainRepository;

    @Autowired
    LocationRepository locationRepository;

    @Autowired
    PriceRepository priceRepository;

    @Autowired
    TimingRepository timingRepository;

    @Autowired
    TimingService timingService;


    @Override
    public boolean saveTrainTypeAndTrainNumber(AddTrainDto addTrainDto) {
        if (addTrainDto != null) {
            AddTrainEntity addTrainEntity1 = addTrainRepository.findByTrainNumberAndTrainType(addTrainDto.getTrainNumber(), addTrainDto.getTrainType());
            if (addTrainEntity1 == null) {
                AddTrainEntity addTrainEntity = new AddTrainEntity();
                BeanUtils.copyProperties(addTrainDto, addTrainEntity);
                addTrainRepository.saveTrainTypeAndNumber(addTrainEntity);
                return true;
            }
        }
        return false;
    }


    @Override
    public List<AddTrainDto> readAddTrainData() {
        List<AddTrainEntity> addTrainEntities = addTrainRepository.readAddTrainDetails();

        List<AddTrainDto> addTrainDtoList=  addTrainEntities.stream().map(addTrainEntity -> {
            AddTrainDto  addTrainDto =new AddTrainDto();
            BeanUtils.copyProperties(addTrainEntity,addTrainDto);

            if (addTrainEntity.getLocations()!=null){
                List<LocationDto> locationDtoList =  addTrainEntity.getLocations().stream().map(locationEntity -> {
                    LocationDto locationDto =new LocationDto();
                    BeanUtils.copyProperties(locationEntity,locationDto);
                    return locationDto;
                }).collect(Collectors.toList());
                addTrainDto.setLocations(locationDtoList);
            }

            if (addTrainEntity.getPriceEntity() != null) {
                List<PriceDto> priceDtoList= addTrainEntity.getPriceEntity().stream().map(priceEntity -> {
                    PriceDto priceDto=new PriceDto();
                    BeanUtils.copyProperties(priceEntity,priceDto);
                    return priceDto;
                }).collect(Collectors.toList());
                addTrainDto.setPriceEntity(priceDtoList);
            }

            if (addTrainEntity.getTimingEntity()!=null){
                List<TimingDto> timingDtoList = addTrainEntity.getTimingEntity().stream().map(timingEntity -> {
                    TimingDto timingDto=new TimingDto();
                    BeanUtils.copyProperties(timingEntity,timingDto);
                    return timingDto;
                }).collect(Collectors.toList());
                addTrainDto.setTimingEntity(timingDtoList);
            }

            return addTrainDto;
        }).collect(Collectors.toList());

//        log.info("List in repo {}",addTrainDtoList);
        return  addTrainDtoList;
    }


    @Override
    public AddTrainDto getDetails(Integer addTrainId) {
        if (addTrainId!=null){
            String id = String.valueOf(addTrainId);
            AddTrainDto addTrainDto = new AddTrainDto();
            AddTrainEntity addTrainEntity = addTrainRepository.findById(Integer.valueOf(id));
            log.info("addTrainEntity {}",addTrainEntity);
            if (addTrainEntity!=null){
                BeanUtils.copyProperties(addTrainEntity,addTrainDto);
                if (addTrainEntity.getTimingEntity()!=null){
                    List<TimingDto> timingDtoList = addTrainEntity.getTimingEntity().stream().map(timingEntity -> {
                        TimingDto timingDto=new TimingDto();
                        BeanUtils.copyProperties(timingEntity,timingDto);
                        return timingDto;
                    }).collect(Collectors.toList());
                    addTrainDto.setTimingEntity(timingDtoList);
                }
                if (addTrainEntity.getPriceEntity() != null) {
                    List<PriceDto> priceDtoList= addTrainEntity.getPriceEntity().stream().map(priceEntity -> {
                        PriceDto priceDto=new PriceDto();
                        BeanUtils.copyProperties(priceEntity,priceDto);
                        return priceDto;
                    }).collect(Collectors.toList());
                    addTrainDto.setPriceEntity(priceDtoList);
                }
                if (addTrainEntity.getLocations()!=null){
                    List<LocationDto> locationDtoList =  addTrainEntity.getLocations().stream().map(locationEntity -> {
                        LocationDto locationDto =new LocationDto();
                        BeanUtils.copyProperties(locationEntity,locationDto);
                        return locationDto;
                    }).collect(Collectors.toList());
                    addTrainDto.setLocations(locationDtoList);
                }
                return addTrainDto;
            }
        }
        return null;


    }

    @Override
    public AddTrainDto findByTrainNumber(String trainNumber) {
        if (trainNumber != null) {
            AddTrainDto addTrainDto = new AddTrainDto();
            AddTrainEntity addTrainEntity = addTrainRepository.findTrainNumber(trainNumber);
            BeanUtils.copyProperties(addTrainEntity, addTrainDto);
            return addTrainDto;
        }
        return null;
    }

    @Override
    public boolean updatingMetroDetails(Integer addTrainID,String trainType,String trainNumber,String source,String destination,String fromTime,String toTime,Integer price,String dayOfTheWeek) {
        AddTrainEntity addTrainEntity = addTrainRepository.findById(addTrainID);
        log.info("train number=========={}",trainNumber);
        PriceEntity priceEntity = priceRepository.findById(addTrainEntity.getAddTrainId());
        TimingEntity timingEntity = timingRepository.findById(addTrainEntity.getAddTrainId());
        log.info("addtrain entity in service ================ {}",addTrainEntity);
        if (addTrainEntity!=null){
            addTrainEntity.setTrainType(trainType);
            addTrainEntity.setTrainNumber(trainNumber);
            log.info("addtrainentity after updation==========={}",addTrainEntity);
            addTrainRepository.savingTheUpdateDetails(addTrainEntity);
            if (addTrainEntity.getAddTrainId().equals(priceEntity.getAddTrain().getAddTrainId())){
                priceEntity.setPrice(price);
                log.info("price entity after updation==========={}",priceEntity);
                log.info("============================{}",priceEntity.getAddTrain().getAddTrainId());
                priceRepository.savePriceToDataBase(priceEntity);
                if (addTrainEntity.getAddTrainId().equals(timingEntity.getAddTrain().getAddTrainId())){
                    timingEntity.setSource(source);
                    timingEntity.setDestination(destination);
                    timingEntity.setFromTime(fromTime);
                    timingEntity.setToTime(toTime);
                    timingEntity.setDayOfTheWeek(dayOfTheWeek);
                    log.info("timing entity after updation==========={}",timingRepository);
                    timingRepository.TheUpdatedTimings(timingEntity);
                    return true;
                }
            }             return true;

        }
        log.info("timingEntity*********************** {}",timingEntity);
        return false;
    }
}
