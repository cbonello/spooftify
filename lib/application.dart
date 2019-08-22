import 'package:flutter/material.dart';
import 'package:spotify/helpers/theme.dart';
import 'package:spotify/pages/player.dart';
import 'package:spotify/pages/spooftify/podcasts.dart';
import 'package:spotify/pages/spooftify/songs.dart' as spooftify_songs;
import 'package:spotify/pages/spotify/home.dart' as spotify;
import 'package:spotify/pages/spooftify/home.dart' as spooftify;
import 'package:spotify/pages/spotify/songs.dart' as spotify_songs;
import 'package:spotify/widgets/round_button.dart';

class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spotify',
      theme: buildTheme(),
      routes: <String, WidgetBuilder>{
        '/launcher': (BuildContext context) => LauncherPage(),
        '/spotify': (BuildContext context) => spotify.HomePage(),
        '/spotify_songs': (BuildContext context) => spotify_songs.SongsPage(),
        '/spooftify': (BuildContext context) => spooftify.HomePage(),
        '/spooftify_songs': (BuildContext context) =>
            spooftify_songs.SongsPage(),
        '/podcasts': (BuildContext context) => PodcastsPage(),
        '/player': (BuildContext context) => PlayerPage(),
      },
      home: LauncherPage(),
    );
  }
}

class LauncherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: <double>[0.0, 0.25, 0.6, 1.0],
              colors: <Color>[
                Color(0XFF2303a2),
                Color(0xFF4A0CC5),
                Color(0xFFA423F1),
                Color(0xFFFF40B4)
              ],
            ),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 100, bottom: 40),
                child: Center(
                  child: Text(
                    'Spotify Mock App',
                    style: Theme.of(context).textTheme.display1,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: RoundButton(
                  title: 'CONTINUE WITH SPOTIFY',
                  color: const Color(0xFF06C24A),
                  onPressed: () => Navigator.pushReplacementNamed(
                        context,
                        '/spotify',
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: RoundButton(
                  title: 'CONTINUE WITH SPOOFTIFY',
                  color: const Color(0xFF06C24A),
                  onPressed: () => Navigator.pushReplacementNamed(
                        context,
                        '/spooftify',
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
