import { useRef, useState } from 'react';
import styled from 'styled-components';
import { motion, useInView } from 'framer-motion';

const ContactSection = styled.section`
  padding: 6rem 2rem;
  position: relative;
  z-index: 2;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;

  @media (max-width: 768px) {
    padding: 4rem 1rem;
  }
`;

const SectionTitle = styled(motion.h2)`
  color: var(--neon-pink);
  font-size: 3rem;
  text-align: center;
  margin-bottom: 2rem;
  text-transform: uppercase;
  text-shadow: 0 0 10px var(--neon-pink);

  @media (max-width: 768px) {
    font-size: 2.5rem;
  }
`;

const ContactCard = styled(motion.div)`
  width: 100%;
  max-width: 600px;
  background: rgba(26, 26, 26, 0.8);
  padding: 2rem;
  border-radius: 10px;
  border: 2px solid var(--neon-blue);
  box-shadow: 0 0 20px var(--neon-blue);
  position: relative;
  overflow: hidden;

  @media (max-width: 768px) {
    max-width: 100%;
    padding: 1.5rem;
    margin: 0 1rem;
  }

  &::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    height: 2px;
    background: linear-gradient(
      90deg,
      var(--neon-pink),
      var(--neon-blue),
      var(--neon-purple)
    );
  }
`;

const ContactInfo = styled.div`
  margin-bottom: 2rem;
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 0.5rem;
`;

const ContactItem = styled.div`
  display: flex;
  align-items: center;
  justify-content: center;
  position: relative;
  width: 100%;
  max-width: 400px;

  @media (max-width: 768px) {
    max-width: 100%;
  }
`;

const ContactText = styled.div`
  color: white;
  font-size: 1.2rem;
  line-height: 1.6;
  display: flex;
  align-items: center;
  gap: 0.5rem;
  margin: 0;
  width: 100%;
  justify-content: flex-start;
  padding: 0 1rem;

  .emoji {
    width: 1.5rem;
    display: flex;
    justify-content: center;
    flex-shrink: 0;
  }

  .content {
    flex: 1;
    text-align: center;
    margin: 0 1.5rem 0 0.5rem;
  }

  @media (max-width: 768px) {
    font-size: 1.1rem;
    padding: 0 0.5rem;

    .content {
      margin: 0 1rem 0 0.5rem;
    }
  }

  @media (max-width: 480px) {
    font-size: 1rem;
    
    .content {
      margin: 0 0.8rem 0 0.3rem;
    }
  }
`;

const CopyButton = styled(motion.button)`
  background: transparent;
  border: none;
  cursor: pointer;
  width: 1.8rem;
  height: 1.8rem;
  display: inline-flex;
  align-items: center;
  justify-content: center;
  color: var(--neon-green);
  font-size: 1.1rem;
  opacity: 0;
  transition: all 0.3s ease;
  padding: 0;
  flex-shrink: 0;
  position: absolute;
  right: 0.5rem;

  ${ContactItem}:hover & {
    opacity: 1;
  }

  &:hover {
    color: var(--neon-pink);
  }
`;

const Tooltip = styled(motion.span)`
  position: absolute;
  background: var(--neon-green);
  color: black;
  padding: 0.3rem 0.6rem;
  border-radius: 4px;
  font-size: 0.9rem;
  pointer-events: none;
  white-space: nowrap;
  left: calc(100% + 0.5rem);
  top: 50%;
  transform: translateY(-50%);
`;

const SocialLinks = styled.div`
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
  gap: 1rem;
  margin-top: 2rem;

  @media (max-width: 768px) {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 1rem;

    & > a {
      flex: 0 1 calc(50% - 1rem);
      min-width: 150px;
    }

    &::after {
      content: '';
      flex: 0 1 calc(50% - 1rem);
    }
  }
`;

const SocialLink = styled(motion.a)`
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 1rem;
  background: transparent;
  border: 2px solid var(--neon-purple);
  border-radius: 5px;
  color: var(--neon-purple);
  text-decoration: none;
  font-size: 1.1rem;
  transition: all 0.3s ease;
  text-shadow: 0 0 5px var(--neon-purple);
  position: relative;
  overflow: hidden;

  &:hover {
    background: var(--neon-purple);
    color: black;
    box-shadow: 0 0 20px var(--neon-purple);
  }

  &::before {
    content: '';
    position: absolute;
    top: 0;
    left: -100%;
    width: 100%;
    height: 100%;
    background: linear-gradient(
      90deg,
      transparent,
      rgba(255, 255, 255, 0.2),
      transparent
    );
    transition: 0.5s;
  }

  &:hover::before {
    left: 100%;
  }
`;

const Contact = () => {
  const ref = useRef(null);
  const isInView = useInView(ref, { once: true, margin: "-100px" });
  const [copiedText, setCopiedText] = useState<string | null>(null);

  const handleCopy = async (text: string, type: string) => {
    try {
      await navigator.clipboard.writeText(text);
      setCopiedText(type);
      setTimeout(() => setCopiedText(null), 2000);
    } catch (err) {
      console.error('Failed to copy text: ', err);
    }
  };

  const email = "matteo.zacchino2000@gmail.com";
  const phone = "+39 331 230 1423";

  return (
    <ContactSection id="contact" ref={ref}>
      <SectionTitle
        initial={{ opacity: 0, y: -20 }}
        animate={isInView ? { opacity: 1, y: 0 } : {}}
        transition={{ duration: 0.6 }}
      >
        Let's Connect
      </SectionTitle>

      <ContactCard
        initial={{ opacity: 0, y: 20 }}
        animate={isInView ? { opacity: 1, y: 0 } : {}}
        transition={{ duration: 0.6, delay: 0.2 }}
      >
        <ContactInfo>
          <ContactItem>
            <ContactText>
              <span className="emoji">📧</span>
              <span className="content">{email}</span>
              <CopyButton
                onClick={() => handleCopy(email, 'email')}
                whileHover={{ scale: 1.1 }}
                whileTap={{ scale: 0.9 }}
              >
                📋
                {copiedText === 'email' && (
                  <Tooltip
                    initial={{ opacity: 0, x: 10 }}
                    animate={{ opacity: 1, x: 0 }}
                    exit={{ opacity: 0 }}
                  >
                    Copied!
                  </Tooltip>
                )}
              </CopyButton>
            </ContactText>
          </ContactItem>
          <ContactItem>
            <ContactText>
              <span className="emoji">📱</span>
              <span className="content">{phone}</span>
              <CopyButton
                onClick={() => handleCopy(phone, 'phone')}
                whileHover={{ scale: 1.1 }}
                whileTap={{ scale: 0.9 }}
              >
                📋
                {copiedText === 'phone' && (
                  <Tooltip
                    initial={{ opacity: 0, x: 10 }}
                    animate={{ opacity: 1, x: 0 }}
                    exit={{ opacity: 0 }}
                  >
                    Copied!
                  </Tooltip>
                )}
              </CopyButton>
            </ContactText>
          </ContactItem>
          <ContactItem>
            <ContactText>
              <span className="emoji">📍</span>
              <span className="content">Cisterna di Latina (LT), Italy</span>
            </ContactText>
          </ContactItem>
        </ContactInfo>

        <SocialLinks>
          <SocialLink 
            href="https://www.linkedin.com/in/matteo-zacchino-bb674218b/" 
            target="_blank"
            rel="noopener noreferrer"
            whileHover={{ scale: 1.05 }}
            whileTap={{ scale: 0.95 }}
          >
            LinkedIn
          </SocialLink>
          <SocialLink 
            href="https://github.com/MatteoZak" 
            target="_blank"
            rel="noopener noreferrer"
            whileHover={{ scale: 1.05 }}
            whileTap={{ scale: 0.95 }}
          >
            GitHub
          </SocialLink>
          {/* <SocialLink 
            href="/your-cv.pdf" 
            target="_blank"
            rel="noopener noreferrer"
            whileHover={{ scale: 1.05 }}
            whileTap={{ scale: 0.95 }}
          >
            Resume
          </SocialLink> */}
        </SocialLinks>
      </ContactCard>
    </ContactSection>
  );
};

export default Contact; 