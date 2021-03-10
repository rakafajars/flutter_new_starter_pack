import 'package:flutter/material.dart';
import 'package:flutter_new_starter_pack/theme/theme_color.dart';

import 'theme/theme_text.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Starter Pack',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

// Bisa diganti dengan page apapun
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Starter Pack',
          style: textFontWeight700.copyWith(
            fontSize: 12,
            color: primaryColor,
          ),
        ),
      ),
      body: Container(),
    );
  }
}
