package com.xworkz.metro.service;

import com.xworkz.metro.dto.AddTimingsDto;
import com.xworkz.metro.entity.AddTimingsEntity;
import com.xworkz.metro.repositry.AddTimingsRepo;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AddTimingsServiceImpl implements AddTimingsService{

    @Autowired
    AddTimingsRepo addTimingsRepo;

    @Override
    public String addTimings(AddTimingsDto addTimingsDto) {

        AddTimingsEntity addTimingsEntity=new AddTimingsEntity();
        BeanUtils.copyProperties(addTimingsDto,addTimingsEntity);
        boolean isSaved = addTimingsRepo.addTimings(addTimingsEntity);
        if (isSaved){
            return "data added successfully";
        }
        return "data not saved";
    }
}
