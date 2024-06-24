import { FC, useEffect } from "react";
import { CloseIcon, HamburgerIcon } from "@chakra-ui/icons";
import {
  Box,
  BoxProps,
  IconButton,
  Menu,
  MenuButton,
  MenuItem,
  MenuList,
  MenuProps,
  useDisclosure,
  useMultiStyleConfig,
} from "@chakra-ui/react";
import { useCallback } from "react";
import { useDispatch } from "react-redux";
import { useNewsChancages } from "../store/hooks/use-news-chancages";
import { selectEditor, setNews, showEditor} from "../store/slices/editor-slice";
import { useNavigate } from "react-router-dom";
import { selectNews } from "../store/slices/news-slice";
import { News } from "../models";
import { serializNews } from "../utils/news_factory";

export interface NewsItemMenuProps
  extends BoxProps,
    Pick<MenuProps, "placement" | "offset"> {
  news:News;
  stateId:number;
}

export const NewsItemMenu: FC<NewsItemMenuProps> = ({
  placement,
  news,
  offset = [0, -32],
  stateId,
  ...props
}) => {
  const navigate = useNavigate();
  const { isOpen, onOpen, onClose } = useDisclosure();
  const style = useMultiStyleConfig("NewsItemMenu", {});
  const { deleteNews } = useNewsChancages();
  const dispatch = useDispatch();

  const onDelete = useCallback(async () => {
    if (window.confirm("Are you sure you want to delete this news?")) {

      await deleteNews(stateId);
    }
  }, [deleteNews]);

  

  const onEdit = useCallback(() => {
    dispatch(setNews(serializNews(news)))
    dispatch(showEditor(stateId));
    navigate(`/edit`);
  }, [dispatch, stateId]);

  return (
    <Menu
      placement={placement}
      offset={offset}
      isOpen={isOpen}
      onOpen={onOpen}
      onClose={onClose}
      autoSelect={false}
    >
      <Box {...props}>
        <MenuButton
          as={IconButton}
          icon={isOpen ? <CloseIcon /> : <HamburgerIcon />}
          isRound={true}
          size="sm"
          sx={style.MenuButton}
        />
        <MenuList onMouseLeave={onClose} sx={style.menuList}>
          <MenuItem key={Math.random()} onClick={onClose} sx={style.closeIcon}>
            <CloseIcon fontSize="sm" />
          </MenuItem>
          <MenuItem key={Math.random()} sx={style.menuItem} onClick={onEdit}>
            Szerkesztés
          </MenuItem>
          <MenuItem  key={Math.random()}  sx={style.menuItem} onClick={onDelete}>
            Törlés
          </MenuItem>
        </MenuList>
      </Box>
    </Menu>
  );
};
