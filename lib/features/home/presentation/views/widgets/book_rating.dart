import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/styles.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.star, color: Color(0xffFFDD4F)),
        const SizedBox(width: 6.3),
        const Text("4.8", style: Styles.textStyle16),
        const SizedBox(width: 5),
        Opacity(
          opacity: 0.5,
          child: Text(
            "(2390)",
            style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}
