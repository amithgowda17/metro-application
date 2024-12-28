package com.xworkz.metro.service;

import com.xworkz.metro.dto.PriceDto;

import java.util.List;

public interface PriceService {

    boolean savePriceFromUi(PriceDto priceDto);

    PriceDto findBySourceAndDestination(String source,String destination);




}
