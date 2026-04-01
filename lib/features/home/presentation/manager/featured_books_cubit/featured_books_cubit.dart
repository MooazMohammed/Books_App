import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/book_entity.dart';
import '../../../domain/use%20cases/fetch_featured_books_use_case.dart';
part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.featuredBooksUseCase) : super(FeaturedBooksInitial());

  final FetchFeaturedBooksUseCase featuredBooksUseCase;

  List<BookEntity> _allBooks = [];
  int _currentPage = 0;
  bool _isLoadingMore = false;

  Future<void> fetchFeaturedBooks({bool forceRefresh = false}) async {
    if (forceRefresh) {
      _currentPage = 0;
      _allBooks = [];
    }

    emit(FeaturedBooksLoading());

    var result = await featuredBooksUseCase.call(
      pageNumber: _currentPage,
      forceRefresh: forceRefresh,
    );

    result.fold(
      (failure) {
        emit(FeaturedBooksFailure(errMessage: failure.message));
      },
      (books) {
        _allBooks = books;
        emit(FeaturedBooksSuccess(books: books));
      },
    );
  }

  Future<void> fetchMoreFeaturedBooks() async {
    if (_isLoadingMore) {
      return;
    }

    _isLoadingMore = true;
    _currentPage++;

    emit(FeaturedBooksPaginationLoading(currentBooks: _allBooks));

    var result = await featuredBooksUseCase.call(
      pageNumber: _currentPage,
      forceRefresh: true,
    );

    result.fold(
      (failure) {
        _currentPage--;
        emit(
          FeaturedBooksPaginationFailure(
            errMessage: failure.message,
            currentBooks: _allBooks,
          ),
        );
      },
      (newBooks) {
        _allBooks.addAll(newBooks);
        emit(FeaturedBooksSuccess(books: List.from(_allBooks)));
      },
    );
    _isLoadingMore = false;
  }
}
