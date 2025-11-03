import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_router.dart';
import 'package:flutter_application_1/core/utils/assets.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, bottom: 30),
      child: Row(
        children: [
          Image.asset(Assets.logo, height: 30),
          const Spacer(),
          IconButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.searchView);
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
    );
  }
}
