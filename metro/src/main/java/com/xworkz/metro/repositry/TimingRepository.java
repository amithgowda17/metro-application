package com.xworkz.metro.repositry;

import com.xworkz.metro.entity.TimingEntity;

import java.util.List;

public interface TimingRepository {

    String saveTimingsFromRepo(TimingEntity timingEntity);

    String TheUpdatedTimings(TimingEntity timingEntity);

    TimingEntity findBySourceAndDestination(String source,String destination);

    List<TimingEntity> readTime();

    TimingEntity findByTrainType(String trainType);

    List<TimingEntity> findingSourceAndDestinations(String source,String destination);

    TimingEntity findById(Integer timingId);

}
