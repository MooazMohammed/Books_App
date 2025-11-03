

import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/features/home/presentation/views/widgets/custom_list_view_item.dart';

class SmallerListViewBooks extends StatelessWidget {
  const SmallerListViewBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,

      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: CustomBookImage(),
          );
        },
      ),
    );
  }
}
