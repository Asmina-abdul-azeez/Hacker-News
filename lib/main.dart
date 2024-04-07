import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_news/app/app.dart';
import 'package:hacker_news/app/bloc_observer.dart';
import 'package:hacker_news/app/di/injectable.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await configureInjection();
  runApp(const MyApp());
}
