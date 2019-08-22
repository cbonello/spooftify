import 'package:flutter/material.dart';
import 'package:spotify/Bloc/podcasts.dart';
import 'package:spotify/Bloc/provider.dart';
import 'package:spotify/widgets/podcast_card.dart';

class PodcastsPage extends StatefulWidget {
  @override
  _PodcastsPageState createState() => _PodcastsPageState();
}

class _PodcastsPageState extends State<PodcastsPage> {
  PodcastsBloc bloc;

  @override
  void initState() {
    bloc = PodcastsBloc();
    super.initState();
  }

  @override
  void didUpdateWidget(PodcastsPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    bloc?.dispose();
    bloc = PodcastsBloc();
  }

  @override
  void dispose() {
    bloc?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BoelensBlocProvider<PodcastsBloc>(
      bloc: bloc,
      child: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.centerRight,
                  stops: <double>[0.0, 1.0],
                  colors: <Color>[
                    Color(0XFFD53294),
                    Colors.black,
                  ],
                ),
              ),
            ),
            Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                title: Center(
                  child: Text(
                    'Choose 2 or more podcasts category you like.',
                    style: Theme.of(context).textTheme.caption,
                  ),
                ),
                bottom: PreferredSize(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 15, bottom: 10),
                    child: Opacity(
                      opacity: 0.2,
                      child: TextField(
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: Icon(Icons.search, color: Colors.black),
                        ),
                        obscureText: true,
                      ),
                    ),
                  ),
                  preferredSize: const Size(0.0, 40.0),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: StreamBuilder<List<Podcast>>(
                  stream: bloc.outPodcastsList,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Podcast>> snapshot) {
                    if (!snapshot.hasData) {
                      return Container();
                    }
                    return GridView.count(
                      shrinkWrap: true,
                      primary: true,
                      padding: const EdgeInsets.all(1.0),
                      crossAxisCount: 3,
                      childAspectRatio: 1.0,
                      mainAxisSpacing: 2.0,
                      crossAxisSpacing: 2.0,
                      children: snapshot.data
                          .map(
                            (Podcast podcast) =>
                                PodcastCardWidget(podcast: podcast),
                          )
                          .toList(),
                    );
                  },
                ),
              ),
              floatingActionButton: StreamBuilder<int>(
                stream: bloc.outPodcastsCount,
                builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                  if (!snapshot.hasData || snapshot.data < 2) {
                    return Container();
                  }
                  return SizedBox(
                    width: 150,
                    height: 40,
                    child: FloatingActionButton(
                      backgroundColor: Colors.white,
                      elevation: 4.0,
                      child: Text(
                        'Done',
                        style: Theme.of(context)
                            .textTheme
                            .caption
                            .copyWith(color: Colors.black),
                      ),
                      shape: const StadiumBorder(),
                      onPressed: () => Navigator.pushReplacementNamed(
                            context,
                            '/player',
                          ),
                    ),
                  );
                },
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
            ),
          ],
        ),
      ),
    );
  }
}
