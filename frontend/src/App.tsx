import { Route, Routes } from "react-router-dom";

import { HomePage } from "./pages/home-page";

import { NewsDescProvider } from "./pages/single-news-page/news-desc-provider";
import { NewsEditorProvider } from "./pages/edit-news-page/news-editor-provides";

import RegModal from "./componens/registration-modal/reg-modal";
import { UserDescProvides } from "./pages/single-user.page/user-desc-provides";
import LoginModal from "./componens/login-modal/login-modal";
import { UsersListProvider } from "./pages/users-list-page/users-list-provider";
import { Navbar } from "./componens/navbar";

import { Footer } from "./componens/footer";
import { Error } from "./pages/Error";

export const App = () => {

  return (
    <>
     <Navbar/>     
      <Routes>
        <Route path="/" element={<HomePage />} />
        <Route path="/edit" element={<NewsEditorProvider />} />
        <Route path="/news/:id" element={<NewsDescProvider />} />
        <Route path="/users" element={<UsersListProvider />} />
        <Route path="/user" element={<UserDescProvides />} />
        <Route path="*" element={<Error msg={"Az oldal nem létezik"} />} />
      </Routes>
      <LoginModal />
      <RegModal />
    <Footer/>
  </>
  );
};