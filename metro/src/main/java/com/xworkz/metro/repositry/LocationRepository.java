package com.xworkz.metro.repositry;

import com.xworkz.metro.entity.LocationEntity;

import java.util.List;

public interface LocationRepository {

    String onLocationSave(LocationEntity locationEntity);

    LocationEntity findByTrainNumber(String trainNumber);

    List<LocationEntity> readLocation();

    LocationEntity findByTrainType(String trainType);

}
