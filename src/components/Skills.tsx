import { motion, useInView } from 'framer-motion';
import styled from 'styled-components';
import { useRef } from 'react';

const SkillsSection = styled.section`
  min-height: 100vh;
  padding: 6rem 2rem;
  position: relative;
  z-index: 2;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  background: var(--dark-bg);

  @media (max-width: 768px) {
    padding: 4rem 1rem;
  }
`;

const SectionTitle = styled(motion.h2)`
  color: var(--neon-pink);
  font-size: 3rem;
  text-align: center;
  margin-bottom: 3rem;
  text-transform: uppercase;
  text-shadow: 0 0 10px var(--neon-pink);

  @media (max-width: 768px) {
    font-size: 2.5rem;
    margin-bottom: 2rem;
  }
`;

const SkillsContainer = styled(motion.div)`
  width: 100%;
  max-width: 1200px;
  margin: 0 auto;
`;

const SkillsGrid = styled.div`
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
  gap: 2rem;
  width: 100%;

  @media (max-width: 768px) {
    grid-template-columns: 1fr;
    gap: 1.5rem;
  }
`;

const SkillCategory = styled(motion.div)`
  background: rgba(26, 26, 26, 0.8);
  border-radius: 15px;
  padding: 2rem;
  border: 2px solid var(--neon-blue);
  box-shadow: 0 0 20px rgba(0, 0, 0, 0.3);
  transition: all 0.3s ease;

  &:hover {
    border-color: var(--neon-pink);
    box-shadow: 0 0 30px var(--neon-blue);
    transform: translateY(-5px);
  }
`;

const CategoryTitle = styled.h3`
  color: var(--neon-blue);
  font-size: 1.5rem;
  margin-bottom: 1.5rem;
  text-align: center;
  text-shadow: 0 0 5px var(--neon-blue);
`;

const SkillsList = styled.div`
  display: flex;
  flex-wrap: wrap;
  gap: 1rem;
  justify-content: center;
`;

const SkillTag = styled(motion.span)`
  background: rgba(255, 255, 255, 0.1);
  border: 1px solid var(--neon-purple);
  border-radius: 20px;
  padding: 0.5rem 1rem;
  color: white;
  font-size: 1rem;
  transition: all 0.3s ease;

  &:hover {
    background: rgba(255, 255, 255, 0.2);
    border-color: var(--neon-pink);
    box-shadow: 0 0 15px var(--neon-pink);
  }
`;

const Skills = () => {
  const ref = useRef(null);
  const isInView = useInView(ref, { once: true, margin: "-100px" });

  const skills = {
    "Programming Languages": [
      "C", "C++", "JavaScript", "TypeScript", "Python", "Java"
    ],
    "Web Technologies": [
      "Angular", "React"
    ],
    "AI & Machine Learning": [
      "PyTorch"
    ],
    "Databases": [
      "MySQL"
    ]
  };

  const containerVariants = {
    hidden: { opacity: 0 },
    visible: {
      opacity: 1,
      transition: {
        staggerChildren: 0.2
      }
    }
  };

  const itemVariants = {
    hidden: { opacity: 0, y: 20 },
    visible: {
      opacity: 1,
      y: 0,
      transition: {
        duration: 0.5
      }
    }
  };

  return (
    <SkillsSection id="skills" ref={ref}>
      <SectionTitle
        initial={{ opacity: 0, y: -20 }}
        animate={isInView ? { opacity: 1, y: 0 } : {}}
        transition={{ duration: 0.6 }}
      >
        Skills
      </SectionTitle>

      <SkillsContainer
        variants={containerVariants}
        initial="hidden"
        animate={isInView ? "visible" : "hidden"}
      >
        <SkillsGrid>
          {Object.entries(skills).map(([category, skillsList], index) => (
            <SkillCategory
              key={category}
              variants={itemVariants}
              custom={index}
            >
              <CategoryTitle>{category}</CategoryTitle>
              <SkillsList>
                {skillsList.map((skill) => (
                  <SkillTag
                    key={skill}
                    whileHover={{ scale: 1.05 }}
                    whileTap={{ scale: 0.95 }}
                  >
                    {skill}
                  </SkillTag>
                ))}
              </SkillsList>
            </SkillCategory>
          ))}
        </SkillsGrid>
      </SkillsContainer>
    </SkillsSection>
  );
};

export default Skills; 