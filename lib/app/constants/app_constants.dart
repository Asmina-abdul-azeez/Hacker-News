import 'package:hacker_news/app/constants/end_points.dart';
import 'package:hacker_news/app/constants/preference.dart';

class AppConstants {
  const AppConstants();

  static const Preferences preferences = Preferences();
  static const EndPoints endPoints = EndPoints();
}

const AppConstants appConstants = AppConstants();
