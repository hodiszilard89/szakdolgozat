import { ChakraProvider, ColorModeScript } from "@chakra-ui/react";
import * as React from "react";
import * as ReactDOM from "react-dom/client";
import { App } from "./App";
import { store } from "./store/store";
import { Provider } from "react-redux";
import reportWebVitals from "./reportWebVitals";
import * as serviceWorker from "./serviceWorker";
import AuthProvider from "react-auth-kit";
import createStore from "react-auth-kit/createStore";
import { theme } from "./theme";

import { BrowserRouter } from "react-router-dom";

const container = document.getElementById("root");
if (!container) throw new Error("Failed to find the root element");
const root = ReactDOM.createRoot(container);
const authStore = createStore({ authName: "_auth", authType: "localstorage" });

root.render(
  <React.StrictMode>
    <ColorModeScript />
    <ChakraProvider theme={theme}>
      <AuthProvider store={authStore}>
        <Provider store={store}>
          <BrowserRouter>
            <App />
          </BrowserRouter>
        </Provider>
      </AuthProvider>
    </ChakraProvider>
  </React.StrictMode>
);

// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: https://cra.link/PWA
serviceWorker.unregister();

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals();
