import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_new_starter_pack/config/app_config.dart';
import 'package:flutter_new_starter_pack/global_bloc_observer.dart';
import 'package:flutter_new_starter_pack/main.dart';

import 'utils/notification_handler.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = GlobalBlocObserver();

  initialNotification();
  Constants.setEnvironment(Environment.DEV);
  runApp(MyApp());
}
