import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'sections/about_section.dart';
import 'sections/projects_section.dart';
import 'sections/skills_section.dart';
import 'sections/contact_section.dart';
import 'animations/animated_neon_container.dart';
import 'animations/animated_neon_text.dart';
import 'animations/fade_in_section.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Il Mio Portfolio',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0A0A1F),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF00FFFF),    // Cyan neon
          secondary: Color(0xFFFF00FF),   // Magenta neon
          tertiary: Color(0xFFFFFF00),    // Yellow neon
          background: Color(0xFF0A0A1F),  // Dark blue-black
          surface: Color(0xFF1A1A3F),     // Slightly lighter blue-black
        ),
        textTheme: GoogleFonts.pressStart2pTextTheme(
          ThemeData.dark().textTheme,
        ),
        useMaterial3: true,
      ),
      home: const PortfolioHomePage(),
    );
  }
}

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  final ScrollController _scrollController = ScrollController();
  int _selectedIndex = 0;
  bool _showBackToTop = false;

  // Lista delle altezze delle sezioni per la navigazione
  final List<double> _sectionHeights = [0, 800, 1600, 2400, 3200];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _showBackToTop = _scrollController.offset > 600;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _scrollController.animateTo(
      _sectionHeights[index],
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
    setState(() {
      _selectedIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            // Barra di navigazione
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                border: Border(
                  bottom: BorderSide(
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                    width: 2,
                  ),
                ),
              ),
              child: NavigationBar(
                backgroundColor: Colors.transparent,
                surfaceTintColor: Colors.transparent,
                indicatorColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                selectedIndex: _selectedIndex,
                onDestinationSelected: _scrollToSection,
                destinations: const [
                  NavigationDestination(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.person),
                    label: 'Chi Sono',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.work),
                    label: 'Progetti',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.code),
                    label: 'Competenze',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.contact_mail),
                    label: 'Contatti',
                  ),
                ],
              ),
            ),
            
            // Sezione Hero
            Container(
              height: 600,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                image: const DecorationImage(
                  image: NetworkImage('https://raw.githubusercontent.com/rajput-hemant/rajput-hemant/master/assets/grid.png'),
                  repeat: ImageRepeat.repeat,
                  opacity: 0.1,
                ),
              ),
              child: Stack(
                children: [
                  // Effetto griglia in movimento
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Theme.of(context).colorScheme.primary.withOpacity(0.1),
                            Theme.of(context).colorScheme.secondary.withOpacity(0.1),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Contenuto Hero
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedNeonText(
                          text: 'BENVENUTO',
                          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 8,
                          ),
                          colors: [
                            Theme.of(context).colorScheme.primary,
                            Theme.of(context).colorScheme.secondary,
                          ],
                        ),
                        const SizedBox(height: 20),
                        AnimatedNeonText(
                          text: 'NEL MIO PORTFOLIO',
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            color: Colors.white,
                            letterSpacing: 4,
                          ),
                          colors: [
                            Theme.of(context).colorScheme.tertiary,
                            Theme.of(context).colorScheme.primary,
                          ],
                        ),
                        const SizedBox(height: 40),
                        AnimatedNeonContainer(
                          borderColor: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(4),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            child: Text(
                              'SVILUPPATORE SOFTWARE & DESIGNER',
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Sezioni del portfolio
            Container(
              padding: const EdgeInsets.all(32),
              child: Column(
                children: [
                  FadeInSection(
                    child: const AboutSection(),
                  ),
                  const SizedBox(height: 100),
                  FadeInSection(
                    child: const ProjectsSection(),
                  ),
                  const SizedBox(height: 100),
                  FadeInSection(
                    child: const SkillsSection(),
                  ),
                  const SizedBox(height: 100),
                  FadeInSection(
                    child: const ContactSection(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: AnimatedOpacity(
        opacity: _showBackToTop ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 200),
        child: FloatingActionButton(
          onPressed: _showBackToTop ? _scrollToTop : null,
          backgroundColor: Theme.of(context).colorScheme.surface,
          foregroundColor: Theme.of(context).colorScheme.primary,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
                width: 2,
              ),
            ),
            child: const Icon(Icons.arrow_upward),
          ),
        ),
      ),
    );
  }

  Widget _buildRetroSection(BuildContext context, String title) {
    return Container(
      padding: const EdgeInsets.all(20),
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
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'IN COSTRUZIONE',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.tertiary,
            ),
          ),
        ],
      ),
    );
  }
}
