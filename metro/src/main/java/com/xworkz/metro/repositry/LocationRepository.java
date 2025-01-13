package com.xworkz.metro.repositry;

import com.xworkz.metro.entity.LocationEntity;

import java.util.List;

public interface LocationRepository {

    void onLocationSave(LocationEntity locationEntity);

    LocationEntity findByTrainNumber(String trainNumber);

    List<LocationEntity> readLocation();



}
