import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter_application_1/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
void initState() {
  super.initState();

  WidgetsBinding.instance.addPostFrameCallback((_) {
    BlocProvider.of<FeaturedBooksCubit>(context).fetchFeatchuredBooks();
    BlocProvider.of<NewestBooksCubit>(context).fetchNewestBooksUseCase();
  });
}

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: HomeViewBody());
  }
}
