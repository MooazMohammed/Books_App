part of 'featured_books_cubit.dart';

@immutable
sealed class FeaturedBooksState {}

final class FeaturedBooksInitial extends FeaturedBooksState {}

final class FeaturedBooksLoading extends FeaturedBooksState {}

final class FeaturedBooksFailure extends FeaturedBooksState {
  final String errMessage;

  FeaturedBooksFailure({required this.errMessage});
}

final class FeaturedBooksSuccess extends FeaturedBooksState {
  final List<BookEntity> books;

  FeaturedBooksSuccess({required this.books});
}

final class FeaturedBooksPaginationLoading extends FeaturedBooksState {
  final List<BookEntity> currentBooks;

  FeaturedBooksPaginationLoading({required this.currentBooks});
}

final class FeaturedBooksPaginationFailure extends FeaturedBooksState {
  final List<BookEntity> currentBooks;
  final String errMessage;

  FeaturedBooksPaginationFailure( {required this.currentBooks , required this.errMessage,});
}
