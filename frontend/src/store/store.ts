 import {combineReducers, configureStore} from "@reduxjs/toolkit"
import { newsPath, newsReducer, newsMiddleware } from "./news-api"
import { searchPath, searchReducer } from "./slices/search-slice"
import {newsEditorPath, newsEditorReducer} from "./slices/editor-slice"
import { loginModalPath, loginModalReducer } from "./slices/login-slice"
import { authUserPath, authUserReducer } from "./slices/auth-user-slice"
import { regModalPath, regModalReducer } from "./slices/reg-slice"
import { newsSliceReducer, newsSlicePath } from "./slices/news-slice"
import {usesSlicePath, usesSliceReducer} from "./slices/users-slice"
 
 const appReducer = combineReducers({
    [newsPath] : newsReducer,
    [searchPath]: searchReducer,
    [newsEditorPath]: newsEditorReducer,
    [loginModalPath]: loginModalReducer,
    [regModalPath]:regModalReducer,
    [newsSlicePath]:newsSliceReducer, 
    [usesSlicePath] : usesSliceReducer,
    [authUserPath]:authUserReducer,
 }) 
 export const store=configureStore({
    reducer:appReducer,
    middleware: (getDefaultMiddleware) =>
    getDefaultMiddleware().concat([newsMiddleware])
 })

 export type RootState = ReturnType<typeof store.getState>
 export type AppDispach = typeof store.dispatch;