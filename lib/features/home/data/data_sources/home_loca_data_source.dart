import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/features/home/domain/entities/book_entity.dart';
import 'package:hive_flutter/adapters.dart';

abstract class HomeLocaDataSource {
  List<BookEntity> fetchFeaturedBooks();
  List<BookEntity> fetchNewestBooks();
}

class HomeLocalDataSourceImpl extends HomeLocaDataSource {
 

  HomeLocalDataSourceImpl();

  @override
  List<BookEntity> fetchFeaturedBooks() {
    var box = Hive.box<BookEntity>(kFeaturedBox);

    return box.values.toList();
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    var box = Hive.box<BookEntity>(kNewestBox);

    return box.values.toList();
  }

 
  
}
