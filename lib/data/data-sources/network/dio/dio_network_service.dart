// ignore_for_file: comment_references,
// ignore_for_file: inference_failure_on_function_invocation, strict_raw_type

import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hacker_news/app/app_utils/logger.dart';
import 'package:hacker_news/app/di/injectable.dart';
import 'package:hacker_news/app/errors/exceptions/app_exceptions.dart';
import 'package:hacker_news/app/errors/exceptions/network_exceptions.dart';
import 'package:hacker_news/app/models/rest_error_model.dart';
import 'package:hacker_news/data/data-sources/network'
    '/api_request_representable.dart';
import 'package:hacker_news/data/data-sources/network'
    '/api_response.dart';
import 'package:hacker_news/data/data-sources/network'
    '/network_service.dart';
import 'package:injectable/injectable.dart';

/// The [DioNetWorkService] class...
@Injectable(as: NetworkService)
class DioNetWorkService extends NetworkService {
  /// The [DioNetWorkService] constructor...

  bool socketErrorOccurred = false;

  void initializeDio(String baseUrl) {
    client = getIt.get<Dio>();

    if (kDebugMode) {
      client.interceptors.add(
        LogInterceptor(
          responseBody: true,
          requestBody: true,
          logPrint: (v) {
            appLogger.d(v.toString());
          },
        ),
      );
    }
    client.options.baseUrl = baseUrl;
  }

  late Dio client;

  /// Sends an HTTP request and returns the response.
  ///
  /// If the request fails due to a timeout,
  /// a [TimeOutException] is thrown.
  /// If the request fails due to a socket exception,
  /// a [FetchDataException] with
  /// the message 'No Internet connection' is thrown.
  /// If the request fails due to a Dio error,
  /// the error is logged using [appLog],
  /// and the response is handled using the
  /// [handleDioExceptions] function.
  /// If the request fails due to any other
  /// error, a [FetchDataException] with an
  /// empty message is thrown.
  /// Sends an API request using Dio and returns the response.
  ///
  /// Takes an `APIRequestRepresentable` object as input.
  ///
  /// Throws exceptions on network errors or if the response contains an error.
  @override
  Future<APIResponse> request(APIRequestRepresentable requestReceived) async {
    try {
      var request = requestReceived;
      final token = <String, String>{};
      // final token = await authService.getAccessHeader();
      request = request.copyWith(
        headers: {...?requestReceived.headers, ...token, ...{}},
      );

      if (socketErrorOccurred) {
        ///if a socket error occurred earlier then reset the dio
        initializeDio('');
        socketErrorOccurred = false;
      }
      appLogger..d('REQUEST DETAILS')
        ..d('REQUEST DETAILS')
        ..d(requestReceived.toString())
        ..d(client.options.queryParameters)
        ..d(client.options.baseUrl)
        ..d(client.options.baseUrl);

      // Send the request using Dio
      final startTime = DateTime.now();
      final response = await client.request(
        request.url,
        options: Options(
          method: request.method.string,
          headers: request.headers,
        ),
        data: request.body,
        queryParameters: request.query,
      );
      appLogger
        ..d(
          'Time taken to get response${request.url}'
          ' ${DateTime.now().difference(startTime).inMilliseconds} ms',
        )
        ..d(response.data.toString())
        ..d(response.realUri.path);
      // Return the response
      return mapToAPIResponse(response);
    } on TimeoutException catch (_) {
      // Catch timeout exceptions
      //and throw a custom TimeOutException
      throw FetchDataException.networkException();
    } on SocketException {
      // Catch SocketException (no internet connection)
      // and throw a custom FetchDataException
      throw FetchDataException.networkException();
    } on DioException catch (e) {
      // Log error details for debugging purposes
      appLogger.e(e.requestOptions);
      if (e.error is SocketException) {
        throw FetchDataException.networkException();
      }
      // Return the response or throw an error
      handleDioExceptions(mapToAPIResponse(e.response));
    } catch (_) {
      // Catch any other exception and throw a custom FetchDataException
      throw FetchDataException.networkException();
    }
    throw FetchDataException('');
  }

  APIResponse<Object> mapToAPIResponse(Response? response) {
    return APIResponse(
      requestOptions: response?.requestOptions ?? RequestOptions(),
      data: response?.data,
      headers: response?.headers,
      statusCode: response?.statusCode,
      statusMessage: response?.statusMessage,
    );
  }

  AppException handleDioExceptions(APIResponse<dynamic>? response) {
    if (response == null) {
      socketErrorOccurred = true;
      throw FetchDataException.networkException();
    }
    RestError? restApiError;
    try {
      restApiError =
          RestErrorDetails.errorFromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      restApiError =
          RestErrorDetails.serverUnknownError(response.statusCode ?? 0);
    }

    switch (response.statusCode) {
      case 400:
        throw BadRequestException(
          response.data.toString(),
          restApiError: restApiError,
        );
      case 401:
      case 403:
        throw UnauthorisedException(
          response.data.toString(),
          restApiError: restApiError,
        );
      case 404:
        throw NotFoundException('Server error please try again later');
      case 409:
        throw ConflictException(
          response.data.toString(),
          restApiError: restApiError,
        );
      case 500:
        throw FetchDataException('Internal Server Error');
      default:
        throw FetchDataException(
          'Error occurred while Communication with Server with StatusCode '
          ': ${response.statusCode}',
        );
    }
  }

  @override
  Future<APIResponse> get(
    APIRequestRepresentable apiRequestRepresentable,
  ) async {
    return request(
      apiRequestRepresentable.copyWith(method: HTTPMethod.get),
    );
  }

  @override
  Future<APIResponse> patch(APIRequestRepresentable apiRequestRepresentable) {
    return request(apiRequestRepresentable.copyWith(method: HTTPMethod.patch));
  }

  @override
  Future<APIResponse> post(APIRequestRepresentable apiRequestRepresentable) {
    return request(apiRequestRepresentable.copyWith(method: HTTPMethod.post));
  }

  @override
  Future<APIResponse> delete(APIRequestRepresentable apiRequestRepresentable) {
    return request(apiRequestRepresentable.copyWith(method: HTTPMethod.delete));
  }
}
