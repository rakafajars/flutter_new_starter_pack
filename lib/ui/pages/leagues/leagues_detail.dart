import 'package:flutter/material.dart';
import 'package:flutter_new_starter_pack/ui/widget/custome_page.dart';
import 'package:relative_scale/relative_scale.dart';

class LeaguesDetailPage extends StatefulWidget {
  @override
  _LeaguesDetailPageState createState() => _LeaguesDetailPageState();
}

class _LeaguesDetailPageState extends State<LeaguesDetailPage> {
  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return CustomePage(
          scaffold: Scaffold(
            appBar: AppBar(
              title: Text('Detail Leagues'),
            ),
            body: Container(),
          ),
        );
      },
    );
  }
}
