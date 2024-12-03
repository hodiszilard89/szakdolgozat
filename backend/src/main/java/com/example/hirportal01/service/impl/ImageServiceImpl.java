package com.example.hirportal01.service.impl;

import com.example.hirportal01.service.interfaces.ImageService;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Base64;

@Service
public class ImageServiceImpl implements ImageService {
    @Override
    public String add(String image) {
        LocalDateTime currentTime = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy_MM_dd_HH_mm_ss");
        String filePath ="";

        try {
            byte[] imageBytes = Base64.getDecoder().decode(image);
            filePath = "./uploads/"+currentTime.format(formatter)+".jpeg";
            try (FileOutputStream fos = new FileOutputStream(filePath)) {
                fos.write(imageBytes);
                System.out.println("A kép sikeresen mentve: " + filePath);
            } catch (IOException e) {
                e.printStackTrace();
                filePath="";
                System.err.println("Hiba történt a kép mentése közben.");
            }

        } catch (Exception e) {
            e.printStackTrace();

        }
        return filePath;
    }

    public void delete(String path){

       File image = new File(path);
        if (image.exists()) {
            System.out.println("A fájl létezik.");

            // Fájl törlése
            if (image.delete()) {
                System.out.println("A fájl sikeresen törölve lett.");
            } else {
                System.out.println("A fájl törlése nem sikerült.");
            }
        } else {
            System.out.println("A fájl nem létezik.");
        }
     //   System.out.println(image.delete());
    }
    @Override
    public Resource get(String imageName) {
        Path imagePath = Paths.get("uploads", imageName);
        try {
            return new UrlResource(imagePath.toUri());
        } catch (IOException ioe){
            return null;
        }
    }
}
