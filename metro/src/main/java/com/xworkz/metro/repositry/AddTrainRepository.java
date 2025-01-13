package com.xworkz.metro.repositry;

import com.xworkz.metro.entity.AddTrainEntity;

import java.util.List;

public interface AddTrainRepository {

    void saveTrainTypeAndNumber(AddTrainEntity addTrainEntity);

    AddTrainEntity findByTrainNumberAndTrainType(String trainNumber, String trainType);

    List<AddTrainEntity> readAddTrainDetails();

    AddTrainEntity findById(Integer addTrainId);

    AddTrainEntity findTrainNumber(String trainNumber);

    void savingTheUpdateDetails(AddTrainEntity addTrainEntity);

}
