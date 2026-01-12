import 'package:hive_flutter/hive_flutter.dart';

import '../../../../constants.dart';
import '../../../../core/utils/api_service.dart';
import '../../domain/entities/book_entity.dart';
import '../models/book_model/book_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0, int baseStartIndex =0});
  Future<List<BookEntity>> fetchNewestBooks({int pageNumber = 0, int baseStartIndex =0});
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0, int baseStartIndex =0}) async {
    int startIndex = baseStartIndex + ( pageNumber * 10 );

    var data = await apiService.get(
      endPoint:
          'volumes?Filtering=free-ebooks&q=programming&startIndex=$startIndex&maxResults=10',
    );
    List<BookEntity> books = [];
    getsBookList(data, books);
    saveLocalData(books, kFeaturedBox, isFirstPage: pageNumber == 0);

    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks({int pageNumber = 0, int baseStartIndex =0}) async {

  int startIndex = baseStartIndex + ( pageNumber * 10 );


    var data = await apiService.get(
      endPoint:
          'volumes?Filtering=free-ebooks&sorting=newest&q=programming&startIndex=$startIndex&maxResults=10',
    );
    List<BookEntity> books = [];
    getsBookList(data, books);
    saveLocalData(books, kNewestBox, isFirstPage:  pageNumber == 0);

    return books;
  }

  void getsBookList(Map<String, dynamic> data, List<BookEntity> books) {
    final items = data['items'] as List<dynamic>?;
    if (items != null) {
      for (var bookMap in items) {
        books.add(BookModel.fromJson(bookMap));
      }
    }
  }

  void saveLocalData(
    List<BookEntity> books,
    String boxName, {
    bool isFirstPage = true,
  }) {
    var box = Hive.box<BookEntity>(boxName);

    if (isFirstPage) {
      box.clear();
    }

    box.addAll(books);
  }
}
