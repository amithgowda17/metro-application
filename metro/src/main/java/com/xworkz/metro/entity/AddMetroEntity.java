package com.xworkz.metro.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import net.bytebuddy.dynamic.loading.InjectionClassLoader;

import javax.persistence.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "add_metro")
@NamedQuery(name = "ReadAllMetro",query = "Select entities from AddMetroEntity entities")
public class AddMetroEntity {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name="metro_type")
    private String metroType;

    @Column(name="metro_number")
    private String metroNumber;


}
