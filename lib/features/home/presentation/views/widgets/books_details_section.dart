import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/core/utils/styles.dart';
import 'package:flutter_application_1/features/home/presentation/views/widgets/book_rating.dart';
import 'package:flutter_application_1/features/home/presentation/views/widgets/custom_list_view_item.dart';
import 'package:flutter_application_1/features/home/presentation/views/widgets/free_preview_and_price.dart';

class BooksDetailsSection extends StatelessWidget {
  const BooksDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          child: const CustomBookImage(),
        ),
        const SizedBox(height: 20),
        Text(
          "The Jungle Book",
          style: Styles.textStyle30.copyWith(fontWeight: FontWeight.normal),
        ),
        const SizedBox(height: 5),
        Opacity(
          opacity: 0.7,
          child: Text(
            "Rudyard Kipling",
            style: Styles.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const SizedBox(height: 15),
        const BookRating(),
        const SizedBox(height: 40),
        const FreePreviewnPrice(),
      ],
    );
  }
}