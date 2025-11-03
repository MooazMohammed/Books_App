
import 'package:flutter/widgets.dart';
import '../../../../../core/utils/styles.dart';
import 'smaller_list_view_books.dart';

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
