import 'dart:math';

import 'package:hive_flutter/adapters.dart';

import '../../../../constants.dart';
import '../../domain/entities/book_entity.dart';

abstract class HomeLocaDataSource {
  List<BookEntity> fetchFeaturedBooks();
  List<BookEntity> fetchNewestBooks();
  bool isCacheValid(String timesTempKey);
  void saveCacheTime(String timesTempKey);
  int getRandomStartIndex(String key);
  void saveStartIndex(String key, int index);
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

  @override
  bool isCacheValid(String timesTempKey) {
    var settingsBox = Hive.box(kSettingsBox);

    var lastCacheTime = settingsBox.get(timesTempKey);

    if (lastCacheTime == null) {
      return false;
    }
    var savedTime = DateTime.parse(lastCacheTime);
    var currentTime = DateTime.now();

    var differenceInHours = currentTime.difference(savedTime).inHours;

    return kCacheDuration > differenceInHours;
  }

  @override
  void saveCacheTime(String timesTempKey) {
    var box = Hive.box(kSettingsBox);

    box.put(timesTempKey, DateTime.now().toIso8601String());
    
     String startIndexKey = timesTempKey.contains('featured') 
        ? kFeaturedStartIndex 
        : kNewestStartIndex;
    
    int newRandomIndex = Random().nextInt(200);
    box.put(startIndexKey, newRandomIndex);



  }



  @override
  int getRandomStartIndex(String key) {
    var box = Hive.box(kSettingsBox);

    int? savedIndex = box.get(key) as int?;

    if (savedIndex != null) {
      return savedIndex;
    }

    int randomStartIndex = Random().nextInt(200);
    box.put(key, randomStartIndex);

    return randomStartIndex;
  }



  @override
  void saveStartIndex(String key, int index) {
    var box = Hive.box(kSettingsBox);

        box.put(key, index);

  }
}
