import React, { FC, useState, useCallback, useEffect, useRef } from "react";
import { useSelector, useDispatch } from "react-redux";

import {
  Box,
  FormLabel,
  Modal,
  FormControl,
  Button,
  ModalContent,
  ModalBody,
  ModalOverlay,
  ModalFooter,
  ModalHeader,
  ModalCloseButton,
  Input,
  FormErrorMessage,
} from "@chakra-ui/react";
import { RegValidationSchema } from "./reg-validation.schema";
import { CheckCircleIcon, ViewIcon, ViewOffIcon } from "@chakra-ui/icons";
import { showLogin } from "../../store/slices/login-slice";
import { closeReg, selectShowReg } from "../../store/slices/reg-slice";
import { useFormik } from "formik";
import { useAddUser } from "../../store/hooks/useAddUser";
import { createUser } from "../../utils/create-user";

export const initValues = {
  email: "",
  password: "",
  confirmpassword: "",
  chatname: "",
  secname: "",
  firstname: "",
};
export interface Token {
  role: string;
  iss: string;
  username: string;
  id: number;
}

const RegModal: FC = () => {
  const [showPass, setShowPass] = useState<boolean>(false);

  const [showModal, setShowModal] = useState(false);
  const showReg = useSelector(selectShowReg);
  const dispatch = useDispatch();

  const { addUser } = useAddUser();
  //formik
  const { errors, values, setFieldValue, handleSubmit, setValues } = useFormik({
    initialValues: {
      email: "",
      password: "",
      confirmpassword: "",
      chatname: "",
      secname: "",
      firstname: "",
    },
    onSubmit: async (values) => {

      try {
        const user = createUser();
        user.chatName = values.chatname;
        user.email = values.email;
        user.firstName = values.firstname;
        user.secName = values.secname;
        user.password = values.password;
        const response = async () => {
          await addUser(user);
        };
        response();
      } catch (e) {
        console.error(e);
      }

      dispatch(closeReg());
    },
    validationSchema: RegValidationSchema,
  });

  const onClose = useCallback(() => {
    dispatch(closeReg());
    setShowPass(false);
  }, [dispatch]);

  const onOpenLogin = useCallback(() => {
    dispatch(closeReg());
    dispatch(showLogin());
  }, []);



  useEffect(() => {
    setShowModal(showReg);

    return () => {
      setShowPass(false);
      setValues({
        email: "",
        password: "",
        confirmpassword: "",
        chatname: "",
        secname: "",
        firstname: "",
      });
    };
  }, [showReg]);

  return (
    <Modal isOpen={showModal} onClose={onClose}>
      <ModalOverlay />
      <ModalContent>
        <ModalHeader>Regisztráció</ModalHeader>
        <ModalCloseButton />
        <ModalBody>
          <form onSubmit={handleSubmit}>
            
            <FormControl isInvalid={!!errors.email}>
              <FormLabel>Email</FormLabel>
             
              <Input
                id="regemail"
                type="email"
                value={values.email}
                placeholder="Adja meg az email címét"
                onChange={(event) => 
                  setFieldValue("email", event.target.value)
                }
                autoComplete="new-email"
              />
            
              {errors.email ? (
                <FormErrorMessage>{errors.email}</FormErrorMessage>
              ) : (
                <CheckCircleIcon color={"green"} />
              )}
            </FormControl>

            <Box
              style={{
                paddingLeft: "20px",
                paddingBottom: "10px",
                paddingTop: "10px",
                border: "1px solid lightgray",
                borderRadius: "8px",
              }}
            >
              <FormControl isInvalid={!!errors.password}>
                <FormLabel>Jelszó</FormLabel>
                <Input
                  id="regpass"
                  type={showPass ? "text" : "password"}
                  autoComplete="new-password"
                  placeholder="Adja meg a jelszavát"
                  onChange={(event) =>
                    setFieldValue("password", event.target.value)
                  }
                />
                {errors.password ? (
                  <FormErrorMessage>{errors.password}</FormErrorMessage>
                ) : (
                  <CheckCircleIcon color={"green"} />
                )}
              </FormControl>
              <FormControl isInvalid={!!errors.confirmpassword}>
                <FormLabel>Jelszó újra</FormLabel>
                <Input
                 id="pass"
                  type={showPass ? "text" : "password"}
                  autoComplete="off"
                  placeholder="Adja meg a jelszavát újra"
                  onChange={(event) =>
                    setFieldValue("confirmpassword", event.target.value)
                  }
                />
                {errors.confirmpassword ? (
                  <FormErrorMessage>{errors.confirmpassword}</FormErrorMessage>
                ) : (
                  <CheckCircleIcon color={"green"} />
                )}
              </FormControl>

              <Box style={{ textAlign: "end", paddingTop: "10px" }}>
                {!showPass ? (
                  <ViewIcon
                    fontSize={"xl"}
                    marginRight={"15px"}
                    onClick={() => setShowPass(!showPass)}
                  />
                ) : (
                  <ViewOffIcon
                    fontSize={"xl"}
                    marginRight={"15px"}
                    onClick={() => setShowPass(!showPass)}
                  />
                )}
              </Box>
            </Box>
            <FormControl isInvalid={!!errors.chatname}>
              <FormLabel>Kiválasztott chat név</FormLabel>
              <Input
                type="text"
                autoComplete="off"
                placeholder="Adja meg a chat nevét"
                onChange={(event) =>
                  setFieldValue("chatname", event.target.value)
                }
              />
              {errors.chatname ? (
                <FormErrorMessage>{errors.chatname}</FormErrorMessage>
              ) : (
                <CheckCircleIcon color={"green"} />
              )}
            </FormControl>
            <FormControl  isInvalid={!!errors.secname}>
              <FormLabel>Adja meg keresztnevét</FormLabel>
              <Input
                type="text"
                autoComplete="new-password"
                placeholder="Adja meg a keresztnevét"
                onChange={(event) =>
                  setFieldValue("secname", event.target.value)
                }
              />
               <FormErrorMessage>{errors.secname}</FormErrorMessage>
            </FormControl>
            <FormControl  isInvalid={!!errors.firstname}>
              <FormLabel>Adja meg vezetéknevét</FormLabel>
              <Input
                type="text"
                autoComplete="off"
                placeholder="Adja meg a vezetéknevét"
                onChange={(event) =>
                  setFieldValue("firstname", event.target.value)
                }
              />
               <FormErrorMessage>{errors.firstname}</FormErrorMessage>
            </FormControl>

            <Button
              variant="solid"
              type="submit"
              isDisabled={Object.keys(errors).length > 0}
            >
              Regisztráció
            </Button>
          </form>
        </ModalBody>
        <ModalFooter>
          <Button variant="solid" onClick={onOpenLogin}>
            Bejelentkezés
          </Button>
          <Button variant="solid" onClick={onClose}>
            Bezárás
          </Button>
        </ModalFooter>
      </ModalContent>
    </Modal>
  );
};

export default RegModal;
