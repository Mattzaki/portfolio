import 'package:flutter/material.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

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
              'COMPETENZE',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.white,
                letterSpacing: 4,
              ),
            ),
          ),
          const SizedBox(height: 40),

          // Formazione
          _buildEducationSection(context),
          const SizedBox(height: 40),

          // Categorie di competenze
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Linguaggi di Programmazione
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
                ),
              ),
              const SizedBox(width: 20),
              // Web Development
              Expanded(
                child: _buildSkillCategory(
                  context,
                  'WEB DEV',
                  {
                    'HTML/CSS': 0.9,
                    'Angular': 0.85,
                    'MySQL': 0.8,
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // AI & ML
              Expanded(
                child: _buildSkillCategory(
                  context,
                  'AI & ML',
                  {
                    'Machine Learning': 0.85,
                    'Computer Vision': 0.8,
                    'PyTorch': 0.75,
                  },
                ),
              ),
              const SizedBox(width: 20),
              // Soft Skills
              Expanded(
                child: _buildSkillCategory(
                  context,
                  'SOFT SKILLS',
                  {
                    'Problem Solving': 0.9,
                    'Team Work': 0.85,
                    'Comunicazione': 0.85,
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEducationSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.black87,
        border: Border.all(
          color: Theme.of(context).colorScheme.tertiary.withOpacity(0.5),
          width: 2,
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
                size: 24,
              ),
              const SizedBox(width: 10),
              Text(
                'FORMAZIONE',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.tertiary,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'LAUREA IN INFORMATICA',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 16,
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
  ) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.black87,
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
          width: 2,
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
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          // Lista delle competenze
          ...skills.entries.map((skill) => Column(
            children: [
              Row(
                children: [
                  Text(
                    skill.key,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '${(skill.value * 100).toInt()}%',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              // Barra di progresso
              Container(
                height: 4,
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
                          blurRadius: 4,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          )).toList(),
        ],
      ),
    );
  }
} 