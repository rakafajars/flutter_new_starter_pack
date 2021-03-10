import 'package:flutter/material.dart';
import 'package:flutter_new_starter_pack/config/app_config.dart';
import 'package:flutter_new_starter_pack/main.dart';

void main() {
  Constants.setEnvironment(Environment.PROD);
  runApp(MyApp());
}
