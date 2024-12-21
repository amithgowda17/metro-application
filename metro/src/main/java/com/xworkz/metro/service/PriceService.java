package com.xworkz.metro.service;

import com.xworkz.metro.dto.PriceDto;

import java.util.List;

public interface PriceService {

    boolean savePriceFromUi(PriceDto priceDto);

    PriceDto findBySourceAndDestination(String source,String destination);

    List<PriceDto> readPrice();

    PriceDto   findPrice(Integer price);

    PriceDto findPriceBySourceAndDestination(Integer price,String source,String destination);

    PriceDto findById(Integer priceId);

}
