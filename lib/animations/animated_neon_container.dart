import 'package:flutter/material.dart';

class AnimatedNeonContainer extends StatefulWidget {
  final Widget child;
  final Color borderColor;
  final double borderWidth;
  final BorderRadius? borderRadius;

  const AnimatedNeonContainer({
    super.key,
    required this.child,
    required this.borderColor,
    this.borderWidth = 2,
    this.borderRadius,
  });

  @override
  State<AnimatedNeonContainer> createState() => _AnimatedNeonContainerState();
}

class _AnimatedNeonContainerState extends State<AnimatedNeonContainer>
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
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: widget.borderRadius,
            border: Border.all(
              color: widget.borderColor,
              width: widget.borderWidth,
            ),
            boxShadow: [
              BoxShadow(
                color: widget.borderColor.withOpacity(_glowAnimation.value * 0.5),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: child,
        );
      },
      child: widget.child,
    );
  }
} 