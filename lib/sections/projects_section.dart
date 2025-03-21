import 'package:flutter/material.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
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
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.white,
                letterSpacing: 4,
              ),
            ),
          ),
          const SizedBox(height: 40),

          // Griglia dei progetti
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 1.5,
            children: [
              _buildProjectCard(
                context,
                'PROGETTO 1',
                'Descrizione breve del progetto 1',
                ['Flutter', 'Dart', 'Firebase'],
                'https://picsum.photos/seed/1/400/300',
              ),
              _buildProjectCard(
                context,
                'PROGETTO 2',
                'Descrizione breve del progetto 2',
                ['React', 'Node.js', 'MongoDB'],
                'https://picsum.photos/seed/2/400/300',
              ),
              _buildProjectCard(
                context,
                'PROGETTO 3',
                'Descrizione breve del progetto 3',
                ['Python', 'Django', 'PostgreSQL'],
                'https://picsum.photos/seed/3/400/300',
              ),
              _buildProjectCard(
                context,
                'PROGETTO 4',
                'Descrizione breve del progetto 4',
                ['Vue.js', 'Express', 'MySQL'],
                'https://picsum.photos/seed/4/400/300',
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
              width: 2,
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
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Titolo del progetto
                    Text(
                      title,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Descrizione
                    Text(
                      description,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                    const Spacer(),
                    // Tecnologie utilizzate
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: technologies.map((tech) => Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
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
                            fontSize: 12,
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