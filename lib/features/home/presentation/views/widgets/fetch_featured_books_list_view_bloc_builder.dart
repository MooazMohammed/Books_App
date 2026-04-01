import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter_application_1/features/home/presentation/views/widgets/featured_list_view_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FetchFeaturedBooksListViewBlocBuilder extends StatelessWidget {
  const FetchFeaturedBooksListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return FeaturedListView(books: state.books, isLoadingMore: false,);
        } else if (state is FeaturedBooksPaginationLoading) {
          return FeaturedListView(
            books: state.currentBooks,
            isLoadingMore: true,
          );
        } else if (state is FeaturedBooksFailure) {
          return Text(state.errMessage);
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
 
  //  Initial
  //  sucess
  //  failure
  //  Loading
  //  LoadingPagination
  //  FailurePagination









}


