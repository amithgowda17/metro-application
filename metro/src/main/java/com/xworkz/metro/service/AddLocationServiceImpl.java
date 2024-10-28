package com.xworkz.metro.service;

import com.xworkz.metro.dto.AddLocationDto;
import com.xworkz.metro.entity.AddLocationEntity;
import com.xworkz.metro.repositry.AddLocationRepo;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AddLocationServiceImpl implements AddLocationService{

    @Autowired
    AddLocationRepo addLocationRepo;

    @Override
    public void addLocation(AddLocationDto addLocationDto) {
        AddLocationEntity addLocationEntity=new AddLocationEntity();
        BeanUtils.copyProperties(addLocationDto,addLocationEntity);
        addLocationRepo.saveLocation(addLocationEntity);
    }
}
