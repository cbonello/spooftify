import 'package:flutter/material.dart';
import 'package:spotify/widgets/progress_indicator.dart';

enum PlaylistStatus {
  processing,
  created,
}

class PlayerPage extends StatefulWidget {
  @override
  _PlayerPageState createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  PlaylistStatus status;

  @override
  void initState() {
    status = PlaylistStatus.processing;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget insert() {
      Future<void>.delayed(const Duration(seconds: 4), () {
        setState(() {
          status = PlaylistStatus.created;
        });
      });

      return progressIndicatorWidget(
        context,
        text: 'Creating playlists...',
      );
    }

    return SafeArea(
      child: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(status == PlaylistStatus.processing
                    ? 'assets/images/player1.png'
                    : 'assets/images/player2.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: status == PlaylistStatus.processing
                ? insert()
                : InkWell(
                    child: Container(),
                    onTap: () => Navigator.pushReplacementNamed(
                          context,
                          '/launcher',
                        ),
                  ),
          ),
        ],
      ),
    );
  }
}
