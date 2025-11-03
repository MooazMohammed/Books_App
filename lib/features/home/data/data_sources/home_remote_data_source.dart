import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/core/utils/api_service.dart';
import 'package:flutter_application_1/features/home/data/models/book_model/book_model.dart';
import 'package:flutter_application_1/features/home/domain/entities/book_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var data = await apiService.get(
      endPoint: 'volumes?Filtering=free-ebooks&q=programming',
    );
    List<BookEntity> books = [];
    getsBookList(data, books);
    saveLocalData(books, kFeaturedBox);
  
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data = await apiService.get(
      endPoint: 'volumes?Filtering=free-ebooks&sorting=newest&q=programming',
    );
    List<BookEntity> books = [];
    getsBookList(data, books);
    saveLocalData(books, kNewestBox);

    return books;
  }

  void getsBookList(Map<dynamic, String> data, List<BookEntity> books) {
    final items = data['items'] as List<dynamic>?;
    if (items != null) {
      for (var bookMap in items) {
        books.add(BookModel.fromJson(bookMap));
      }
    }
  }

  void saveLocalData(List<BookEntity> books, String boxName) {
    var box = Hive.box(boxName);
    box.add(books);
  }
}
