import { motion } from 'framer-motion';
import styled from 'styled-components';
import { useTypewriter, Cursor } from 'react-simple-typewriter';

const HeroSection = styled(motion.section)`
  min-height: calc(100vh - 70px);
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  padding: 2rem;
  position: relative;
  overflow: hidden;
`;

const Title = styled(motion.h1)`
  font-size: clamp(2.5rem, 8vw, 5rem);
  text-align: center;
  margin-bottom: 1rem;
  color: var(--text-primary);
  text-shadow: 0 0 10px var(--neon-pink);
`;

const Subtitle = styled(motion.h2)`
  font-size: clamp(1.5rem, 4vw, 2.5rem);
  text-align: center;
  color: var(--text-secondary);
  margin-bottom: 2rem;
`;

const Description = styled(motion.p)`
  font-size: clamp(1rem, 2vw, 1.25rem);
  text-align: center;
  max-width: 800px;
  color: var(--text-secondary);
  line-height: 1.6;
  margin-bottom: 2rem;
`;

const ScrollIndicator = styled(motion.div)`
  position: absolute;
  bottom: 2rem;
  left: 50vw;
  transform: translateX(-50%);
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 0.5rem;
  color: var(--text-secondary);
  cursor: pointer;

  @media (max-width: 768px) {
    left: 42vw;
  }
`;

const Hero = () => {
  const [text] = useTypewriter({
    words: ['Frontend Developer', 'Computer Science Student', 'AI Enthusiast'],
    loop: true,
    delaySpeed: 2000,
  });

  const containerVariants = {
    hidden: { opacity: 0 },
    visible: {
      opacity: 1,
      transition: {
        staggerChildren: 0.3,
      },
    },
  };

  const itemVariants = {
    hidden: { opacity: 0, y: 20 },
    visible: {
      opacity: 1,
      y: 0,
      transition: {
        duration: 0.8,
        ease: "easeOut",
      },
    },
  };

  const scrollIndicatorVariants = {
    initial: { y: 0 },
    animate: {
      y: [0, 10, 0],
      transition: {
        duration: 1.5,
        repeat: Infinity,
        ease: "easeInOut",
      },
    },
  };

  const handleScrollClick = () => {
    const aboutSection = document.getElementById('about');
    if (aboutSection) {
      aboutSection.scrollIntoView({ behavior: 'smooth' });
    }
  };

  return (
    <HeroSection
      variants={containerVariants}
      initial="hidden"
      animate="visible"
    >
      <Title variants={itemVariants}>
        Matteo Zacchino
      </Title>
      <Subtitle variants={itemVariants}>
        <span>{text}</span>
        <Cursor cursorStyle="_" />
      </Subtitle>
      <Description variants={itemVariants}>
        Frontend Developer with a strong foundation in Computer Science, 
        passionate about creating modern web applications and exploring 
        the possibilities of Computer Vision and Artificial Intelligence.
      </Description>
      
      <ScrollIndicator
        variants={scrollIndicatorVariants}
        initial="initial"
        animate="animate"
        onClick={handleScrollClick}
      >
        <motion.span>Scroll Down</motion.span>
        <motion.svg
          width="24"
          height="24"
          viewBox="0 0 24 24"
          fill="none"
          stroke="currentColor"
          strokeWidth="2"
          strokeLinecap="round"
          strokeLinejoin="round"
        >
          <path d="M12 5v14M5 12l7 7 7-7" />
        </motion.svg>
      </ScrollIndicator>
    </HeroSection>
  );
};

export default Hero; 