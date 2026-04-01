import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter_application_1/features/home/presentation/manager/newest_books_cubit/newest_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';
import 'best_seller_list_view.dart';
import 'custom_app_bar.dart';
import 'fetch_featured_books_list_view_bloc_builder.dart';

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
              FetchFeaturedBooksListViewBlocBuilder(),
              SizedBox(height: 30),
              Padding(
                padding: kPadding,
                child: Text('Newest Books', style: Styles.textStyle18),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
        SliverFillRemaining(
          child: Padding(
            padding: kPadding,
            child: NewestBooksListViewBlocBuilder(),
          ),
        ),
      ],
    );
  }
}

class NewestBooksListViewBlocBuilder extends StatelessWidget {
  const NewestBooksListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return NewestBooksListView(books: state.books);
        } else if (state is NewestBooksPaginationLoading) {
          return NewestBooksListView(books: state.currentBooks,);
        } else if (state is NewestBooksFailure) {
          return Center(child: Text(state.errMessage));
        } else {
          return const Center(child: CircularProgressIndicator());
          
        }
      },
    );
  }
}
