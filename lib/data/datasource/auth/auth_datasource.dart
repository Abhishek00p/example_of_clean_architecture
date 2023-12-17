// import 'dart:convert';
// import 'dart:io';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:injectable/injectable.dart';
// import 'package:societymanager/core/error/api_exceptionHandler/api_exception_handler.dart';
// import 'package:societymanager/core/error/exception.dart';
// import 'package:societymanager/core/logger/app_logger.dart';
// import 'package:societymanager/data/models/user_model.dart';

// abstract class AuthRemoteDS {
//   Future<UserCredential> signInWithUsernameAndPassword(
//     String email,
//     String password,
//   );

//   Future<void> signOut();

//   Future<void> forgotPassword(
//     String email,
//   );

//   Future<AppAppUserModel?> loginToken(
//     String email,
//     String deviceToken,
//   );

//   Future<void> logoutPost();
// }

// @LazySingleton(as: AuthRemoteDS)
// class AuthRemoteDSImpl implements AuthRemoteDS {
//   final FirebaseAuth _firebaseAuth;
//   final http.Client client;
//   final AppLogger _appLogger;
//   final ApiExceptionHandler apiExceptionHandler;

//   AuthRemoteDSImpl(
//     this._firebaseAuth,
//     this._appLogger,
//     this.client,
//     this.apiExceptionHandler,
//   );

//   @override
//   Future<UserCredential> signInWithUsernameAndPassword(
//     String email,
//     String password,
//   ) async {
//     try {
//       _appLogger.d("Before Siging user , the Credential are : Email =$email");
//       final userCred = await _firebaseAuth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       _appLogger.i('AuthRemoteDS signin with $email success');
//       return userCred;
//     } on SocketException {
//       throw NoInternetConnectionException();
//     } on FirebaseAuthException catch (e) {
//       _appLogger.e('AuthRemoteDS signin with $email failed', error: e);
//       throw firebaseAuthExceptionFromCode(e.code);
//     }
//   }

//   @override
//   Future<void> signOut() async {
//     try {
//       await _firebaseAuth.signOut();
//     } catch (e) {
//       throw SignOutException();
//     }
//   }

//   @override
//   Future<void> forgotPassword(String email) async {
//     try {
//       await _firebaseAuth.sendPasswordResetEmail(email: email);
//       _appLogger.i('AuthRemoteDS signin with $email success');
//       return;
//     } on FirebaseAuthException catch (e) {
//       _appLogger.e('AuthRemoteDS signin with $email failed', error: e);
//       switch (e.code) {
//         case 'user-not-found':
//           throw AuthUserNotFoundException();
//         case 'invalid-email':
//           throw AuthInvalidEmailException();
//         default:
//           throw SomethingWentWrongException();
//       }
//     }
//   }

//   @override
//   Future<AppUserModel?> loginToken(
//     String email,
//     String deviceToken,
//   ) async {
//     try {
//       final Map<String, dynamic> requestBody = {
//         "email": email,
//         "firebaseToken": deviceToken
//       };
//       debugPrint(
//           "$deviceToken<-------------------device token\n requestbody : $requestBody");
//       final x = await client.post(
//         Uri.parse(ApiStrings.baseUrl + ApiStrings.postTokens),
//         body: jsonEncode(requestBody),
//         headers: {"Content-Type": "application/json"},
//       );
//       debugPrint("response while getting Token : ${x.body}");

//       if (x.statusCode == 200) {
//         final dynamic jsonValue = json.decode(x.body);
//         final AppUserModel user = AppUserModel.fromJson(jsonValue);
//         debugPrint(
//             "After loggined with firebase and while login with backend : the outlet is :${user.outlet}");
//         return user;
//       } else {
//         apiExceptionHandler.throwHttpExceptionBasedOnStatusCode(x.statusCode);
//       }
//     } on SocketException {
//       throw NoInternetConnectionException();
//     } on FormatException {
//       throw ParseJsonException();
//     }

//     return null;
//   }

//   @override
//   Future<void> logoutPost() async {
//     final http.Response response = await client.post(
//       Uri.parse(ApiStrings.postTokens),
//       // body: jsonEncode(requestBody),
//       headers: {"Content-Type": "application/json"},
//     );
//     return;
//   }
// }
