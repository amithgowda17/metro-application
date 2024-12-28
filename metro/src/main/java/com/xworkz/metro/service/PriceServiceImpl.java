package com.xworkz.metro.service;

import com.xworkz.metro.dto.AddTrainDto;
import com.xworkz.metro.dto.PriceDto;
import com.xworkz.metro.entity.AddTrainEntity;
import com.xworkz.metro.entity.PriceEntity;
import com.xworkz.metro.repositry.AddTrainRepository;
import com.xworkz.metro.repositry.PriceRepository;
import com.xworkz.metro.repositry.TimingRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@Slf4j
public class PriceServiceImpl implements PriceService{

    @Autowired
    private PriceRepository priceRepository;

    @Autowired
    private AddTrainRepository addTrainRepository;

    @Autowired
    private TimingRepository timingRepository;

    private double basePrice = 10.00;

    @Autowired
    AddTrainService addTrainService;

    @Override
    public boolean savePriceFromUi(PriceDto priceDto) {
        if (priceDto == null) {
            return false;
        }
        AddTrainDto addTrainDto = addTrainService.findByTrainNumber(priceDto.getTrainNumber());
        PriceEntity priceEntity = new PriceEntity();
        AddTrainEntity addTrainEntity = addTrainRepository.findTrainNumber(addTrainDto.getTrainNumber());
        PriceEntity bySourceAndDestination = priceRepository.findBySourceAndDestination(priceDto.getSource(), priceDto.getDestination());
        if(bySourceAndDestination==null) {
            if (priceDto.getDistance() == 0) {
                priceDto.setPrice(0);
            }
            else{
                //(fare =basePrice)
                double fare = basePrice + (priceDto.getDistance() * 2);
                if (priceDto.getStationNumber()>3) {
                    fare-=fare*0.02;
                }
                priceDto.setPrice((int) fare);
            }
            BeanUtils.copyProperties(priceDto, priceEntity);
            priceEntity.setAddTrain(addTrainEntity);
            priceRepository.savePriceToDataBase(priceEntity);
            return true;
        }
        return false;
    }

    @Override
    public PriceDto findBySourceAndDestination(String source, String destination) {
        if (source !=null && destination!=null) {
            PriceDto priceDto = new PriceDto();
            log.info("blank pricrDto", priceDto);
            PriceEntity priceEntity = priceRepository.findBySourceAndDestination(source,destination);
            log.info("price in service", priceEntity);
            BeanUtils.copyProperties(priceEntity,priceDto);
            log.info("==========================");
            log.info("after beann utils priceDTo", priceDto);
            return priceDto;
        }
        return null;

    }

}
