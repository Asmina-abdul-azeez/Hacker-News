import 'package:hacker_news/app/errors/exceptions/app_exceptions.dart';

///AppPermission exception
class AppPermissionException extends AppException {
  ///constructor
  AppPermissionException(String? details, String message)
      : super(
          code: 'permission-denied',
          message: message,
          details: details,
        );
}
