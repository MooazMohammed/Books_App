import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/errors/failure.dart';
import 'package:flutter_application_1/features/home/data/data_sources/home_loca_data_source.dart';
import 'package:flutter_application_1/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:flutter_application_1/features/home/domain/entities/book_entity.dart';
import 'package:flutter_application_1/features/home/domain/repos/home_repo.dart';

class HomeRepoImp extends HomeRepo {
  final HomeLocaDataSource homeLocaDataSource;
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepoImp({
    required this.homeLocaDataSource,
    required this.homeRemoteDataSource,
  });

  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() async {
    try {
      List<BookEntity> books;
      books = homeLocaDataSource.fetchFeaturedBooks();
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSource.fetchFeaturedBooks();

      return right(books);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(message: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async {
    try {
      List<BookEntity> books;
      books = homeLocaDataSource.fetchNewestBooks();
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSource.fetchNewestBooks();

      return right(books);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(message: e.toString()));
      }
    }
  }
}
