
import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/utils/api_service.dart';
import 'package:flutter_application_1/features/home/data/data_sources/home_loca_data_source.dart';
import 'package:flutter_application_1/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:flutter_application_1/features/home/data/repos/home_repo_imp.dart';
import 'package:get_it/get_it.dart';


final getIt = GetIt.instance;
void setUpSeviceLocator() {
   getIt.registerSingleton<ApiService>(ApiService(dio: Dio()));
   
   getIt.registerSingleton<HomeRepoImp>(

    HomeRepoImp(
      homeLocaDataSource: HomeLocalDataSourceImpl(
      ),
      homeRemoteDataSource: HomeRemoteDataSourceImpl(
        apiService: getIt.get<ApiService>(),
      ),
    ),
  );
}
