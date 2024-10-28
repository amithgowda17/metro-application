package com.xworkz.metro.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AddTimingsDto {

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
    private String fromTimings;

    @NotBlank
    @NotNull
    @NotEmpty
    private String toTimings;

    @NotBlank
    @NotNull
    @NotEmpty
    private String metroType;

    @NotBlank
    @NotNull
    @NotEmpty
    private String from;

    @NotBlank
    @NotNull
    @NotEmpty
    private String to;

}
