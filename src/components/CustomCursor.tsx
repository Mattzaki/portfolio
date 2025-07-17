import { useEffect, useState } from 'react';
import styled from 'styled-components';
import { motion } from 'framer-motion';

const CursorDot = styled(motion.div)`
  width: 8px;
  height: 8px;
  background-color: var(--neon-pink);
  border-radius: 50%;
  position: fixed;
  pointer-events: none;
  z-index: 9999;
  opacity: 0.8;
  box-shadow: 0 0 10px var(--neon-pink);

  @media (max-width: 768px) {
    display: none;
  }
`;

const CursorRing = styled(motion.div)`
  width: 32px;
  height: 32px;
  border: 2px solid var(--neon-blue);
  border-radius: 50%;
  position: fixed;
  pointer-events: none;
  z-index: 9999;
  opacity: 0.5;
  box-shadow: 0 0 10px var(--neon-blue);

  @media (max-width: 768px) {
    display: none;
  }
`;

const CustomCursor = () => {
  const [mousePosition, setMousePosition] = useState({ x: 0, y: 0 });
  const [isVisible, setIsVisible] = useState(false);

  useEffect(() => {
    // Only add event listeners if not on mobile
    if (window.matchMedia('(min-width: 769px)').matches) {
      const updateMousePosition = (e: MouseEvent) => {
        setMousePosition({ x: e.clientX, y: e.clientY });
        if (!isVisible) setIsVisible(true);
      };

      window.addEventListener('mousemove', updateMousePosition);
      window.addEventListener('mouseenter', () => setIsVisible(true));
      window.addEventListener('mouseleave', () => setIsVisible(false));

      return () => {
        window.removeEventListener('mousemove', updateMousePosition);
        window.removeEventListener('mouseenter', () => setIsVisible(true));
        window.removeEventListener('mouseleave', () => setIsVisible(false));
      };
    }
  }, [isVisible]);

  if (!isVisible || window.matchMedia('(max-width: 768px)').matches) return null;

  return (
    <>
      <CursorDot
        animate={{
          x: mousePosition.x - 4,
          y: mousePosition.y - 4,
        }}
        transition={{ type: "spring", stiffness: 500, damping: 28 }}
      />
      <CursorRing
        animate={{
          x: mousePosition.x - 16,
          y: mousePosition.y - 16,
        }}
        transition={{ type: "spring", stiffness: 300, damping: 20 }}
      />
    </>
  );
};

export default CustomCursor; 