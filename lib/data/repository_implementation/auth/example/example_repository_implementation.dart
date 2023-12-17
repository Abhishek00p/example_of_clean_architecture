import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:societymanager/data/datasource/example/example_datasource.dart';
import 'package:societymanager/core/error/error.dart';
import 'package:societymanager/domain/entities/example/someentity.dart';
import 'package:societymanager/domain/repo/example/example_repository.dart';

@LazySingleton(as: ExampleRepository)
class ExampleRepositoryImplementation implements ExampleRepository {
  ExampleRepositoryImplementation({
    required this.apiExceptionHandler,
    required this.exampleDatasource,
  });

  ApiExceptionHandler apiExceptionHandler;
  ExampleDatasource exampleDatasource;

  @override
  Future<Either<Failure, List<SomeEntity>>> getSomeResponse() async {
    try {
      final httpresponse = await exampleDatasource.getSomeResponse(
          // userJWTtoken: userJWTtoken,
          );
      return Right<Failure, List<SomeEntity>>(httpresponse);
    } on NotFoundException {
      return Left<Failure, List<SomeEntity>>(NotFoundFailure());
    } catch (e) {
      return apiExceptionHandler.mapExceptionToFailure<List<SomeEntity>>(e);
    }
  }
}
