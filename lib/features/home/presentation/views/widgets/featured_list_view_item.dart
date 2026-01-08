import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/domain/entities/book_entity.dart';
import 'custom_list_view_item.dart';

class FeaturedListView extends StatelessWidget {
  const FeaturedListView({super.key, required this.books});
  final List<BookEntity> books;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.builder(
        itemCount: books.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return  Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: CustomBookImage(imageUrl: books[index].image ?? "",),
            
          );
        },
        
      ),
    );
  }
}
