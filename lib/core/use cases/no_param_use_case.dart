import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/errors/failure.dart';

abstract class UseCase<T> {
  Future<Either<Failure, T>> call();
}