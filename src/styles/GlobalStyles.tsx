import { createGlobalStyle } from 'styled-components';

const GlobalStyles = createGlobalStyle`
  :root {
    --dark-bg: #1a1a1a;
    --text-primary: #ffffff;
    --text-secondary: #b3b3b3;
    --neon-pink: #ff69b4;
    --neon-blue: #00ffff;
    --neon-purple: #9370db;
    --neon-green: #39ff14;
  }

  * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    scrollbar-width: thin;
    scrollbar-color: var(--neon-blue) var(--dark-bg);
  }

  html, body {
    margin: 0;
    padding: 0;
    background-color: var(--dark-bg);
    overflow-x: hidden;
    width: 100%;
    min-height: 100vh;
  }

  body {
    font-family: 'Inter', sans-serif;
    color: var(--text-primary);
    line-height: 1.5;
  }

  #root {
    background-color: var(--dark-bg);
    min-height: 100vh;
    width: 100%;
    overflow-x: hidden;
    position: relative;
  }

  /* Webkit scrollbar styles */
  ::-webkit-scrollbar {
    width: 8px;
    background-color: var(--dark-bg);
  }

  ::-webkit-scrollbar-track {
    background-color: var(--dark-bg);
    border-radius: 4px;
  }

  ::-webkit-scrollbar-thumb {
    background-color: var(--neon-blue);
    border-radius: 4px;
    border: 2px solid var(--dark-bg);

    &:hover {
      background-color: var(--neon-pink);
    }
  }

  /* Hide scrollbar for mobile */
  @media (max-width: 768px) {
    ::-webkit-scrollbar {
      width: 0;
      background: transparent;
    }
  }
`;

export default GlobalStyles; 