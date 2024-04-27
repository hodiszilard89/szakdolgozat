import { createSlice, PayloadAction } from "@reduxjs/toolkit";
import { RootState } from "../store";

interface SearchParamsState {
    search: string|undefined;
  }
  
  const initialState: SearchParamsState = {
    search: undefined,
  };
  
  export const searchParamsSlice = createSlice({
    name: "searchParams",
    initialState,
    reducers: {
      setSearchText: (
        state: SearchParamsState, 
        action: PayloadAction<string|undefined>) => {
        state.search = action.payload;
      },
    },
  });
  
  export const { setSearchText } = searchParamsSlice.actions;
  export const selectSearchText = (state: RootState) => state.searchParams.search;
  export const searchReducer = searchParamsSlice.reducer;
  export const searchPath = searchParamsSlice.name;

