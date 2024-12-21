package com.xworkz.metro.repositry;

import com.xworkz.metro.entity.PriceEntity;

import java.util.List;

public interface PriceRepository {

    String savePriceToDataBase(PriceEntity priceEntity);

    PriceEntity findBySourceAndDestination(String source,String destination);

    List<PriceEntity> readPrice();

    PriceEntity findById(Integer priceId);

    PriceEntity findByTrainType(String trainType);

    PriceEntity findByPrice(Integer price);

    PriceEntity findPriceBySourceAndDestination(Integer price,String source,String destination);

}
