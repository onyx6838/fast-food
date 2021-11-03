package com.handout.controller;

import com.handout.dto.DistrictDto;
import com.handout.dto.PrecinctDto;
import com.handout.service.IFileService;
import com.handout.service.IXmlService;
import com.handout.utils.FileManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URISyntaxException;
import java.util.List;

@RestController
@RequestMapping(value = "/api/v1/files")
public class FileController {
    @Autowired
    private IFileService fileService;

    @Autowired
    private IXmlService
            xmlService;

    @PostMapping(value = "/image")
    public ResponseEntity<?> upLoadImage(@RequestParam(name = "image") MultipartFile image) throws IOException, URISyntaxException {

        if (!new FileManager().isTypeFileImage(image)) {
            return new ResponseEntity<>("File must be image!", HttpStatus.UNPROCESSABLE_ENTITY);
        }

        return new ResponseEntity<>(fileService.uploadImage(image), HttpStatus.OK);
    }

    @GetMapping(value = "/image")
    public ResponseEntity<?> downloadImage(@RequestParam String nameImage) throws IOException {

        // TODO validate

        File imageFile = fileService.downloadImage(nameImage);
        InputStreamResource imageStream = new InputStreamResource(new FileInputStream(imageFile));

        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Disposition", String.format("attachment; filename=\"%s\"", nameImage));
        headers.add("Cache-Control", "no-cache, no-store, must-revalidate");
        headers.add("Pragma", "no-cache");
        headers.add("Expires", "0");

        return ResponseEntity
                .ok()
                .headers(headers)
                .contentLength(imageFile.length())
                .contentType(MediaType.parseMediaType("application/txt"))
                .body(imageStream);
    }

    @GetMapping(value = "/xml/districts")
    public ResponseEntity<?> getDistrictFromXML() {
        List<DistrictDto> districtList = xmlService.getDistrictFromXML();
        return new ResponseEntity<>(districtList, HttpStatus.OK);
    }

    @GetMapping(value = "/xml/districts/{id}")
    public ResponseEntity<?> getPrecinctByDistrictIDFromXML(@PathVariable(name = "id") int districtID) {
        List<PrecinctDto> precinctList = xmlService.getPrecinctByDistrictIDFromXML(districtID);
        return new ResponseEntity<>(precinctList, HttpStatus.OK);
    }
}