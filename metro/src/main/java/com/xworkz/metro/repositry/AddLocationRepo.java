package com.xworkz.metro.repositry;

import com.xworkz.metro.entity.AddLocationEntity;

import java.util.List;

public interface AddLocationRepo {

    boolean saveLocation(AddLocationEntity addLocationEntity);

    List<AddLocationEntity> getAllLocationDetails();

}
