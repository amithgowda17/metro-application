package com.xworkz.metro.repositry;

import com.xworkz.metro.entity.AddTimingsEntity;

import java.util.List;


public interface AddTimingsRepo {

    boolean addTimings(AddTimingsEntity addTimingsEntity);

    List<AddTimingsEntity> getAllMetroTimingsDetails();
}
