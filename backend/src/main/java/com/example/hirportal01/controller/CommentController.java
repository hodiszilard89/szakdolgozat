package com.example.hirportal01.controller;

import com.example.hirportal01.dto.CommentDTO;

import com.example.hirportal01.service.interfaces.CommentService;
import com.example.hirportal01.service.impl.CommentServiceImpl;

import org.json.JSONObject;
import org.modelmapper.ModelMapper;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

@RestController
@CrossOrigin(originPatterns = "*")
@RequestMapping("/comment")
public class CommentController {

    private final CommentService commentService;

    private final ModelMapper modelMapper;
    public CommentController(CommentServiceImpl commentService, ModelMapper modelMapper) {
        this.commentService = commentService;


        this.modelMapper = modelMapper;
    }


    @RequestMapping(method = RequestMethod.GET)
    public ResponseEntity<List<CommentDTO>> findAll(){
        return ResponseEntity.ok(commentService.findAll());
    }

    @RequestMapping(method = RequestMethod.POST)
   public ResponseEntity<CommentDTO> create(@RequestBody String string){
//    public ResponseEntity<CommentDTO> create(@RequestBody CommentDTO commentDTO){

        JSONObject jsonObject = new JSONObject(string);
        CommentDTO commentDTO=modelMapper.map(jsonObject.toMap(),CommentDTO.class);
        if (commentDTO.getText().contains("delete"))
            {
               // generationService.generation();
            }
        Date dt = new Date();

        commentDTO.setReleasedate(dt);

        return ResponseEntity.ok(commentService.create(commentDTO));
       // return ResponseEntity.ok(null);
    }
}
