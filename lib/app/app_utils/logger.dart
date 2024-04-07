import 'package:logger/logger.dart';

Logger appLogger = Logger(
    printer: PrefixPrinter(
      PrettyPrinter(methodCount: 1,
          // Number of method calls to be displayed
          errorMethodCount: 10,
          // Number of method calls if stacktrace is provided
          lineLength: 1000,
      ),
    ),);
