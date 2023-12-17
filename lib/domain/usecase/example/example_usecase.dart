import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:societymanager/core/error/error.dart';
import 'package:societymanager/core/usecase/usecase_with_either.dart';
import 'package:societymanager/domain/entities/example/someentity.dart';
import 'package:societymanager/domain/repo/example/example_repository.dart';

@LazySingleton()
class ExampleUsecase implements UsecaseWithEither<List<SomeEntity>, void> {
  ExampleUsecase(this.exampleRepository);
  final ExampleRepository exampleRepository;

  @override
  Future<Either<Failure, List<SomeEntity>>> call(void params) {
    return exampleRepository.getSomeResponse();
  }
}
