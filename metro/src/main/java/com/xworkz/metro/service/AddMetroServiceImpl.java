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
    public void addMetro(AddMetroDto addMetroDto) {
        AddMetroEntity addMetroEntity=new AddMetroEntity();
        BeanUtils.copyProperties(addMetroDto,addMetroEntity);
        addMetroRepo.addMetro(addMetroEntity);

    }
}
