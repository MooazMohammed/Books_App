import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'constants.dart';
import 'core/functions/set_up_service_locator.dart';
import 'core/utils/app_router.dart';
import 'core/utils/simple_bloc_observer.dart';
import 'features/home/data/repos/home_repo_imp.dart';
import 'features/home/domain/entities/book_entity.dart';
import 'features/home/domain/use%20cases/fetch_featured_books_use_case.dart';
import 'features/home/domain/use%20cases/fetch_newest_books_use_case.dart';
import 'features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';

void main() async {
 
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  setUpSeviceLocator();
  Bloc.observer = SimpleBlocObserver();

  await Hive.openBox<BookEntity>(kFeaturedBox);

  await Hive.openBox<BookEntity>(kNewestBox);
 
  runApp(const MyApp());
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
