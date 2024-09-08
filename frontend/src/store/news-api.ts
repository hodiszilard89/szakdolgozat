import {
  FetchArgs,
  FetchBaseQueryError,
  createApi,
  fetchBaseQuery,
} from "@reduxjs/toolkit/query/react";

import { Like } from "../models/like";
import { User } from "../models/user";
import { Comment } from "../models/comment";
import { RawNews, News } from "../models";

import { Type } from "../models/type";
import { Token } from "../models/token";

import { BaseQueryFn } from "@reduxjs/toolkit/dist/query/baseQueryTypes";

interface updateUserParam {
  user: User;
  image: string;
}

interface customError {
  data: {
    messages: string;
    stack: string;
  };
  status: number;
}

export interface GetTokenQueryParams {
  email: string;
  password: string;
}

export interface GetRequestParamsForNewsQuery {
  typeId: Type["id"];
  limit: number;
  side: number;
  search: string | undefined;
}
export interface ResponseForNewsQuery {
  lastSide: boolean;
  newsList: News[];
}

const storage = window.localStorage;
const SERVERHOST = process.env.REACT_APP_SERVERHOST;
const newsTag: string = "NEWS";
const userTag: string = "USER";

export const newsApi = createApi({
  reducerPath: "newsPath",

  baseQuery: fetchBaseQuery({
    baseUrl: "",
    prepareHeaders: (headers) => {
      const token = storage.getItem("_auth");

      if (token) {
        headers.set("authorization", `Bearer ${token}`);
      }
      return headers;
    },
  }) as BaseQueryFn<string | FetchArgs, unknown, customError, {}>,
  tagTypes: [newsTag, userTag],

  endpoints: (builder) => ({
    //---------------NEWS

    getNewsByType: builder.query<
      ResponseForNewsQuery,
      GetRequestParamsForNewsQuery
    >({
      query: (params: GetRequestParamsForNewsQuery) => ({
        url: `http://${SERVERHOST}:8080/news/type/${params.typeId}/${params.limit}/${params.side}/${params.search}`,
        method: "GET",
      }),

      providesTags: (result?: ResponseForNewsQuery) => {
        return result?.newsList && Array.isArray(result.newsList)
          ? [
              ...result.newsList.map(({ id }) => ({ type: newsTag, id })),
              { type: newsTag, id: "LIST" },
            ]
          : [{ type: newsTag, id: "LIST" }];
      },
    }),
    createNews: builder.mutation<RawNews, RawNews>({
      query: (news: RawNews) => ({
        url: `http://${SERVERHOST}:8080/news`,
        method: "POST",
        headers: {
          "Content-Type": "application/json; charset=utf-8",
          Accept: "text/plain; charset=utf-8",
        },
        body: news,
      }),
      invalidatesTags: [{ type: newsTag, id: "LIST" }],
    }),
    updateNews: builder.mutation<RawNews, RawNews>({
      query: (news: RawNews) => ({
        url: `http://${SERVERHOST}:8080/news`,
        method: "PUT",
        body: JSON.stringify(news),
      }),
      invalidatesTags: [{ type: newsTag, id: "LIST" }],
    }),

    getOneNews: builder.query<News, RawNews["id"]>({
      query: (newsId: RawNews["id"]) => ({
        url: `http://${SERVERHOST}:8080/news/${newsId}`,
      }),
      providesTags: (news) => [{ type: newsTag, id: news?.id }],
    }),

    deleteNews: builder.mutation<void, News["id"]>({
      query: (newsId: number) => ({
        url: `http://${SERVERHOST}:8080/news/delete/${newsId}`,
        method: "DELETE",
      }),
      invalidatesTags: (_resut, error, id) => {
        const tags = [];
        if (!error) {
          tags.push({ type: newsTag, id });
        }
        tags.push({ type: newsTag, id: "LIST" });
        return tags;
      },
    }),
    //-------USER
    getUsers: builder.query<User[], void>({
      query: () => ({
        url: `http://${SERVERHOST}:8080/users`,
        method: "GET",
      }),
      providesTags: (result?: User[]) => {
        return result && Array.isArray(result)
          ? [...result.map(({ id }) => ({ type: userTag, id }))]
          : [{ type: userTag, id: "LIST" }];
      },
    }),
    getUser: builder.query<User, User["id"]>({
      query: (userId: User["id"]) => ({
        url: `http://${SERVERHOST}:8080/users/${userId}`,
      }),
      providesTags: [{ type: userTag, id: "LIST" }],
    }),
    getTypes: builder.query<Type[], void>({
      query: () => ({
        url: `http://${SERVERHOST}:8080/news/gettypes`,
        method: "GET",
      }),
      //providesTags: (_result, _error, id) => ([{ type: MovieTag, id }]),
    }),
    deleteUser: builder.mutation<void, number>({
      query: (userId: number) => ({
        url: `http://${SERVERHOST}:8080/users/${userId}`,
        method: "DELETE",
      }),
      invalidatesTags: (_resut, error, id) => {
        const tags = [];
        if (!error) {
          tags.push({ type: userTag, id });
        }
        tags.push({ type: userTag, id: "LIST" });
        return tags;
      },
    }),
    createUser: builder.mutation<void, User>({
      //első paraméter amit visszakapunk 2. amit küldünk

      query: (user: User) => ({
        url: `http://${SERVERHOST}:8080/users`,
        method: "POST",
        headers: {
          "Content-Type": "application/json; charset=utf-8",
          accept: "application/json; charset=utf-8",
        },

       // body: JSON.parse(JSON.stringify(user)),
       body:user
      }),
    }),
    updateUser: builder.mutation<void, updateUserParam>({
      query: ({ user, image }) => ({
        url: `http://${SERVERHOST}:8080/users`,
        method: "PUT",
        body: { usersDTO: user, image: image },
      }),
      invalidatesTags: (_resut, error, { user }) => {
        return [{ type: userTag, id: user.id }];
      },
    }),

    //-------TOKEN
    getToken: builder.query<Token, GetTokenQueryParams>({
      query: (params: GetTokenQueryParams) => ({
        url: `http://${SERVERHOST}:8080/authentication`,
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          Accept: "application/json",
        },
        body: {
          email: params.email,
          password: params.password,
        },
      }),
    }),
    //----EMAIL
    checkUniqueEmail: builder.query<boolean, string>({
      query: (email: string) => ({
        url: `http://${SERVERHOST}/users/checkemail/${email}`,
        method: "GET",
        headers: {
          "Content-Type": "text/plain; charset=utf-8",
          Accept: "text/plain; charset=utf-8",
        },
        body: JSON.stringify({ email: { email } }),
      }),
    }),

    //----IMAGE
    uploadImage: builder.mutation<void, string>({
      query: (image: string) => ({
        url: `http://${SERVERHOST}:8080news/uploadimage`,
        method: "POST",
        headers: {
          "Content-Type": "text/plain; charset=utf-8",
          Accept: "text/plain; charset=utf-8",
        },

        //{image:image} a szerverszámára
        body: image,
      }),
    }),

    //----  COMMENT
    addComment: builder.mutation<void, Comment>({
      query: (comment: Comment) => ({
        url: `http://${SERVERHOST}:8080/comment`,
        method: "POST",
        // headers: {
        //   "Content-Type": "text/plain; charset=utf-8",
        //   Accept: "application/json; charset=utf-8",
        // },
        headers: {
          "Content-Type": "application/json",
          Accept: "application/json",
        },

        //body: JSON.parse(JSON.stringify(comment)),
        body:comment,
      }),
      invalidatesTags: (_result, error, { news }) => [
        { type: newsTag, id: news.id },
      ],
    }),
    //----- LIKE
    addLike: builder.mutation<void, Like>({
      query: (like: Like) => ({
        url: `http://${SERVERHOST}:8080/news/addlike`,
        method: "POST",
        headers: {
          "Content-Type": "application/json; charset=utf-8",
          Accept: "application/json; charset=utf-8",
        },
        body: like,
        //body: JSON.parse(JSON.stringify(like)),
      }),

      // invalidatesTags: [
      //   { type: userTag, id: "LIST" },
      //   { type: newsTag, id: "LIST" },
      // ],
    }),
  }),
});

export const useCheckUniqueEmail = newsApi.endpoints.checkUniqueEmail.useQuery;
export const useGetTokenQuery = newsApi.endpoints.getToken.useQuery;
export const useGetTypesQuery = newsApi.endpoints.getTypes.useQuery;
export const useGetUsersQuery = newsApi.endpoints.getUsers.useQuery;
export const useGetNewsByTypeQuery = newsApi.endpoints.getNewsByType.useQuery;
export const useGetUserQuery = newsApi.endpoints.getUser.useQuery;
// export const useGetNewsQuery = newsApi.endpoints.getNewsList.useQuery;
export const useGetOneNewsQuery = newsApi.endpoints.getOneNews.useQuery;
export const useDeleteUserMutation = newsApi.endpoints.deleteUser.useMutation;
export const useCreateCommentMutation =
  newsApi.endpoints.addComment.useMutation;
export const useUploadImageMutation = newsApi.endpoints.uploadImage.useMutation;
export const useCreateLikeMutation = newsApi.endpoints.addLike.useMutation;
export const useCreateUserMutation = newsApi.endpoints.createUser.useMutation;
export const useCreateNewsMutaion = newsApi.endpoints.createNews.useMutation;
export const useDeleteNewsMutaion = newsApi.endpoints.deleteNews.useMutation;
export const useUpdateNewsMutaion = newsApi.endpoints.updateNews.useMutation;
export const useUpdateUserMutaion = newsApi.endpoints.updateUser.useMutation;

export const newsReducer = newsApi.reducer;
export const newsPath = newsApi.reducerPath;
export const newsMiddleware = newsApi.middleware;
