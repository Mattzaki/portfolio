import { motion } from 'framer-motion';
import styled from 'styled-components';

const AboutSection = styled.section`
  min-height: 100vh;
  width: 100%;
  padding: 4rem 2rem;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  background: var(--dark-bg);
  position: relative;
  overflow: hidden;

  &::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: var(--dark-bg);
    z-index: -1;
  }
`;

const Title = styled(motion.h2)`
  font-size: clamp(2rem, 5vw, 3.5rem);
  color: var(--text-primary);
  margin-bottom: 2rem;
  text-align: center;
  text-shadow: 0 0 10px var(--neon-blue);
`;

const Content = styled(motion.div)`
  max-width: 1200px;
  width: 100%;
  margin: 0 auto;
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 2rem;
  padding: 2rem;
  position: relative;
  z-index: 1;
`;

const Card = styled(motion.div)`
  background: rgba(26, 26, 26, 0.8);
  border: 2px solid var(--neon-blue);
  border-radius: 15px;
  padding: 2rem;
  backdrop-filter: blur(10px);
  transition: all 0.3s ease;
  position: relative;
  overflow: hidden;

  &:hover {
    border-color: var(--neon-pink);
    box-shadow: 0 0 20px var(--neon-blue);
    transform: translateY(-5px);
  }

  &::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: var(--dark-bg);
    z-index: -1;
  }

  &::after {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: repeating-linear-gradient(
      0deg,
      rgba(255, 255, 255, 0.03) 0px,
      rgba(255, 255, 255, 0.03) 1px,
      transparent 1px,
      transparent 2px
    );
    pointer-events: none;
    z-index: 0;
  }
`;

const CardTitle = styled(motion.h3)`
  font-size: 1.5rem;
  color: var(--neon-pink);
  margin-bottom: 1rem;
`;

const CardContent = styled(motion.p)`
  color: var(--text-secondary);
  line-height: 1.6;
`;

const About = () => {
  const containerVariants = {
    hidden: { opacity: 0 },
    visible: {
      opacity: 1,
      transition: {
        staggerChildren: 0.2,
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

  const cards = [
    {
      title: "Who I Am",
      content: "A Frontend Developer based in Cisterna di Latina (LT), Italy, currently pursuing my studies in Computer Science at Sapienza University of Rome. I combine my technical skills with a deep interest in artificial intelligence and modern web technologies."
    },
    {
      title: "What I Do",
      content: "I specialize in building responsive and performant web applications using Angular and modern Typescript. My computer science background allows me to approach problems with a solid theoretical foundation."
    },
    {
      title: "My Focus",
      content: "Currently deepening my knowledge in AI with a particular passion for Computer Vision. I love exploring how visual perception can be implemented in software while maintaining my expertise in frontend development."
    }
  ];

  return (
    <AboutSection id="about">
      <Title
        initial={{ opacity: 0, y: -20 }}
        whileInView={{ opacity: 1, y: 0 }}
        transition={{ duration: 0.8 }}
        viewport={{ once: true }}
      >
        About Me
      </Title>
      
      <Content
        variants={containerVariants}
        initial="hidden"
        whileInView="visible"
        viewport={{ once: true }}
      >
        {cards.map((card, index) => (
          <Card
            key={index}
            variants={itemVariants}
            whileHover={{
              scale: 1.02,
              transition: { duration: 0.2 }
            }}
          >
            <CardTitle>{card.title}</CardTitle>
            <CardContent>{card.content}</CardContent>
          </Card>
        ))}
      </Content>
    </AboutSection>
  );
};

export default About; 