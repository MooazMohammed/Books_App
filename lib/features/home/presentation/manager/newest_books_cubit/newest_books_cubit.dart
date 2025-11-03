import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use%20cases/fetch_newest_books_use_case.dart';
import 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.fetchNewestBooksUseCase) : super(NewestBooksInitial());

  final FetchNewestBooksUseCase fetchNewestBooksUseCase;
  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoading());

    var result = await fetchNewestBooksUseCase.call();

    result.fold(
      (failure) {
        emit(NewestBooksFailure(errMessage: failure.message));
      },
      (books) {
        emit(NewestBooksSuccess(books: books));
      },
    );
  }
}
