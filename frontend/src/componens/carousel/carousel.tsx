import React from "react";
import Slider from "react-slick";
import {
  Box,
  IconButton,
  Text,
  Heading,
  Image,
  useBreakpointValue,
} from "@chakra-ui/react";
import { BiLeftArrowAlt, BiRightArrowAlt } from "react-icons/bi";
import "slick-carousel/slick/slick.css";
import "slick-carousel/slick/slick-theme.css";
import { setNews } from "../../store/slices/editor-slice";
import { News } from "../../models/news";
import { useDispatch, useSelector } from "react-redux";
import { newsFactory, serializNews } from "../../utils/news_factory";
import { useNavigate } from "react-router-dom";
import { selectNews } from "../../store/slices/news-slice";

// interface ImageSliderProps {
//   news: News[];
// }

const Carousel: React.FC<{news:News[]}> = ({news}) => {
  const dispatch = useDispatch();
  const navigate = useNavigate();

  const settings = {
    dots: false,
    arrows: false ,
    infinite: true,
    autoplay: true,
    speed: 500,
    autoplaySpeed: 3500,
    slidesToShow: 1,
    slidesToScroll: 1,

  };
  const handleImageClick = (news: News) => {
    dispatch(setNews(serializNews(news)));
    navigate("/news");
  };

  const [slider, setSlider] = React.useState<Slider | null>(null);

  const top = useBreakpointValue({ base: "90%", md: "40%" });
  const side = useBreakpointValue({ base: "10%", md: "40px" });
  return (
    <>
      {news.length !== 0 ? (
        <Box
          margin={"auto"}
          position={"relative"}
          height={"100%"}
          width={"80%"}
          // overflow={"hidden"}
        >
          <link
            rel="stylesheet"
            type="text/css"
            href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick.min.css"
          />
          <link
            rel="stylesheet"
            type="text/css"
            href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick-theme.min.css"
          />
          {/* Left Icon */}
          <IconButton
            aria-label="left-arrow"
            variant="ghost"
            position="absolute"
            left={side}
            top={top}
            transform={"translate(0%, -50%)"}
            zIndex={2}
            onClick={() => slider?.slickPrev()}
          >
            <BiLeftArrowAlt size="70px" />
          </IconButton>
          {/* Right Icon */}
          <IconButton
            aria-label="right-arrow"
            variant="ghost"
            position="absolute"
            right={side}
            top={top}
            transform={"translate(0%, -50%)"}
            zIndex={2}
            onClick={() => slider?.slickNext()}
          >
            <BiRightArrowAlt size="70px" />
          </IconButton>
          <Slider {...settings} ref={(slider) => setSlider(slider)}>
            {news.map((item, index) => (
              <Box
                key={index}
                onClick={() => handleImageClick(item)}
                height={"600"}
                width={"100%"}
              >
                <>
                <Image
                  src={item.imgPath}
                  position={"relative"}
                  onClick={() => handleImageClick(item)}
                  style={{ width: "100%", height: "100%" }}
                />
                <Box
                  zIndex={2}
                  padding={2}
                  height="100px"
                  width={"80%"}
                  position="relative"
                  top={"-25%"}
                  left={"10%"}
                  backgroundColor={"rgba( 0, 0, 0, 0.5)"}
                >
                  <Heading
                    color={"white"}
                    fontSize={{ base: "2xl", md: "3xl", lg: "4xl" }}
                  >
                    {item.title.substring(0, 30)}
                  </Heading>
                  <Text color={"white"} fontSize={{ base: "lg", lg: "xl" }}>
                    {item.subtitle.substring(0, 40)}
                  </Text>
                </Box>
                </>

              </Box>
            ))}
          </Slider>
        </Box>
      ) : (
        ""
      )}
    </>
  );
};

export default Carousel;
