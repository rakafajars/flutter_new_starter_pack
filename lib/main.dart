import 'package:flutter/material.dart';
import 'package:flutter_new_starter_pack/theme/theme_color.dart';
import 'package:flutter_new_starter_pack/ui/pages/counter/counter.dart';
import 'package:flutter_new_starter_pack/ui/pages/movie/view/movie_page.dart';
import 'package:flutter_new_starter_pack/utils/alice_service.dart';
import 'package:relative_scale/relative_scale.dart';

import 'theme/theme_text.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: alice.getNavigatorKey(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Starter Pack',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MoviePage(),
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
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Starter Pack',
              style: textFontWeight700.copyWith(
                fontSize: sy(12),
                color: primaryColor,
              ),
            ),
          ),
          body: Center(
            child: Container(
              color: primaryColor,
              width: sy(50),
              height: sy(50),
            ),
          ),
        );
      },
    );
  }
}
