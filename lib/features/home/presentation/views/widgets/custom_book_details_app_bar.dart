import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBookDetailsAppBar extends StatelessWidget {
  const CustomBookDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(Icons.close_rounded),
          padding: EdgeInsets.zero,
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(CupertinoIcons.cart),
          padding: EdgeInsets.zero,
        ),
      ],
    );
  }
}
