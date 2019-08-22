import 'package:flutter/material.dart';
import 'package:spotify/Bloc/artists.dart';
import 'package:spotify/Bloc/provider.dart';

class ArtistCardWidget extends StatelessWidget {
  const ArtistCardWidget({Key key, this.artist}) : super(key: key);

  final Artist artist;

  @override
  Widget build(BuildContext context) {
    final PodcastsBloc bloc = BoelensBlocProvider.of<PodcastsBloc>(context);
    final double height = MediaQuery.of(context).size.height;

    double computeHeight(double padding) {
      return height * padding / 683;
    }

    Widget buildCheck() {
      return ClipOval(
        child: Container(
          width: computeHeight(25),
          height: computeHeight(25),
          color: Colors.white,
          child: Icon(
            Icons.check,
            size: computeHeight(20),
            color: Colors.black,
          ),
        ),
      );
    }

    return Card(
      color: Colors.transparent,
      elevation: 0,
      child: Stack(
        children: <Widget>[
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: computeHeight(95),
                    height: computeHeight(95),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(artist.filename),
                      ),
                    ),
                  ),
                  onTap: () => bloc.toggleArtist(artist.index),
                ),
              ),
              Center(child: Text(artist.name)),
            ],
          ),
          Positioned(
            top: 1.0,
            right: 1.0,
            child: artist.selected ? buildCheck() : Container(),
          ),
        ],
      ),
    );
  }
}
