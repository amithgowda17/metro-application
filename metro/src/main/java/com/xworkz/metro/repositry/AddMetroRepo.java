package com.xworkz.metro.repositry;

import com.xworkz.metro.entity.AddMetroEntity;

import java.util.List;

public interface AddMetroRepo {

    boolean addMetro(AddMetroEntity addMetroEntity);

    List<AddMetroEntity> getAllMetroDetails();
}
