package com.xworkz.metro.repositry;

import com.xworkz.metro.entity.TimingEntity;


public interface TimingRepository {

    void saveTimingsFromRepo(TimingEntity timingEntity);

    void TheUpdatedTimings(TimingEntity timingEntity);

    TimingEntity findById(Integer addTrainId);

    TimingEntity findBySourceAndDestination(String source, String destination);
}
