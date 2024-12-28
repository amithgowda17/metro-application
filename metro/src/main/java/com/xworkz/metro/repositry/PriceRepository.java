package com.xworkz.metro.repositry;

import com.xworkz.metro.entity.PriceEntity;

import java.util.List;

public interface PriceRepository {

    String savePriceToDataBase(PriceEntity priceEntity);

    PriceEntity findBySourceAndDestination(String source,String destination);

    PriceEntity findById(Integer priceId);


}
