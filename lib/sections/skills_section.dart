import 'package:flutter/material.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

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
              'COMPETENZE',
              style: (isSmallScreen
                ? Theme.of(context).textTheme.titleLarge
                : Theme.of(context).textTheme.headlineMedium)?.copyWith(
                color: Colors.white,
                letterSpacing: isSmallScreen ? 2 : 4,
              ),
            ),
          ),
          SizedBox(height: isSmallScreen ? 20 : 40),

          // Formazione
          _buildEducationSection(context, isSmallScreen),
          SizedBox(height: isSmallScreen ? 20 : 40),

          // Categorie di competenze
          if (isSmallScreen) ...[
            _buildSkillCategory(
              context,
              'LINGUAGGI',
              {
                'C/C++': 0.9,
                'Python': 0.85,
                'Java': 0.8,
                'TypeScript': 0.85,
                'JavaScript': 0.85,
              },
              isSmallScreen,
            ),
            const SizedBox(height: 16),
            _buildSkillCategory(
              context,
              'WEB DEV',
              {
                'HTML/CSS': 0.9,
                'Angular': 0.85,
                'MySQL': 0.8,
              },
              isSmallScreen,
            ),
            const SizedBox(height: 16),
            _buildSkillCategory(
              context,
              'AI & ML',
              {
                'Machine Learning': 0.85,
                'Computer Vision': 0.8,
                'PyTorch': 0.75,
              },
              isSmallScreen,
            ),
            const SizedBox(height: 16),
            _buildSkillCategory(
              context,
              'SOFT SKILLS',
              {
                'Problem Solving': 0.9,
                'Team Work': 0.85,
                'Comunicazione': 0.85,
              },
              isSmallScreen,
            ),
          ] else ...[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _buildSkillCategory(
                    context,
                    'LINGUAGGI',
                    {
                      'C/C++': 0.9,
                      'Python': 0.85,
                      'Java': 0.8,
                      'TypeScript': 0.85,
                      'JavaScript': 0.85,
                    },
                    isSmallScreen,
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: _buildSkillCategory(
                    context,
                    'WEB DEV',
                    {
                      'HTML/CSS': 0.9,
                      'Angular': 0.85,
                      'MySQL': 0.8,
                    },
                    isSmallScreen,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _buildSkillCategory(
                    context,
                    'AI & ML',
                    {
                      'Machine Learning': 0.85,
                      'Computer Vision': 0.8,
                      'PyTorch': 0.75,
                    },
                    isSmallScreen,
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: _buildSkillCategory(
                    context,
                    'SOFT SKILLS',
                    {
                      'Problem Solving': 0.9,
                      'Team Work': 0.85,
                      'Comunicazione': 0.85,
                    },
                    isSmallScreen,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildEducationSection(BuildContext context, bool isSmallScreen) {
    return Container(
      padding: EdgeInsets.all(isSmallScreen ? 16 : 20),
      decoration: BoxDecoration(
        color: Colors.black87,
        border: Border.all(
          color: Theme.of(context).colorScheme.tertiary.withOpacity(0.5),
          width: isSmallScreen ? 1 : 2,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.school,
                color: Theme.of(context).colorScheme.tertiary,
                size: isSmallScreen ? 20 : 24,
              ),
              SizedBox(width: isSmallScreen ? 8 : 10),
              Text(
                'FORMAZIONE',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.tertiary,
                  fontSize: isSmallScreen ? 16 : 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: isSmallScreen ? 12 : 16),
          Text(
            'LAUREA IN INFORMATICA',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: isSmallScreen ? 14 : 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillCategory(
    BuildContext context,
    String title,
    Map<String, double> skills,
    bool isSmallScreen,
  ) {
    return Container(
      padding: EdgeInsets.all(isSmallScreen ? 16 : 20),
      decoration: BoxDecoration(
        color: Colors.black87,
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
          width: isSmallScreen ? 1 : 2,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Titolo categoria
          Text(
            title,
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontSize: isSmallScreen ? 14 : 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: isSmallScreen ? 16 : 20),
          // Lista delle competenze
          ...skills.entries.map((skill) => Column(
            children: [
              Row(
                children: [
                  Text(
                    skill.key,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: isSmallScreen ? 12 : 14,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '${(skill.value * 100).toInt()}%',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                      fontSize: isSmallScreen ? 10 : 12,
                    ),
                  ),
                ],
              ),
              SizedBox(height: isSmallScreen ? 6 : 8),
              // Barra di progresso
              Container(
                height: isSmallScreen ? 3 : 4,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.circular(2),
                ),
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: skill.value,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Theme.of(context).colorScheme.primary,
                          Theme.of(context).colorScheme.secondary,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(2),
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
                          blurRadius: isSmallScreen ? 2 : 4,
                          spreadRadius: isSmallScreen ? 0.5 : 1,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: isSmallScreen ? 12 : 16),
            ],
          )).toList(),
        ],
      ),
    );
  }
} 