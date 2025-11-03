import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/errors/failure.dart';
import 'package:flutter_application_1/core/use%20cases/no_param_use_case.dart';
import 'package:flutter_application_1/features/home/domain/entities/book_entity.dart';
import 'package:flutter_application_1/features/home/domain/repos/home_repo.dart';

class FetchFeaturedBooksUseCase extends UseCase<List<BookEntity>> {
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<BookEntity>>> call() async {
    return await homeRepo.fetchFeaturedBooks();
  }
}




