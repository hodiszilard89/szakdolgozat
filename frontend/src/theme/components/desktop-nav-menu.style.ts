import { ComponentMultiStyleConfig, useColorModeValue } from "@chakra-ui/react";

export const DesktopNavMenuStyle:ComponentMultiStyleConfig = {
    parts:["trigger","content"],
    baseStyle:{
        trigger:{
            p:2,
            fontSize:"lg",
            fontWeight:500,
            
            _hover:{
              textDecoration:"none",
            
            }
        },
        content:{
            border:0,
            boxShadow:"xl",
          //  bg:useColorModeValue("white", "gray.800"),
            p:4,
            rounded:"xl",
            minW:"sm",
        }
    }
}
