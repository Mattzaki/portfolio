import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isSmallScreen = screenSize.width < 600;

    return Container(
      padding: EdgeInsets.all(isSmallScreen ? 16 : 32),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        children: [
          // Titolo della sezione
          ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.secondary,
              ],
            ).createShader(bounds),
            child: Text(
              'CHI SONO',
              style: (isSmallScreen
                ? Theme.of(context).textTheme.titleLarge
                : Theme.of(context).textTheme.headlineMedium)?.copyWith(
                color: Colors.white,
                letterSpacing: isSmallScreen ? 2 : 4,
              ),
            ),
          ),
          SizedBox(height: isSmallScreen ? 20 : 40),
          
          // Contenitore principale con effetto terminale
          Container(
            padding: EdgeInsets.all(isSmallScreen ? 12 : 20),
            decoration: BoxDecoration(
              color: Colors.black87,
              border: Border.all(
                color: Theme.of(context).colorScheme.primary,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Barra del terminale
                Row(
                  children: [
                    Container(
                      width: isSmallScreen ? 8 : 12,
                      height: isSmallScreen ? 8 : 12,
                      margin: EdgeInsets.only(right: isSmallScreen ? 4 : 8),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(isSmallScreen ? 4 : 6),
                      ),
                    ),
                    Container(
                      width: isSmallScreen ? 8 : 12,
                      height: isSmallScreen ? 8 : 12,
                      margin: EdgeInsets.only(right: isSmallScreen ? 4 : 8),
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(isSmallScreen ? 4 : 6),
                      ),
                    ),
                    Container(
                      width: isSmallScreen ? 8 : 12,
                      height: isSmallScreen ? 8 : 12,
                      margin: EdgeInsets.only(right: isSmallScreen ? 8 : 16),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(isSmallScreen ? 4 : 6),
                      ),
                    ),
                    Text(
                      'about.txt',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: isSmallScreen ? 12 : 14,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: isSmallScreen ? 12 : 20),
                
                // Testo animato stile terminale
                DefaultTextStyle(
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: isSmallScreen ? 14 : 16,
                    height: 1.5,
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'Ciao! 👋\n',
                        speed: const Duration(milliseconds: 50),
                      ),
                      TypewriterAnimatedText(
                        'Sono uno sviluppatore appassionato di tecnologia e design.\n',
                        speed: const Duration(milliseconds: 50),
                      ),
                      TypewriterAnimatedText(
                        'Mi piace creare esperienze web innovative e coinvolgenti.\n',
                        speed: const Duration(milliseconds: 50),
                      ),
                    ],
                    isRepeatingAnimation: false,
                    displayFullTextOnTap: true,
                  ),
                ),
                SizedBox(height: isSmallScreen ? 12 : 20),
                
                // Stats in stile retro-game
                Container(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(child: _buildStatItem(context, 'CREATIVITÀ', 85, isSmallScreen)),
                      SizedBox(width: isSmallScreen ? 4 : 8),
                      Expanded(child: _buildStatItem(context, 'CODING', 90, isSmallScreen)),
                      SizedBox(width: isSmallScreen ? 4 : 8),
                      Expanded(child: _buildStatItem(context, 'PROBLEM SOLVING', 88, isSmallScreen)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(BuildContext context, String label, int value, bool isSmallScreen) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            color: Theme.of(context).colorScheme.tertiary,
            fontSize: isSmallScreen ? 10 : 12,
          ),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: isSmallScreen ? 4 : 8),
        Container(
          width: double.infinity,
          height: isSmallScreen ? 16 : 20,
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.primary,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(2),
          ),
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                child: FractionallySizedBox(
                  widthFactor: value / 100,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Theme.of(context).colorScheme.primary,
                          Theme.of(context).colorScheme.secondary,
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Text(
                  '$value%',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: isSmallScreen ? 10 : 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
} 