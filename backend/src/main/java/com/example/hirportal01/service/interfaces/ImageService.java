package com.example.hirportal01.service.interfaces;

import org.springframework.core.io.Resource;

public interface ImageService {
    String add(String image);

    void delete(String path);
    Resource get(String imageName);
}
