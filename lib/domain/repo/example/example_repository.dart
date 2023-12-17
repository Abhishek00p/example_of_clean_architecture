
import 'package:dartz/dartz.dart';
import 'package:societymanager/core/error/error.dart';
import 'package:societymanager/domain/entities/example/someentity.dart';

abstract class ExampleRepository {
  Future<Either<Failure, List<SomeEntity>>> getSomeResponse();
}
/////////////