import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/features/home/domain/entities/book_entity.dart';
import 'package:flutter_application_1/features/home/domain/use%20cases/fetch_featured_books_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.featuredBooksUseCase) : super(FeaturedBooksInitial());

  final FetchFeaturedBooksUseCase featuredBooksUseCase;
  Future<void> fetchFeatchuredBooks() async {
    emit(FeaturedBooksLoading());

    var result = await featuredBooksUseCase.call();

    result.fold(
      (l) {
        emit(FeaturedBooksFailure(errMessage: l.message));
      },
      (r) {
        emit(FeaturedBooksSuccess(books: r));
      },
    );
  }
}
