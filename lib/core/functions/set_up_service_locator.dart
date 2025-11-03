
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/data_sources/home_loca_data_source.dart';
import '../../features/home/data/data_sources/home_remote_data_source.dart';
import '../../features/home/data/repos/home_repo_imp.dart';
import '../utils/api_service.dart';


final getIt = GetIt.instance;
void setUpSeviceLocator() {
  //  getIt.registerSingleton<ApiService>(ApiService(dio: Dio()));
   
   getIt.registerSingleton<HomeRepoImp>(

    HomeRepoImp(
      homeLocaDataSource: HomeLocalDataSourceImpl(
      ),
      homeRemoteDataSource: HomeRemoteDataSourceImpl(
        apiService: ApiService(dio: Dio()),
      ),
    ),
  );
}
