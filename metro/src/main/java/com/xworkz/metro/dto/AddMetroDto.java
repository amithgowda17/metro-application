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
public class AddMetroDto {

    @NotBlank
    @NotNull
    @NotEmpty
    private String metroType;

    @NotBlank
    @NotNull
    @NotEmpty
    private String metroNumber;





}
