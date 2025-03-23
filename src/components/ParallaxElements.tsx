import { motion, useScroll, useTransform } from 'framer-motion';
import styled from 'styled-components';

const ParallaxContainer = styled.div`
  position: fixed;
  top: 0;
  left: 0;
  width: 100vw;
  height: 100vh;
  pointer-events: none;
  z-index: 1;
  overflow: hidden;
`;

const GridElement = styled(motion.div)`
  position: fixed;
  top: -50%;
  left: -50%;
  width: 200vw;
  height: 200vh;
  background: linear-gradient(
    90deg,
    rgba(255, 255, 255, 0.1) 1px,
    transparent 1px
  ),
  linear-gradient(
    rgba(255, 255, 255, 0.1) 1px,
    transparent 1px
  );
  background-size: 50px 50px;
  transform-origin: center;
  opacity: 0.2;
  z-index: 1;
`;

const ParallaxElement = styled(motion.div)<{ size: string; color: string }>`
  position: absolute;
  width: ${props => props.size};
  height: ${props => props.size};
  background: ${props => props.color};
  border-radius: 50%;
  filter: blur(4px);
  opacity: 0.5;
  pointer-events: none;
  z-index: 1;
  mix-blend-mode: screen;
`;

const ParallaxElements = () => {
  const { scrollYProgress } = useScroll();

  const y1 = useTransform(scrollYProgress, [0, 1], ['0%', '100%']);
  const y2 = useTransform(scrollYProgress, [0, 1], ['0%', '-100%']);
  const rotateGrid = useTransform(scrollYProgress, [0, 1], [0, 45]);
  const gridScale = useTransform(scrollYProgress, [0, 0.5, 1], [1, 1.2, 1]);
  const opacity = useTransform(scrollYProgress, [0, 0.5, 1], [0.2, 0.5, 0.2]);

  const elements = [
    { x: '10%', y: y1, size: '150px', color: 'var(--neon-pink)', delay: 0 },
    { x: '85%', y: y2, size: '120px', color: 'var(--neon-blue)', delay: 0.1 },
    { x: '70%', y: y1, size: '100px', color: 'var(--neon-purple)', delay: 0.2 },
    { x: '25%', y: y2, size: '80px', color: 'var(--neon-pink)', delay: 0.3 },
  ];

  return (
    <ParallaxContainer>
      <GridElement
        style={{
          rotate: rotateGrid,
          scale: gridScale,
          opacity
        }}
      />
      {elements.map((el, index) => (
        <ParallaxElement
          key={index}
          style={{
            x: el.x,
            y: el.y,
          }}
          initial={{ opacity: 0 }}
          animate={{ opacity: 0.5 }}
          transition={{ delay: el.delay, duration: 0.8 }}
          size={el.size}
          color={el.color}
        />
      ))}
    </ParallaxContainer>
  );
};

export default ParallaxElements; 