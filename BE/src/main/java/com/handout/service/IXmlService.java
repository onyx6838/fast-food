package com.handout.service;

import com.handout.dto.DistrictDto;
import com.handout.dto.PrecinctDto;

import java.util.List;

public interface IXmlService {
    List<DistrictDto> getDistrictFromXML();

    List<PrecinctDto> getPrecinctByDistrictIDFromXML(int districtID);
}
