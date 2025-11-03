import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/assets.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: AspectRatio(
        aspectRatio: 2.6 / 4,
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            color: Colors.amber,
            image: DecorationImage(
              image: AssetImage(Assets.bookImage),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
