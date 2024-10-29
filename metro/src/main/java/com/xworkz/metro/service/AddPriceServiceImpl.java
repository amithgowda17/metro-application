package com.xworkz.metro.service;

import com.xworkz.metro.dto.AddPriceDto;
import com.xworkz.metro.entity.AddPriceEntity;
import com.xworkz.metro.repositry.AddPriceRepo;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AddPriceServiceImpl implements AddPriceService{

    @Autowired
    AddPriceRepo addPriceRepo;


    @Override
    public String addPrice(AddPriceDto addPriceDto) {
        AddPriceEntity addPriceEntity=new AddPriceEntity();
        BeanUtils.copyProperties(addPriceDto,addPriceEntity);
        boolean isSaved = addPriceRepo.addPrice(addPriceEntity);
        if (isSaved){
            return "data added successfully";
        }
        return "data not saved";
    }
}
