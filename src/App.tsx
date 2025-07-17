import { motion, AnimatePresence } from 'framer-motion';
import { useState, useEffect } from 'react';
import { BrowserRouter as Router } from 'react-router-dom';
import styled from 'styled-components';
import GlobalStyles from './styles/GlobalStyles';
import Hero from './components/Hero';
import Navbar from './components/Navbar';
import About from './components/About';
import Projects from './components/Projects';
import Contact from './components/Contact';
import Skills from './components/Skills';
import ParallaxElements from './components/ParallaxElements';
import CustomCursor from './components/CustomCursor';
import './App.css';

const AppContainer = styled.div`
  position: relative;
  min-height: 100vh;
  width: 100%;
  background-color: var(--dark-bg);
  overflow-x: hidden;
`;

const MainContent = styled(motion.main)`
  position: relative;
  width: 100%;
  min-height: 100vh;
  overflow-x: hidden;
  background-color: var(--dark-bg);

  &::before {
    content: '';
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background-color: var(--dark-bg);
    z-index: -1;
  }
`;

const App = () => {
  const [currentSection, setCurrentSection] = useState('hero');

  useEffect(() => {
    const handleScroll = () => {
      const sections = ['hero', 'about', 'skills', 'projects', 'contact'];
      const scrollPosition = window.scrollY + window.innerHeight / 2;

      for (const section of sections) {
        const element = document.getElementById(section);
        if (element) {
          const { top, bottom } = element.getBoundingClientRect();
          const elementPosition = window.scrollY + top;
          if (scrollPosition >= elementPosition && scrollPosition <= window.scrollY + bottom) {
            setCurrentSection(section);
            break;
          }
        }
      }
    };

    window.addEventListener('scroll', handleScroll);
    return () => window.removeEventListener('scroll', handleScroll);
  }, []);

  return (
    <Router basename="/portfolio">
      <GlobalStyles />
      <AppContainer>
        <CustomCursor />
        <ParallaxElements />
        <Navbar />
        <AnimatePresence mode="wait">
          <MainContent
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            exit={{ opacity: 0 }}
            transition={{ duration: 0.5 }}
          >
            <motion.section
              id="hero"
              initial={{ opacity: 0, y: 20 }}
              animate={{ 
                opacity: 1,
                y: 0,
                scale: currentSection === 'hero' ? 1 : 0.99
              }}
              transition={{ duration: 0.5 }}
            >
              <Hero />
            </motion.section>

            <motion.section
              id="about"
              initial={{ opacity: 0, y: 20 }}
              animate={{ 
                opacity: 1,
                y: 0,
                scale: currentSection === 'about' ? 1 : 0.99
              }}
              transition={{ duration: 0.5 }}
            >
              <About />
            </motion.section>

            <motion.section
              id="skills"
              initial={{ opacity: 0, y: 20 }}
              animate={{ 
                opacity: 1,
                y: 0,
                scale: currentSection === 'skills' ? 1 : 0.99
              }}
              transition={{ duration: 0.5 }}
            >
              <Skills />
            </motion.section>

            <motion.section
              id="projects"
              initial={{ opacity: 0, y: 20 }}
              animate={{ 
                opacity: 1,
                y: 0,
                scale: currentSection === 'projects' ? 1 : 0.99
              }}
              transition={{ duration: 0.5 }}
            >
              <Projects />
            </motion.section>

            <motion.section
              id="contact"
              initial={{ opacity: 0, y: 20 }}
              animate={{ 
                opacity: 1,
                y: 0,
                scale: currentSection === 'contact' ? 1 : 0.99
              }}
              transition={{ duration: 0.5 }}
            >
              <Contact />
            </motion.section>
          </MainContent>
        </AnimatePresence>
      </AppContainer>
    </Router>
  );
};

export default App;
