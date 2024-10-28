package com.xworkz.metro.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AddPriceDto {

    @NotBlank
    @NotNull
    @NotEmpty
    private String sourceStation;

    @NotBlank
    @NotNull
    @NotEmpty
    private String destinationStation;

    @NotBlank
    @NotNull
    @NotEmpty
    private String metroType;

    @NotBlank
    @NotNull
    @NotEmpty
    private String addPrice;


}
