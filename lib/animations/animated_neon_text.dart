import 'package:flutter/material.dart';

class AnimatedNeonText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final List<Color> colors;

  const AnimatedNeonText({
    super.key,
    required this.text,
    this.style,
    required this.colors,
  });

  @override
  State<AnimatedNeonText> createState() => _AnimatedNeonTextState();
}

class _AnimatedNeonTextState extends State<AnimatedNeonText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _glowAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _glowAnimation = Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _glowAnimation,
      builder: (context, child) {
        return ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: widget.colors,
          ).createShader(bounds),
          child: Text(
            widget.text,
            style: widget.style?.copyWith(
              shadows: [
                Shadow(
                  color: widget.colors.first.withOpacity(_glowAnimation.value * 0.5),
                  blurRadius: 10,
                ),
                Shadow(
                  color: widget.colors.last.withOpacity(_glowAnimation.value * 0.5),
                  blurRadius: 10,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
} 