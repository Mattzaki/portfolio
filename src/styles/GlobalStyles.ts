import { createGlobalStyle } from 'styled-components';

const GlobalStyles = createGlobalStyle`
  :root {
    --neon-pink: #ff71ce;
    --neon-blue: #01cdfe;
    --neon-purple: #b967ff;
    --neon-green: #05ffa1;
    --dark-bg: #1a1a1a;
  }

  * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
  }

  html, body, #root {
    width: 100%;
    height: 100%;
    margin: 0;
    padding: 0;
  }

  body {
    font-family: 'VT323', 'Courier New', monospace;
    background-color: var(--dark-bg);
    color: white;
    overflow-x: hidden;
    min-height: 100vh;
    min-height: 100dvh;
  }

  #root {
    min-height: 100vh;
    min-height: 100dvh;
    display: flex;
    flex-direction: column;
  }

  ::selection {
    background: var(--neon-pink);
    color: var(--dark-bg);
  }

  .neon-text {
    text-shadow: 
      0 0 5px var(--neon-pink),
      0 0 10px var(--neon-pink),
      0 0 20px var(--neon-pink),
      0 0 40px var(--neon-purple);
  }

  .grid-bg {
    background-image: linear-gradient(var(--neon-purple) 1px, transparent 1px),
      linear-gradient(90deg, var(--neon-purple) 1px, transparent 1px);
    background-size: 30px 30px;
    background-position: center center;
    opacity: 0.1;
  }
`;

export default GlobalStyles; 