
import 'package:dartz/dartz.dart';
import 'package:societymanager/core/error/failure.dart';

/// Use this class as a interface for the
/// [Future<<Either,Type>>] returning usecases
abstract class UsecaseWithEither<Type, Params> {
  /// [Type] is the return type whereas [Params] are
  /// the arguments/parameters
  Future<Either<Failure, Type>> call(Params params);
}
