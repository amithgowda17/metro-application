package com.xworkz.metro.service;

import com.xworkz.metro.dto.AddMetroDto;
import com.xworkz.metro.entity.AddMetroEntity;
import com.xworkz.metro.repositry.AddMetroRepo;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AddMetroServiceImpl implements AddMetroService{

    @Autowired
    AddMetroRepo addMetroRepo;


    @Override
    public String addMetro(AddMetroDto addMetroDto) {
        AddMetroEntity addMetroEntity=new AddMetroEntity();
        BeanUtils.copyProperties(addMetroDto,addMetroEntity);
        boolean isSaved = addMetroRepo.addMetro(addMetroEntity);
        if (isSaved){
            return "data added successfully";
        }
        return "data not saved";

    }
}
