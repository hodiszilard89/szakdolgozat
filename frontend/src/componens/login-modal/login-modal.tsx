import React, { FC, useState, useCallback, useEffect, useMemo } from "react";
import { useSelector, useDispatch } from "react-redux";
import { decodeJwt } from "jose";
import {
  ModalContent,
  ModalOverlay,
  FormControl,
  Input,
  Button,
  FormLabel,
} from "@chakra-ui/react";

import { Modal, ModalBody, ModalFooter } from "@chakra-ui/react";

import {
  closeLogin,
  selectLogin,
  selectShowLogin,
} from "../../store/news/login-slice";
import { showReg } from "../../store/news/reg-slice";
import { useFormik } from "formik";
import useAuthUser from "react-auth-kit/hooks/useAuthUser";
import useSignIn from "react-auth-kit/hooks/useSignIn";
import { useGetUser } from "../../store/hooks/use-get-user";
import { setUser } from "../../store/news/auth-user-slice";
import { useGetToken } from "../../store/hooks/use-get-token";
import { GetTokenQueryParams } from "../../store/news/news-api";
import { User } from "../../models/user";
export interface Token {
  role: string;
  iss: string;
  chatname: string;
  id: number;
}
const LoginModal: FC = () => {
  const [showModal, setShowModal] = useState(useSelector(selectShowLogin));
  const initialToken: Token = {
    role: "",
    iss: "",
    chatname: "",
    id: 0,
  };
  const initParam: GetTokenQueryParams = {
    email: "",
    password: "",
  };

  const { showLogin } = useSelector(selectLogin);

  const dispatch = useDispatch();
  const singIn = useSignIn();

  const [tokenParams, setTokenParams] =
    useState<GetTokenQueryParams>(initParam);

  const auth = useAuthUser();
  const authUserInStorage = auth as {email:string, role:string[], id:number};  
  const {data } = useGetUser(authUserInStorage?.id);
  
  useEffect(() => {
    dispatch(setUser(data));
  }, [data]);

  const { serverErrors, tokenValue } =
    useGetToken(tokenParams);
  const [error, setError] = useState(serverErrors?.data?.messages);

  useEffect(() => {
    if (tokenValue) {
      const { role, id } = decodeJwt(tokenValue) as unknown as Token;

      //ALKALMAZÁSON BELÜLI FH BEÁLLÍTÁS A LOCALSTOREBA
      tokenValue &&
        singIn({
          auth: {
            token: tokenValue,
            type: "Bearer",
          },
          userState: { email: values.email, role, id },
        });
      dispatch(closeLogin());
      // globál stateba rakni a felhasználót
    } else {
      setError(serverErrors?.data.messages);
    }
  }, [tokenValue, tokenParams]);

  //FORMIK RÉSZ
  const { errors, values, setFieldValue, handleSubmit, setValues } = useFormik({
    initialValues: tokenParams,
    onSubmit: async (values, { setSubmitting }) => {
      setTokenParams({
        email: values.email,
        password: values.password,
      });
    },
  });

  const onOpenReg = useCallback(() => {
    dispatch(closeLogin());
    dispatch(showReg());
  }, []);

  const onClose = useCallback(() => {
    dispatch(closeLogin());
    setShowModal(false);
    //setError("");
    setValues({ email: "", password: "" });
  }, [dispatch]);

  useEffect(() => {
    setShowModal(showLogin);
  }, [showLogin]);

  // useEffect(() => {
  //   setError(serverErrors?.data?.messages);
  // }, [serverErrors]);

  return (
    <Modal
      blockScrollOnMount={false}
      isOpen={showModal}
      onClose={() => onClose()}
    >
      <ModalOverlay opacity={0.5} />
      <ModalContent>
        <ModalBody>
          <form onSubmit={handleSubmit}>
            <FormLabel>{error ? `Error ${error}` : ""}</FormLabel>
            <FormControl>
              <FormLabel>Chat név</FormLabel>
              <Input
                //type="email"
                type="text"
                placeholder="Adja meg a chat nevét"
                value={values.email}
                autoComplete="new-email"
                onChange={(event) => setFieldValue("email", event.target.value)}
              />
            </FormControl>

            <FormControl>
              <FormLabel>Jelszó</FormLabel>
              <Input
                type="password"
                autoComplete="new-password"
                placeholder="Adja meg a jelszavát"
                value={values.password}
                onChange={(event) =>
                  setFieldValue("password", event.target.value)
                }
              />
            </FormControl>
            <Button
              onClick={() => {
                setTokenParams({
                  email: values.email,
                  password: values.password,
                });
              }}
              variant="primary"
              type="submit"
            >
              Bejelentkezés
            </Button>
          </form>
        </ModalBody>
        <ModalFooter>
          <Button variant="secondary" onClick={onOpenReg}>
            Regisztráció
          </Button>
          <Button variant="secondary" onClick={onClose}>
            Bezárás
          </Button>
        </ModalFooter>
      </ModalContent>
    </Modal>
  );
};

export default LoginModal;
