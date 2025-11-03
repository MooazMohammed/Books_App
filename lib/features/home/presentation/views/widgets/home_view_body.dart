import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';
import 'best_seller_list_view.dart';
import 'custom_app_bar.dart';
import 'fetch_featured_books_list_view_bloc_builder.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: kPadding, child: CustomAppBar()),
              FetchFeaturedBooksListViewBlocBuilder(),
              SizedBox(height: 30),
              Padding(
                padding: kPadding,
                child: Text('Best Seller', style: Styles.textStyle18),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
        SliverFillRemaining(
          child: Padding(padding: kPadding, child: BestSellerListView()),
        ),
      ],
    );
  }


}
