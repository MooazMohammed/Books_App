import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/constants.dart';

import '../../../../core/errors/failure.dart';
import '../../domain/entities/book_entity.dart';
import '../../domain/repos/home_repo.dart';
import '../data_sources/home_loca_data_source.dart';
import '../data_sources/home_remote_data_source.dart';

class HomeRepoImp extends HomeRepo {
  final HomeLocaDataSource homeLocaDataSource;
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepoImp({
    required this.homeLocaDataSource,
    required this.homeRemoteDataSource,
  });

  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks({
    bool forceRefresh = false,
    int pageNumber = 0,
  }) async {
    try {
      if (!forceRefresh && pageNumber == 0) {
        bool isCacheValid = homeLocaDataSource.isCacheValid(
          kFeaturedBoxTimesTemp,
        );

        if (isCacheValid) {
          List<BookEntity> localBooks = homeLocaDataSource.fetchFeaturedBooks();

          if (localBooks.isNotEmpty) {
            return right(localBooks);
          }
        }
      }

      int baseStartIndex = homeLocaDataSource.getRandomStartIndex(
        kFeaturedStartIndex,
      );

      List<BookEntity> remotebooks;
      remotebooks = await homeRemoteDataSource.fetchFeaturedBooks(
        pageNumber: pageNumber,
        baseStartIndex: baseStartIndex,
      );

      if (pageNumber == 0) {
        homeLocaDataSource.saveCacheTime(kFeaturedBoxTimesTemp);
      }

      return right(remotebooks);
    } on Exception catch (e) {
      List<BookEntity> localbooks = homeLocaDataSource.fetchFeaturedBooks();
      if (localbooks.isNotEmpty) {
        return right(localbooks);
      }

      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(message: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks({
    bool forceRefresh = false,
    int pageNumber = 0,
  }) async {
    try {
      if (!forceRefresh && pageNumber == 0) {
        bool isCacheValid = homeLocaDataSource.isCacheValid(
          kNewestBoxTimesTemp,
        );

        if (isCacheValid) {
          List<BookEntity> localBooks = homeLocaDataSource.fetchNewestBooks();

          if (localBooks.isNotEmpty) {
            return right(localBooks);
          }
        }
      }
      int baseStartIndex = homeLocaDataSource.getRandomStartIndex(
        kNewestStartIndex,
      );
      List<BookEntity> remotebooks;
      remotebooks = await homeRemoteDataSource.fetchNewestBooks(
        baseStartIndex: baseStartIndex,
        pageNumber: pageNumber,
      );

      if (pageNumber == 0) {
        homeLocaDataSource.saveCacheTime(kNewestBoxTimesTemp);
      }

      return right(remotebooks);
    } on Exception catch (e) {
      List<BookEntity> localbooks = homeLocaDataSource.fetchNewestBooks();
      if (localbooks.isNotEmpty) {
        return right(localbooks);
      }

      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(message: e.toString()));
      }
    }
  }
}
