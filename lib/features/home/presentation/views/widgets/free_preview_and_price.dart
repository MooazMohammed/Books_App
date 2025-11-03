import 'package:flutter/material.dart';
import '../../../../../core/custom_button.dart';

class FreePreviewnPrice extends StatelessWidget {
  const FreePreviewnPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: CustomButton(
            backGroundColor: Colors.white,
            text: "19.99€",
            textColor: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
          ),
        ),
        Expanded(
          child: CustomButton(
            backGroundColor: Colors.deepOrangeAccent,
            text: "Free Preview",
            textColor: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          ),
        ),
      ],
    );
  }
}
