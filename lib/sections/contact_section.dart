import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

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
              'CONTATTI',
              style: (isSmallScreen
                ? Theme.of(context).textTheme.titleLarge
                : Theme.of(context).textTheme.headlineMedium)?.copyWith(
                color: Colors.white,
                letterSpacing: isSmallScreen ? 2 : 4,
              ),
            ),
          ),
          SizedBox(height: isSmallScreen ? 20 : 40),

          // Container principale dei contatti
          Container(
            padding: EdgeInsets.all(isSmallScreen ? 16 : 24),
            decoration: BoxDecoration(
              color: Colors.black87,
              border: Border.all(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
                width: isSmallScreen ? 1 : 2,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                // Email
                _buildContactItem(
                  context,
                  icon: Icons.email,
                  title: 'EMAIL',
                  value: 'matteo.zacchino2000@gmail.com',
                  onCopy: () => _copyToClipboard(context, 'matteo.zacchino2000@gmail.com'),
                  isSmallScreen: isSmallScreen,
                ),
                SizedBox(height: isSmallScreen ? 16 : 24),
                
                // Telefono
                _buildContactItem(
                  context,
                  icon: Icons.phone,
                  title: 'TELEFONO',
                  value: '+39 331 230 1423',
                  onCopy: () => _copyToClipboard(context, '3312301423'),
                  isSmallScreen: isSmallScreen,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String value,
    required VoidCallback onCopy,
    required bool isSmallScreen,
  }) {
    return Container(
      padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        children: [
          // Icona e titolo
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Theme.of(context).colorScheme.primary,
                size: isSmallScreen ? 16 : 20,
              ),
              SizedBox(width: isSmallScreen ? 6 : 8),
              Text(
                title,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: isSmallScreen ? 12 : 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: isSmallScreen ? 8 : 12),
          // Valore e pulsante copia
          if (isSmallScreen)
            Column(
              children: [
                Text(
                  value,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: isSmallScreen ? 12 : 14,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                _buildCopyButton(context, onCopy, isSmallScreen),
              ],
            )
          else
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  value,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: isSmallScreen ? 12 : 14,
                  ),
                ),
                SizedBox(width: isSmallScreen ? 6 : 8),
                _buildCopyButton(context, onCopy, isSmallScreen),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildCopyButton(BuildContext context, VoidCallback onCopy, bool isSmallScreen) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onCopy,
        child: Container(
          padding: EdgeInsets.all(isSmallScreen ? 3 : 4),
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Icon(
            Icons.copy,
            color: Theme.of(context).colorScheme.secondary,
            size: isSmallScreen ? 14 : 16,
          ),
        ),
      ),
    );
  }

  void _copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Copiato negli appunti!',
          style: TextStyle(
            color: Theme.of(context).colorScheme.tertiary,
            fontSize: MediaQuery.of(context).size.width < 600 ? 12 : 14,
          ),
        ),
        backgroundColor: Colors.black87,
        duration: const Duration(seconds: 2),
      ),
    );
  }
} 