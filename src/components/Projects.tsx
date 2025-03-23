import { motion } from 'framer-motion';
import styled from 'styled-components';

const ProjectsSection = styled.section`
  min-height: 100vh;
  padding: 4rem 2rem;
  background: var(--dark-bg);
  position: relative;
`;

const Title = styled(motion.h2)`
  font-size: clamp(2rem, 5vw, 3.5rem);
  color: var(--text-primary);
  text-align: center;
  margin-bottom: 3rem;
  text-shadow: 0 0 10px var(--neon-purple);
`;

const ProjectsGrid = styled(motion.div)`
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 2rem;
  max-width: 1200px;
  margin: 0 auto;
  padding: 1rem;
`;

const ImageContainer = styled.div`
  width: 100%;
  height: 200px;
  overflow: hidden;
  position: relative;
  z-index: 1;
`;

const ProjectImage = styled.img`
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: transform 0.5s ease;
  position: relative;
  z-index: 1;
`;

const ProjectCard = styled(motion.div)`
  background: rgba(26, 26, 26, 0.8);
  border: 2px solid var(--neon-blue);
  border-radius: 15px;
  overflow: hidden;
  position: relative;
  cursor: pointer;
  transition: all 0.3s ease;

  &:hover {
    border-color: var(--neon-pink);
    box-shadow: 0 0 20px var(--neon-blue);

    ${ProjectImage} {
      transform: scale(1.05);
    }

    &::before {
      opacity: 0.3;
    }
  }

  &::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: linear-gradient(
      45deg,
      var(--neon-pink),
      var(--neon-blue)
    );
    opacity: 0;
    transition: opacity 0.3s ease;
    z-index: 2;
    mix-blend-mode: overlay;
    pointer-events: none;
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
    z-index: 3;
  }
`;

const ProjectInfo = styled(motion.div)`
  padding: 1.5rem;
  background: rgba(0, 0, 0, 0.8);
  position: relative;
  z-index: 4;
  border-top: 1px solid rgba(255, 255, 255, 0.1);
`;

const ProjectTitle = styled.h3`
  font-size: 1.5rem;
  color: var(--neon-blue);
  margin-bottom: 0.5rem;
  text-shadow: 0 0 5px var(--neon-blue);
`;

const ProjectDescription = styled.p`
  color: var(--text-secondary);
  font-size: 1rem;
  line-height: 1.6;
  margin-bottom: 1rem;
`;

const TechStack = styled(motion.div)`
  display: flex;
  flex-wrap: wrap;
  gap: 0.5rem;
  margin-top: 1rem;
  position: relative;
`;

const TechTag = styled(motion.span)`
  padding: 0.3rem 0.8rem;
  background: rgba(255, 255, 255, 0.1);
  border: 1px solid var(--neon-pink);
  border-radius: 15px;
  color: var(--neon-pink);
  font-size: 0.9rem;
  white-space: nowrap;
  text-shadow: 0 0 5px var(--neon-pink);
  transition: all 0.3s ease;

  &:hover {
    background: rgba(255, 255, 255, 0.2);
    box-shadow: 0 0 10px var(--neon-pink);
  }
`;

const ProjectLinks = styled.div`
  display: flex;
  gap: 1rem;
  margin-top: 1rem;
`;

const ProjectLink = styled(motion.a)`
  color: var(--text-primary);
  text-decoration: none;
  display: flex;
  align-items: center;
  gap: 0.5rem;
  font-size: 0.9rem;
  padding: 0.5rem 1rem;
  border: 1px solid var(--neon-blue);
  border-radius: 20px;
  transition: all 0.3s ease;
  
  &:hover {
    color: var(--neon-pink);
    border-color: var(--neon-pink);
    box-shadow: 0 0 10px var(--neon-pink);
    background: rgba(255, 255, 255, 0.1);
  }
`;

const Projects = () => {
  const projects = [
    {
      title: "Project 1",
      description: "A modern web application with a focus on user experience and performance.",
      image: "https://picsum.photos/seed/project1/800/600",
      tech: ["React", "TypeScript", "Node.js"],
      liveLink: "https://project1.com",
      githubLink: "https://github.com/username/project1"
    },
    {
      title: "Project 2",
      description: "An innovative solution for managing and organizing digital content.",
      image: "https://picsum.photos/seed/project2/800/600",
      tech: ["Next.js", "GraphQL", "MongoDB"],
      liveLink: "https://project2.com",
      githubLink: "https://github.com/username/project2"
    },
    {
      title: "Project 3",
      description: "A responsive e-commerce platform with modern design principles.",
      image: "https://picsum.photos/seed/project3/800/600",
      tech: ["Vue.js", "Firebase", "Tailwind"],
      liveLink: "https://project3.com",
      githubLink: "https://github.com/username/project3"
    }
  ];

  const containerVariants = {
    hidden: { opacity: 0 },
    visible: {
      opacity: 1,
      transition: {
        staggerChildren: 0.2
      }
    }
  };

  const cardVariants = {
    hidden: { opacity: 0, y: 20 },
    visible: {
      opacity: 1,
      y: 0,
      transition: {
        duration: 0.5
      }
    }
  };

  const tagVariants = {
    hidden: { opacity: 0, scale: 0.8 },
    visible: {
      opacity: 1,
      scale: 1,
      transition: {
        duration: 0.3
      }
    }
  };

  return (
    <ProjectsSection id="projects">
      <Title
        initial={{ opacity: 0, y: -20 }}
        whileInView={{ opacity: 1, y: 0 }}
        transition={{ duration: 0.8 }}
        viewport={{ once: true }}
      >
        My Projects
      </Title>

      <ProjectsGrid
        variants={containerVariants}
        initial="hidden"
        whileInView="visible"
        viewport={{ once: true }}
      >
        {projects.map((project, index) => (
          <ProjectCard
            key={index}
            variants={cardVariants}
            whileHover="hover"
          >
            <ImageContainer>
              <ProjectImage src={project.image} alt={project.title} />
            </ImageContainer>
            <ProjectInfo>
              <ProjectTitle>{project.title}</ProjectTitle>
              <ProjectDescription>{project.description}</ProjectDescription>
              <TechStack>
                {project.tech.map((tech, i) => (
                  <TechTag
                    key={i}
                    variants={tagVariants}
                  >
                    {tech}
                  </TechTag>
                ))}
              </TechStack>
              <ProjectLinks>
                <ProjectLink
                  href={project.liveLink}
                  target="_blank"
                  rel="noopener noreferrer"
                  whileHover={{ scale: 1.05 }}
                  whileTap={{ scale: 0.95 }}
                >
                  Live Demo
                </ProjectLink>
                <ProjectLink
                  href={project.githubLink}
                  target="_blank"
                  rel="noopener noreferrer"
                  whileHover={{ scale: 1.05 }}
                  whileTap={{ scale: 0.95 }}
                >
                  GitHub
                </ProjectLink>
              </ProjectLinks>
            </ProjectInfo>
          </ProjectCard>
        ))}
      </ProjectsGrid>
    </ProjectsSection>
  );
};

export default Projects; 