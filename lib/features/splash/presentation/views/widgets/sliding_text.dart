
import 'package:flutter/material.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (context, _) {
        return   Center(
        child: SlideTransition(
          position: slidingAnimation,
          child: const Text('Read from books'),
        ),
      );
      },
      animation: slidingAnimation,
     
    );
  }
}
