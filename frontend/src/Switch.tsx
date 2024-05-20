import {FC} from 'react'
import { Route, Routes} from 'react-router-dom';
import { HomePage } from './pages/home-page';
import { NewsEditorProvider } from './pages/edit-news-page/news-editor-provides';
import { NewsDescProvider } from './pages/single-news-page/news-desc-provider';
import { UsersListProvider } from './pages/users-list-page/users-list-provider';
import { UserDescProvides } from './pages/single-user.page/user-desc-provides';

export const Switch : FC = ()=>{
    return(
        <div>
            <Routes>
                <Route path="/" element={<HomePage />} />
                <Route path="/edit" element={<NewsEditorProvider />} />
                <Route path="/news/:id" element={<NewsDescProvider />} />
                <Route path="/users" element={<UsersListProvider/>} />
                <Route path="/user" element={<UserDescProvides />} />
            </Routes>
        </div>
    );
}