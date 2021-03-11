import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_new_starter_pack/config/app_config.dart';
import 'package:flutter_new_starter_pack/global_bloc_observer.dart';
import 'package:flutter_new_starter_pack/main.dart';
import 'package:flutter_new_starter_pack/utils/notification_handler.dart';

void main() {
  Constants.setEnvironment(Environment.STAG);
  Bloc.observer = GlobalBlocObserver();

  initialNotification();
  runApp(MyApp());
}
