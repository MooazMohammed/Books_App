import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/domain/entities/book_entity.dart';
import 'best_seller_list_view_item.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({super.key, required this.books});
  final List<BookEntity> books;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return  Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: NewestBooksListViewItem(book: books[index],),
        );
      },
    );
  }
}
