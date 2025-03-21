import 'package:flutter/material.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

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
              'PROGETTI',
              style: (isSmallScreen
                ? Theme.of(context).textTheme.titleLarge
                : Theme.of(context).textTheme.headlineMedium)?.copyWith(
                color: Colors.white,
                letterSpacing: isSmallScreen ? 2 : 4,
              ),
            ),
          ),
          SizedBox(height: isSmallScreen ? 20 : 40),

          // Griglia dei progetti
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: isSmallScreen ? 1 : 2,
            mainAxisSpacing: isSmallScreen ? 16 : 20,
            crossAxisSpacing: isSmallScreen ? 16 : 20,
            childAspectRatio: isSmallScreen ? 1.2 : 1.5,
            children: [
              _buildProjectCard(
                context,
                'PROGETTO 1',
                'Descrizione breve del progetto 1',
                ['Flutter', 'Dart', 'Firebase'],
                'https://picsum.photos/seed/1/400/300',
                isSmallScreen,
              ),
              _buildProjectCard(
                context,
                'PROGETTO 2',
                'Descrizione breve del progetto 2',
                ['React', 'Node.js', 'MongoDB'],
                'https://picsum.photos/seed/2/400/300',
                isSmallScreen,
              ),
              _buildProjectCard(
                context,
                'PROGETTO 3',
                'Descrizione breve del progetto 3',
                ['Python', 'Django', 'PostgreSQL'],
                'https://picsum.photos/seed/3/400/300',
                isSmallScreen,
              ),
              _buildProjectCard(
                context,
                'PROGETTO 4',
                'Descrizione breve del progetto 4',
                ['Vue.js', 'Express', 'MySQL'],
                'https://picsum.photos/seed/4/400/300',
                isSmallScreen,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard(
    BuildContext context,
    String title,
    String description,
    List<String> technologies,
    String imageUrl,
    bool isSmallScreen,
  ) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black87,
            border: Border.all(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
              width: isSmallScreen ? 1 : 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          clipBehavior: Clip.antiAlias,
          child: Stack(
            children: [
              // Immagine di sfondo con effetto di overlay
              Positioned.fill(
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  opacity: const AlwaysStoppedAnimation(0.3),
                ),
              ),
              // Contenuto della card
              Container(
                padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Titolo del progetto
                    Text(
                      title,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: isSmallScreen ? 16 : 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: isSmallScreen ? 4 : 8),
                    // Descrizione
                    Text(
                      description,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: isSmallScreen ? 12 : 14,
                      ),
                    ),
                    const Spacer(),
                    // Tecnologie utilizzate
                    Wrap(
                      spacing: isSmallScreen ? 4 : 8,
                      runSpacing: isSmallScreen ? 4 : 8,
                      children: technologies.map((tech) => Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: isSmallScreen ? 6 : 8,
                          vertical: isSmallScreen ? 2 : 4,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).colorScheme.secondary,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          tech,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: isSmallScreen ? 10 : 12,
                          ),
                        ),
                      )).toList(),
                    ),
                  ],
                ),
              ),
              // Overlay per hover
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    // TODO: Implementare l'azione quando si clicca sul progetto
                    debugPrint('Clicked on $title');
                  },
                  onHover: (isHovered) {
                    // TODO: Aggiungere animazione hover se necessario
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 