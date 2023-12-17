import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:societymanager/core/api/api.dart';
import 'package:societymanager/core/error/error.dart';
import 'package:societymanager/core/logger/app_logger.dart';
import 'package:societymanager/data/models/example/example_model.dart';

abstract class ExampleDatasource {
  Future<List<SomeModel>> getSomeResponse(
      // {
      // required String userJWTtoken,
      // }
      );
}

@LazySingleton(as: ExampleDatasource)
class ExampleDataSourcesImpl implements ExampleDatasource {
  ExampleDataSourcesImpl({
    required this.client,
    required this.api,
    required this.appLogger,
    required this.apiExceptionHandler,
  });

  final API api;
  final http.Client client;
  final AppLogger appLogger;
  final ApiExceptionHandler apiExceptionHandler;

  @override
  Future<List<SomeModel>> getSomeResponse() async {
    try {
      // debugPrint('Function Called  : token $userJWTtoken');
      final response = await client.get(
        api.endpointUri(
          Endpoint.getAllTask,
          queryParameters: {'q': 'upcomingTask'},
        ),
        // headers: {
        //   'Authorization': 'Bearer $userJWTtoken',
        // },
      );
      debugPrint(
        'Response of SomeApi : ${api.host} ${response.statusCode} ${response.body}',
      );

      if (response.statusCode == HttpStatus.ok) {
        final decodedResponse =
            json.decode(response.body) as Map<String, dynamic>;

        final listOfSomeModel = (decodedResponse['data'] as List)
            .map((e) => SomeModel.fromJson(e as Map<String, dynamic>))
            .toList();
        return listOfSomeModel;
      } else if (response.statusCode == HttpStatus.notFound) {
        throw NotFoundException();
      } else {
        throw apiExceptionHandler
            .throwHttpExceptionBasedOnStatusCode(response.statusCode);
      }
    } on SocketException {
      throw NoInternetConnectionException();
    } on FormatException {
      throw ParseJsonException();
    }
    // return null;
  }
}
