import 'package:flutter_application_1/features/home/domain/entities/book_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use%20cases/fetch_newest_books_use_case.dart';
import 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.fetchNewestBooksUseCase) : super(NewestBooksInitial());

  final FetchNewestBooksUseCase fetchNewestBooksUseCase;
  List<BookEntity> _allBooks = [];
  int _currentPage = 0;
  bool _isLoadingMore = false;

  Future<void> fetchNewestBooks({forceRefresh = false, pageNumber = 0}) async {
    if (forceRefresh) {
      _currentPage = 0;
      _allBooks = [];
    }

    emit(NewestBooksLoading());

    var result = await fetchNewestBooksUseCase.call(
      forceRefresh: forceRefresh,
      pageNumber: _currentPage,
    );

    result.fold(
      (failure) {
        emit(NewestBooksFailure(errMessage: failure.message));
      },
      (books) {
        _allBooks = books;
        emit(NewestBooksSuccess(books: books));
      },
    );
  }

  Future<void> fetchMoreNewestBooks({
    forceRefresh = false,
    pageNumber = 0,
  }) async {
    if (_isLoadingMore) {
      return;
    }

    _isLoadingMore = true;
    _currentPage++;

    emit(NewestBooksPaginationLoading(currentBooks: _allBooks));

    var result = await fetchNewestBooksUseCase.call(
      forceRefresh: true,
      pageNumber: _currentPage,
    );

    result.fold(
      (failure) {
        _currentPage--;
        emit(
          NewestBooksPaginationLoadingFailure(
            errMessage: failure.message,
            currentBooks: _allBooks,
          ),
        );
      },
      (books) {
        _allBooks.addAll(books);
        emit(NewestBooksSuccess(books: List.from(_allBooks)));
      },
    );
  }
}
