
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/core/utils/styles.dart';
import 'package:flutter_application_1/features/home/presentation/views/widgets/smaller_list_view_books.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Align(
          alignment: AlignmentGeometry.centerLeft,
          child: Text("You can also like", style: Styles.textStyle18),
        ),
        SizedBox(height: 20),
        SmallerListViewBooks(),
      ],
    );
  }
}
