import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:societymanager/core/error/exception.dart';
import 'package:societymanager/core/error/failure.dart';

@Singleton()
class ApiExceptionHandler {
  void throwHttpExceptionBasedOnStatusCode(int statusCode) {
    if (statusCode == HttpStatus.notFound) {
      throw NotFoundException(); // 404
    } else if (statusCode == HttpStatus.serviceUnavailable) {
      throw ServerUnavailableException(); // 503
    } else if (statusCode == HttpStatus.internalServerError) {
      throw InternalServerException(); // 500
    } else if (statusCode == HttpStatus.badRequest) {
      throw BadRequestException(); // 400
    } else if (statusCode == HttpStatus.conflict) {
      throw ConflictException(); // 409
    }
  }

  void throwNetworkOrUnknownError(dynamic exception) {
    if (exception is SocketException) {
      throw NoInternetConnectionException();
    }
    if (exception is FormatException) {
      throw ParseJsonException();
    }
    throw SomethingWentWrongException();
  }

  Either<Failure, T> mapExceptionToFailure<T>(dynamic exception) {
    if (exception is NoInternetConnectionException) {
      return Left<Failure, T>(NoInternetConnectionFailure());
    } else if (exception is NotFoundException) {
      return Left<Failure, T>(NotFoundFailure());
    } else if (exception is ServerUnavailableException) {
      return Left<Failure, T>(ServerUnavailableFailure());
    } else if (exception is SomethingWentWrongException) {
      return Left<Failure, T>(SomethingWentWrongFailure());
    } else if (exception is InternalServerException) {
      return Left<Failure, T>(InternalServerFailure());
    } else if (exception is BadRequestException) {
      return Left<Failure, T>(BadRequestFailure());
    } else if (exception is ConflictException) {
      return Left<Failure, T>(ConflictFailure());
    } else if (exception is FormatException) {
      return Left<Failure, T>(ParseJsonFailure());
    } else {
      return Left<Failure, T>(
        SomethingWentWrongFailure(),
      );
    }
  }
}
