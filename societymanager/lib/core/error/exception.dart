
import 'package:societymanager/core/constants/error_constants.dart';

/// [NotFoundException] is thrown when API Endpoint
/// returns a 500 Internal Server Error Status Code
class InternalServerException implements Exception {}

/// [NotFoundException] is thrown when API Endpoint
/// returns a 404 Not Found Status Code
class NotFoundException implements Exception {}

/// [ServerUnavailableException] is thrown when API Endpoint
/// returns a 503 Server Unavailable Status Code
class ServerUnavailableException implements Exception {}

/// [ConflictException] is thrown when API Endpoint
/// returns a 409 Conflict Status Code
class ConflictException implements Exception {}

/// [CacheException] is thrown when there's
/// no Cache Found in the device
class CacheException implements Exception {}

/// [NoInternetConnectionException] is thrown when there's
/// no active internet connection
class NoInternetConnectionException implements Exception {}

/// [SomethingWentWrongException] is thrown when there's
/// no active internet connection
class SomethingWentWrongException implements Exception {}

/// [BadRequestException] is thrown when there's
/// no active internet connection
class BadRequestException implements Exception {}

/// [AuthUserNotFoundException] is thrown when there's
/// no user found in the firebase user directory
class AuthUserNotFoundException implements Exception {}

// Inavlid Email in the Firebase
class AuthInvalidEmailException implements Exception {}

// Wrong Password in the Firebase
class AuthWrongPasswordException implements Exception {}

// user Disabled in the Firebase
class AuthUserDisabledException implements Exception {}

///    verification code of the credential is not valid in Phone .
class AuthInvalidVerificationCodeException implements Exception {}

///    verification ID of the credential is not valid.id.
class AuthInvalidVerificationIdException implements Exception {}

class AuthOperationNotAllowedException implements Exception {}

class AuthInvalidCredentialException implements Exception {}

class AuthAccountExistWithDifferentCredentialException implements Exception {}

class AuthEmailAlreadyInUseException implements Exception {}

class AuthWeakPasswordException implements Exception {}

class ParseJsonException implements Exception {}

Exception firebaseAuthExceptionFromCode(String code) {
  switch (code) {
    case ErrorConstants.accountExistsWithDifferentCredential:
      throw AuthAccountExistWithDifferentCredentialException();
    case ErrorConstants.invalidCredential:
      throw AuthInvalidCredentialException();
    case ErrorConstants.invalidEmail:
      throw AuthInvalidEmailException();
    case ErrorConstants.invalidVerificationCode:
      throw AuthInvalidVerificationCodeException();
    case ErrorConstants.invalidVerificationID:
      throw AuthInvalidVerificationIdException();
    case ErrorConstants.operationNotAllowed:
      throw AuthOperationNotAllowedException();

    case ErrorConstants.userDisabled:
      throw AuthUserDisabledException();
    case ErrorConstants.userNotFound:
      throw AuthUserNotFoundException();
    case ErrorConstants.wrongPassword:
      throw AuthWrongPasswordException();
    case ErrorConstants.emailAlreadyInUse:
      throw AuthEmailAlreadyInUseException();
    case ErrorConstants.weakPassword:
      throw AuthWeakPasswordException();

    default:
      throw Exception('Firebase Error : $code');
  }
}
