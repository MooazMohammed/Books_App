import 'package:hive_flutter/adapters.dart';

import '../../../../constants.dart';
import '../../domain/entities/book_entity.dart';

abstract class HomeLocaDataSource {
  List<BookEntity> fetchFeaturedBooks();
  List<BookEntity> fetchNewestBooks();
  bool isCacheValid(String timesTempKey);
  void saveCacheTime(String timesTempKey);
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
  bool isCacheValid(String TimesTempKey) {
    var settingsBox = Hive.box(kSettingsBox);

    var lastCacheTime = settingsBox.get(TimesTempKey);

    if (lastCacheTime == null) {
      return false;
    }
    var savedTime = DateTime.parse(lastCacheTime);
    var currentTime = DateTime.now();

    var differenceInHours = currentTime.difference(savedTime).inHours;

    return kCacheDuration > differenceInHours;
  }

  @override
  void saveCacheTime(String TimesTempKey) {
    var box = Hive.box(kSettingsBox);

    box.put(TimesTempKey, DateTime.now().toIso8601String());

  }
}
