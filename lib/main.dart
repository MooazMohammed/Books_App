import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/core/functions/set_up_service_locator.dart';
import 'package:flutter_application_1/core/utils/app_router.dart';
import 'package:flutter_application_1/core/utils/simple_bloc_observer.dart';
import 'package:flutter_application_1/features/home/data/repos/home_repo_imp.dart';
import 'package:flutter_application_1/features/home/domain/entities/book_entity.dart';
import 'package:flutter_application_1/features/home/domain/use%20cases/fetch_featured_books_use_case.dart';
import 'package:flutter_application_1/features/home/domain/use%20cases/fetch_newest_books_use_case.dart';
import 'package:flutter_application_1/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter_application_1/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  runApp(const MyApp());
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  setUpSeviceLocator();
  Bloc.observer = SimpleBlocObserver();
  await Hive.openBox(kFeaturedBox);
  await Hive.openBox(kNewestBox);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
            FetchFeaturedBooksUseCase(homeRepo: getIt.get<HomeRepoImp>()),
          ),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(
            FetchNewestBooksUseCase(homeRepo: getIt.get<HomeRepoImp>()),
          ),
        ),
      ],

      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
      ),
    );
  }
}
