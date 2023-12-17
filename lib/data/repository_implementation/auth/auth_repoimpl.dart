// import 'package:injectable/injectable.dart';
// import 'package:societymanager/core/logger/app_logger.dart';

// @LazySingleton(as: AuthRepository)
// class AuthRepositoryImplementation implements AuthRepository {
//   AuthRepositoryImplementation(
//     this.appLogger,
//     this.localDataSource,
//     this.ftsAuthenticationRepository,
//     this.authRemoteDataSource,
//   );

//   //final AuthRemoteDataSource remoteDS;
//   final AppLogger appLogger;
//   final AuthRemoteDataSource authRemoteDataSource;
//   final UserLocalDataSource localDataSource;
//   final FtsAuthenticationRepository ftsAuthenticationRepository;

//   @override
//   Future<Either<Failure, AppUserEntity>> signInWithEmailAndPassword({
//     required String email,
//     required String password,
//   }) async {
//     try {
//       final user = await ftsAuthenticationRepository.logInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );

//       return await getUserDataFromBackend(uid: user!.id);

//       // final appUser = userFromFirebase(user);
//       // print(Right<Failure, AppUserEntity>(appUser));
//       // return Right<Failure, AppUserEntity>(appUser);
//     } on FirebaseAuthLogInInvalidEmailException {
//       return Left<Failure, AppUserEntity>(
//         FirebaseAuthLogInInvalidEmailFailure(),
//       );
//     } on FirebaseAuthLogInUserDisabledException {
//       return Left<Failure, AppUserEntity>(
//         FirebaseAuthLogInUserDisabledFailure(),
//       );
//     } on FirebaseAuthLogInUserNotFoundException {
//       return Left<Failure, AppUserEntity>(
//         FirebaseAuthLogInUserNotFoundFailure(),
//       );
//     } on FirebaseAuthLogInWrongPasswordException {
//       return Left<Failure, AppUserEntity>(
//         FirebaseAuthLogInWrongPasswordFailure(),
//       );
//     } on FirebaseAuthLogInUnknownException {
//       return Left<Failure, AppUserEntity>(
//         FirebaseAuthLogInUnknownFailure(),
//       );
//     } on FirebaseAuthLogInTooManyRequestsException {
//       return Left<Failure, AppUserEntity>(
//         FirebaseAuthLogInTooManyRequestsFailure(),
//       );
//     } on FirebaseAuthLogInInvalidCredentialsException {
//       return Left<Failure, AppUserEntity>(
//         FirebaseAuthLogInInvalidCredentialsFailure(),
//       );
//     } on FirebaseAuthNetworkRequestFailedException {
//       return Left<Failure, AppUserEntity>(
//         FirebaseAuthNetworkRequestFailedFailure(),
//       );
//     }
//   }
// }
