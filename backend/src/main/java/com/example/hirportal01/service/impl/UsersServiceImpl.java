package com.example.hirportal01.service.impl;

import com.example.hirportal01.dto.CommentDTO;
import com.example.hirportal01.dto.UserDTOForUpdate;
import com.example.hirportal01.dto.UsersDTO;
import com.example.hirportal01.entity.Comment;
import com.example.hirportal01.entity.Roles;
import com.example.hirportal01.entity.Users;
import com.example.hirportal01.exceptions.EntityNotFoundException;
import com.example.hirportal01.exceptions.UserIsBlockedException;

import com.example.hirportal01.repository.RolesRepository;
import com.example.hirportal01.repository.UsersRepository;
import com.example.hirportal01.service.interfaces.UsersService;
import com.example.hirportal01.service.emial.EmailService;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.modelmapper.ModelMapper;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

/**
 * átadódik az adat a adatbázis reétegből a service rétegbe
 */

@Service
public class UsersServiceImpl implements UsersService {

    final String IMAGE_PATH="./uploads/image.jpeg";
    private final EmailService emailService;
    private final ImageServiceImpl imageService;
    private final ModelMapper modelMapper;
    private final RolesRepository rolesRepository;
    private final UsersRepository usersRepository;

    public UsersServiceImpl(EmailService emailService, ImageServiceImpl imageService,  ModelMapper modelMapper, RolesRepository rolesRepository, UsersRepository usersRepository) {
        this.emailService = emailService;
        this.imageService = imageService;

        this.modelMapper = modelMapper;
        this.rolesRepository = rolesRepository;
        this.usersRepository = usersRepository;
    }

    @Override
    public List<UsersDTO> findAll() {
        List<Users> newsList = usersRepository.findAll();

        return newsList.stream()
                .map(anUsers -> modelMapper.map(anUsers,UsersDTO.class))
                .collect(Collectors.toList());  //listába gyűjti a feldolgozott (átmappelt) elemeket

    }

    @Override
    public UsersDTO create(UsersDTO userDTO) {
        Long l= 2L;
        userDTO.setId(null);
        Optional<Roles> readerRoles = rolesRepository.findById(l);
        Users resultUsers =   usersRepository.save(
               modelMapper.map(userDTO,Users.class)); //egylépésben alakítja át entityvé és menti el
        UsersDTO usersDTO = modelMapper.map(resultUsers,UsersDTO.class);
        if (readerRoles.isPresent())
        {
            readerRoles.get().getUsers().add(resultUsers);
            rolesRepository.save(readerRoles.get());
        }
        emailService.sendEmail(userDTO.getEmail(),"Fake News Regisztáció", "Köszöntünk "+userDTO.getChatName()+" a tagok között");
        return usersDTO;
    }

    @Override
    public Optional<UsersDTO> findById(Long id) {
        Optional<Users> optionalUser=usersRepository.findById(id);
        return optionalUser.map(user ->modelMapper.map(user,UsersDTO.class)) ;
    }

    @Override
    public UsersDTO update(UsersDTO usersDTO) {
        Long id = usersDTO.getId();
        Optional<Users> optionalUser = usersRepository.findById(id);

        if(optionalUser.isEmpty()){
            throw new EntityNotFoundException("User not found with id="+id);
        }

        Users usersTemplates = modelMapper.map(usersDTO,Users.class);
        Users savedUser=usersRepository.save(usersTemplates);
        return modelMapper.map(savedUser,UsersDTO.class);
    }

    @Override
    public void delete(Long id) {
        Optional<Users> optionalUser = usersRepository.findById(id);
        if(optionalUser.isPresent()){
            usersRepository.delete(optionalUser.get());
        }
        else {
            throw new EntityNotFoundException("User");
        }
    }

    @Override
    public UsersDTO update(UserDTOForUpdate userDTOForUpdate) {
        UsersDTO usersDTO = userDTOForUpdate.getUsersDTO();
        String image= userDTOForUpdate.getImage();
        Optional<Users> usersOptional=usersRepository.findById(usersDTO.getId());
        System.out.println((usersDTO.getId()));
        Users  user = new Users();
        if (usersOptional.isPresent())
        {
            user=usersOptional.get();
            System.out.println(user.getImagePath());
        }else{
            System.out.println("nem,található");
        }
         // képküldés
        if (userDTOForUpdate.getImage().isEmpty()){
            user.setImagePath(IMAGE_PATH);
             }else {
            String oldImagePath = user.getImagePath();

            if (user.getImagePath().equals(IMAGE_PATH)) {
                user.setImagePath(imageService.add(image));
            } else {
                try{ imageService.delete(oldImagePath);} catch (Exception ignored) {
                }
                imageService.delete(oldImagePath);
                user.setImagePath(imageService.add(image));
            }
        }
      //  usersDTO=modelMapper.map()

        return update(modelMapper.map(user,UsersDTO.class));
    }

    @Override
    public UsersDTO findUser(String email, String password) {
        Optional<Users> optionalUser = usersRepository.findUser(email,password);
        if (optionalUser.isPresent()){
            System.out.println("cset név  "  +optionalUser.get().getChatName());

            if (optionalUser.get().getLocked())
               throw  new UserIsBlockedException( optionalUser.get().getChatName() +" blokkoltuk");

            return modelMapper.map(optionalUser.get(),UsersDTO.class);
        }
        else {throw new EntityNotFoundException("Hiba", Arrays.asList("asd","asdasd"));}
    }



    @Override
    public void addComment(CommentDTO commentDTO) {
        Comment comment = modelMapper.map(commentDTO,Comment.class);
        Optional<UsersDTO> optionalUsersDTO = findById(commentDTO.getWriter().getId());
        if(optionalUsersDTO.isPresent()){
            Users user = modelMapper.map (optionalUsersDTO.get(), Users.class);
            List<Comment> comments = user.getComments();
            comments.add(comment);
            user.setComments(comments);
        }
        else{
            throw new EntityNotFoundException("user");
        }
    }
    @Override
    public boolean checkEmail(String email) {
        boolean response=true;
        Optional<Users> optionalUser = usersRepository.findUserByEmail(email);
        System.out.println(optionalUser);
        if (optionalUser.isPresent()){
            response=false;
        }
        return response;
    }

    public Users findUserByEmail(String email){
        Optional<Users> optionalUser = usersRepository.findUserByEmail(email);
        Users user ;
        if (optionalUser.isPresent()) {
            user=optionalUser.get();
        }else{throw new EntityNotFoundException("Hibás felhasználóinév vagy jelszó");}
        return user;
    }
    public Users findUserByChatName(String username) {
        System.out.println(username);
        Optional<Users> optionalUser = usersRepository.findUserByChatName(username);
        if (optionalUser.isPresent()){
            return modelMapper.map(optionalUser.get(),Users.class);
        }
        else {throw new EntityNotFoundException("Hibás felhasználóinév vagy jelszó");}
    }

}
