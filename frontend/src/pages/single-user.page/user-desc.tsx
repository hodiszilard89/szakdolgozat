import { FC, useState } from "react";
import { Link as rLink, useNavigate } from "react-router-dom";
import { ViewIcon, ViewOffIcon } from "@chakra-ui/icons";
import {
  FormControl,
  FormLabel,
  Box,
  Link,
  Grid,
  Checkbox,
  GridItem,
  Image,
  Text,
  HStack,
  Input,
  Button,
} from "@chakra-ui/react";
import { Footer } from "../../componens/footer";
import { useFormik } from "formik";

import { User } from "../../models/user";

import { useUserChancages } from "../../store/hooks/use-user-chancages";
import { useSelector } from "react-redux";
import { selectAuthUser } from "../../store/slices/auth-user-slice";

import { useUploadImageMutation } from "../../store/news-api";
import { Navbar } from "../../componens/navbar";

export interface UserDescProps {
  user: User;
  onSubmit: (user: User) => Promise<void>;
}

export const UserDesc: FC<UserDescProps> = ({ user, onSubmit }) => {
  const navigate = useNavigate();
  const [base64Image, setBase64Image] = useState("");
  const [imgageUpload] = useUploadImageMutation();
  const [viewPass, setViewPass] = useState<Boolean>(false);
  const { updateUser } = useUserChancages();
  const viewer = useSelector(selectAuthUser).user;

  const { values, setFieldValue, handleSubmit } = useFormik({
    initialValues: user,
    onSubmit: async (values: User) => {
      try {
        const validatedValues = { ...values };
        await updateUser({ user: validatedValues, image: base64Image });
      } catch (e) {
        console.error(e);
      }
      navigate("/users");
    },
  });

  const onClickViewIcon = () => {
    setViewPass(!viewPass);
  };

  const [image, setImage] = useState<string>(
    "http://localhost:8080/" + user.imagePath
  );
  return (
    <>
      <Box
        margin={"auto"}
        maxWidth={"80%"}
        bg={"white"}
        boxShadow={"md"}
        borderRadius={"15"}
      >
        <Grid templateColumns="repeat(3, 1fr)" gap={4} mb={10}>
          <GridItem bg="">
            <Image
              style={{ height: 300, width: 300 }}
              borderRadius={"50%"}
              src={image}
              padding={3}
            />
          </GridItem>
          <GridItem colSpan={2} bg="">
            <Text mt={"8"} fontSize={"2xl"} fontWeight={"bold"}>
              {`Becenév:  ${user?.chatName}`}
            </Text>
            <HStack>
              <Text as={"span"} textAlign={"center"}>
                Jogosultságok:
                {user.roles?.map((roles) => (
                  <Text key={roles.id}>{roles.title}</Text>
                ))}
              </Text>
            </HStack>
          </GridItem>
        </Grid>
      </Box>
      <Box
        
        padding={"5"}
        margin={"auto"}
        mb={"10"}
        maxWidth={"80%"}
        bg={"white"}
        boxShadow={"md"}
        borderRadius={"15"}
        ps={"150"}
        as="form"
        onSubmit={handleSubmit}
      >
        
          <FormControl
            isDisabled={
              !viewer?.roles?.find((roles) => roles.title === "ADMIN") &&
              user.id !== viewer?.id
            }
          >
            <Grid pt={5} mb={5} templateColumns="repeat(3, 1fr)" gap={4}>
              <GridItem bg="">
                <FormLabel textTransform={"none"}>Chatname</FormLabel>
              </GridItem>
              <GridItem bg="">
                <Input
                  id={Math.random().toString()}
                  value={values?.chatName}
                  onChange={(event) => {
                    setFieldValue("chatName", event.target.value);
                  }}
                  //sx={style.inputField}
                />
              </GridItem>
            </Grid>
            <Grid mb={5} templateColumns="repeat(3, 1fr)" gap={4}>
              <GridItem bg="">
                <FormLabel textTransform={"none"}>Firstname</FormLabel>
              </GridItem>
              <GridItem bg="">
                <Input
                  id={Math.random().toString()}
                  value={values?.firstName}
                  onChange={(event) => {
                    setFieldValue("firstName", event.target.value);
                  }}
                  //sx={style.inputField}
                />
              </GridItem>
            </Grid>
            <Grid mb={5} templateColumns="repeat(3, 1fr)" gap={4}>
              <GridItem bg="">
                <FormLabel textTransform={"none"}>Lastname</FormLabel>
              </GridItem>
              <GridItem bg="">
                <Input
                  id={Math.random().toString()}
                  value={values?.secName}
                  onChange={(event) => {
                    setFieldValue("secName", event.target.value);
                  }}
                />
              </GridItem>
            </Grid>
            <Grid mb={5} templateColumns="repeat(3, 1fr)" gap={4}>
              <GridItem bg="">
                <FormLabel textTransform={"none"}>Email</FormLabel>
              </GridItem>
              <GridItem bg="">
                <Input
                  id={Math.random().toString()}
                  value={values?.email}
                  onChange={(event) => {
                    setFieldValue("email", event.target.value);
                  }}
                  //sx={style.inputField}
                />
              </GridItem>
            </Grid>

            {/* PASSWORD */}
            <Grid
              mb={5}
              templateColumns="repeat(3, 1fr)"
              gap={4}
              display={user.id === viewer?.id ? undefined : "none"}
              alignItems="center"
            >
              <GridItem bg="">
                <FormLabel textTransform={"none"}>Password</FormLabel>
              </GridItem>
              <GridItem bg="">
                <Input
                  id={Math.random().toString()}
                  type={viewPass ? "text" : "password"}
                  value={values?.password}
                  onChange={(event) => {
                    setFieldValue("password", event.target.value);
                  }}
                  //sx={style.inputField}
                />
              </GridItem>
              <GridItem>
                {viewPass ? (
                  <ViewIcon fontSize={"xl"} onClick={onClickViewIcon} />
                ) : (
                  <ViewOffIcon fontSize={"xl"} onClick={onClickViewIcon} />
                )}
              </GridItem>
            </Grid>
            {viewer?.roles?.find((roles) => roles.title === "ADMIN") ? (
              <Text display={"flex"}>
                <FormLabel> Blokkolás</FormLabel>
                <Checkbox
                  paddingLeft={3}
                  border={"1px black"}
                  display={"flex"}
                  size="lg"
                  isChecked={values.locked}
                  value={""}
                  defaultChecked={false}
                  onChange={(event) => {
                    setFieldValue("locked", event.currentTarget.checked);
                  }}
                ></Checkbox>
              </Text>
            ) : (
              ""
            )}

            <Grid
              mb={5}
              templateColumns="repeat(3, 1fr)"
              gap={4}
              alignItems="center"
            >
              <GridItem bg="">
                <FormLabel textTransform={"none"}>Imagepath</FormLabel>
              </GridItem>
              <GridItem bg="" alignItems="center">
                <Input
                  type="file"
                  id="file-input"
                  onChange={(event) => {
                    const files = event.target.files;
                    if (files && files.length > 0) {
                      const file = files[0];
                      setImage(URL.createObjectURL(file));

                      const reader = new FileReader();
                      reader.readAsDataURL(file);
                      reader.onloadend = () => {
                        const userImage = reader.result
                          ?.toString()
                          .split(",")[1];
                        setBase64Image(userImage!);
                      };
                    }
                  }}
                />
              </GridItem>
            </Grid>
          </FormControl>
        

        <Button
          isDisabled={
            !viewer?.roles?.find((roles) => roles.title === "ADMIN") &&
            user.id !== viewer?.id
          }
          colorScheme="teal"
          variant="solid"
          type={"submit"}
          size={"lg"}
        >
          Küldés
        </Button>

        <>
          <Link ms={4} as={rLink} to={"/users"}>
            <Button colorScheme="teal" variant="solid" size={"lg"}>
              Vissza a listához
            </Button>
          </Link>
          <Link ms={4} as={rLink} to={"/"}>
            <Button colorScheme="teal" variant="solid" size={"lg"}>
              Főoldal
            </Button>{" "}
          </Link>
        </>
      </Box>
    </>
  );
};
