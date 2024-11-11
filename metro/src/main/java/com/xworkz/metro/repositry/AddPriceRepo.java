package com.xworkz.metro.repositry;

import com.xworkz.metro.entity.AddPriceEntity;

import java.util.List;

public interface AddPriceRepo {

    boolean addPrice(AddPriceEntity addPriceEntity);

    List<AddPriceEntity> getAllMetroPrice();
}
