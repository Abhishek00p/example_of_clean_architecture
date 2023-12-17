import 'package:dartz/dartz.dart';
import 'package:societymanager/core/error/failure.dart';
import 'package:societymanager/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, AppUserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
}
