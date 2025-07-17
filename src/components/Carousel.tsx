
import styled from 'styled-components';
import { Swiper, SwiperSlide } from 'swiper/react';
import { Navigation, Pagination } from 'swiper/modules';
import 'swiper/css';
import 'swiper/css/navigation';
import 'swiper/css/pagination';

const CarouselContainer = styled.div`
  width: 100%;
  padding: 2rem 0;
  position: relative;
  overflow: hidden;
`;

const CarouselCard = styled.div`
  background: rgba(0, 0, 0, 0.4);
  border: 1px solid var(--neon-blue);
  border-radius: 12px;
  padding: 2rem;
  position: relative;
  overflow: hidden;
  backdrop-filter: blur(15px);
  box-shadow: 0 0 20px rgba(0, 255, 255, 0.1);
  height: 100%;
  margin: 1rem;
  transition: all 0.4s ease;

  &:hover {
    transform: translateY(-8px);
    box-shadow: 0 0 40px rgba(0, 255, 255, 0.2);
  }
`;

const CardTitle = styled.h3`
  color: var(--neon-blue);
  margin-bottom: 1.5rem;
  font-size: 1.8rem;
  text-shadow: 0 0 10px rgba(0, 255, 255, 0.5);
`;

const CardDescription = styled.p`
  color: var(--text-color);
  margin-bottom: 1.5rem;
  line-height: 1.8;
  font-size: 1.1rem;
  opacity: 0.9;
`;

const TechTags = styled.div`
  display: flex;
  flex-wrap: wrap;
  gap: 0.8rem;
  margin-top: 1.5rem;
`;

const TechTag = styled.span`
  background: rgba(0, 255, 255, 0.1);
  color: var(--neon-blue);
  padding: 0.4rem 1rem;
  border-radius: 20px;
  font-size: 0.95rem;
  border: 1px solid var(--neon-blue);
  transition: all 0.3s ease;

  &:hover {
    background: var(--neon-blue);
    color: var(--dark-bg);
    transform: translateY(-2px);
    box-shadow: 0 0 15px rgba(0, 255, 255, 0.3);
  }
`;

const carouselItems = [
  {
    title: "Portfolio Website",
    description: "A modern portfolio website built with React and styled-components, featuring a vaporwave aesthetic and smooth animations.",
    tech: ["React", "TypeScript", "Styled Components", "Framer Motion"]
  },
  {
    title: "AI Image Recognition",
    description: "A computer vision project using TensorFlow.js for real-time image recognition and classification.",
    tech: ["TensorFlow.js", "React", "TypeScript", "Computer Vision"]
  },
  {
    title: "E-commerce Platform",
    description: "A full-featured e-commerce platform with shopping cart, user authentication, and payment integration.",
    tech: ["React", "Node.js", "MongoDB", "Stripe"]
  }
];

const Carousel = () => {
  return (
    <CarouselContainer>
      <Swiper
        modules={[Navigation, Pagination]}
        spaceBetween={30}
        slidesPerView={1}
        navigation
        pagination={{ clickable: true }}
        style={{ width: '100%', padding: '20px' }}
        breakpoints={{
          640: {
            slidesPerView: 1,
          },
          768: {
            slidesPerView: 2,
          },
          1024: {
            slidesPerView: 3,
          },
        }}
      >
        {carouselItems.map((item, index) => (
          <SwiperSlide key={index}>
            <CarouselCard>
              <CardTitle>{item.title}</CardTitle>
              <CardDescription>{item.description}</CardDescription>
              <TechTags>
                {item.tech.map((tech, techIndex) => (
                  <TechTag key={techIndex}>{tech}</TechTag>
                ))}
              </TechTags>
            </CarouselCard>
          </SwiperSlide>
        ))}
      </Swiper>
    </CarouselContainer>
  );
};

export default Carousel; 