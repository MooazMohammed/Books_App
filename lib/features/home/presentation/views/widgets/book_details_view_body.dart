import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/features/home/presentation/views/widgets/books_details_section.dart';
import 'package:flutter_application_1/features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:flutter_application_1/features/home/presentation/views/widgets/similar_books_section.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: kPadding,
              child: Column(
                children: [
                  CustomBookDetailsAppBar(),
                  BooksDetailsSection(),
                  Expanded(child: SizedBox(height: 50)),
                  SimilarBooksSection(),
                  SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


