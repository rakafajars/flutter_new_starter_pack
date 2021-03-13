import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_new_starter_pack/bloc/b_leagues/leagues_bloc.dart';
import 'package:flutter_new_starter_pack/theme/theme_text.dart';
import 'package:flutter_new_starter_pack/ui/widget/custome_page.dart';
import 'package:relative_scale/relative_scale.dart';

class LeaguesDetailView extends StatefulWidget {
  @override
  _LeaguesDetailViewState createState() => _LeaguesDetailViewState();
}

class _LeaguesDetailViewState extends State<LeaguesDetailView> {
  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return CustomePage(
          scaffold: Scaffold(
            appBar: AppBar(
              title: Text('Detail Leagues'),
            ),
            body: BlocBuilder<LeaguesBloc, LeaguesState>(
              builder: (context, state) {
                if (state is LeaguesLoadInProgress) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is LeaguesDetailLoadSuccess) {
                  return Card(
                    elevation: 1.5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      verticalDirection: VerticalDirection.down,
                      children: [
                        CachedNetworkImage(
                          imageUrl: state.modelDetailLeagues.data.logos.dark,
                          height: sy(130),
                          width: sy(100),
                        ),
                      ],
                    ),
                  );
                }
                if (state is LeaguesLoadFailure) {
                  return Center(
                    child: Text(
                      state.message,
                      style: textFontWeight700,
                    ),
                  );
                }
                return Container();
              },
            ),
          ),
        );
      },
    );
  }
}
