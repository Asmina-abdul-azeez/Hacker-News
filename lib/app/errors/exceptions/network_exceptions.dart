

import 'package:hacker_news/app/errors/error_codes.dart';
import 'package:hacker_news/app/errors/exceptions/app_exceptions.dart';
import 'package:hacker_news/app/models/rest_error_model.dart';

///get data exception
class FetchDataException extends AppException {
  ///constructor
  FetchDataException(String? message, {String? super.details})
      : super(
          code: ErrorCode.ERR_NETWORK_ERROR,
          message: message ?? 'Error During Communication',
        );

  factory FetchDataException.networkException() {
    return FetchDataException(
        'No Internet connection please check your network',);
  }
}

///bad request exception
class BadRequestException extends AppException {
  ///constructor
  BadRequestException(String? details, {RestError? restApiError})
      : super(
          code: restApiError?.status ?? 'Invalid Request',
          message: restApiError?.title ?? details ?? '',
          details: restApiError?.detail ?? details,
        );
}

///bad request exception
class NotFoundException extends AppException {
  NotFoundException(String? details, {RestError? restApiError})
      : super(
          code: restApiError?.status ?? 'Invalid Request',
          message: restApiError?.title ?? details ?? '',
          details: restApiError?.detail ?? details,
        );
}

///class for unauthorised exception
class UnauthorisedException extends AppException {
  ///constructor
  UnauthorisedException(String? details, {RestError? restApiError})
      : super(
          code: restApiError?.status ?? 'UnAuthorized',
          message: restApiError?.title ?? details ?? '',
          details: restApiError?.detail ?? details,
        );
}

class ConflictException extends AppException {
  ///constructor
  ConflictException(String? details, {RestError? restApiError})
      : super(
          code: restApiError?.status ?? 'Conflict',
          message: restApiError?.title ?? details ?? '',
          details: restApiError?.detail ?? details,
        );
}



///Invalid input exception
class InvalidInputException extends AppException {
  ///constructor
  InvalidInputException(String? details)
      : super(
          code: 'invalid-input',
          message: 'Invalid Input',
          details: details,
        );
}

///Authentication exception
class AuthenticationException extends AppException {
  ///constructor
  AuthenticationException(String? details)
      : super(
          code: 'authentication-failed',
          message: 'Authentication Failed',
          details: details,
        );
}

///Timeout exception
class TimeOutException extends AppException {
  ///constructor
  TimeOutException(String? details)
      : super(
          code: 'request-timeout',
          message: 'Request TimeOut',
          details: details,
        );
}
