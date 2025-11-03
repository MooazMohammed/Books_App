import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:flutter_application_1/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:flutter_application_1/features/home/presentation/views/widgets/featured_list_view_item.dart';
import 'package:flutter_application_1/core/utils/styles.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: kPadding, child: CustomAppBar()),
              FeaturedListView(),
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
