import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:spotify/Bloc/provider.dart';

class Artist {
  Artist({@required this.index, @required this.name, @required this.filename}) {
    selected = false;
  }

  int index;
  String name, filename;
  bool selected;
}

class PodcastsBloc implements BlocBase {
  PodcastsBloc() {
    _artists = <Artist>[
      Artist(
        index: 0,
        name: 'Ariana Grande',
        filename: 'assets/images/artists/Ariana_Grande.jpg',
      ),
      Artist(
        index: 1,
        name: 'Billie Eilish',
        filename: 'assets/images/artists/Billie_Eilish.jpg',
      ),
      Artist(
        index: 2,
        name: 'Cardi B',
        filename: 'assets/images/artists/Cardi_B.jpg',
      ),
      Artist(
        index: 3,
        name: 'Charli XCX',
        filename: 'assets/images/artists/Charli_XCX.jpg',
      ),
      Artist(
        index: 4,
        name: 'CHVRCHES',
        filename: 'assets/images/artists/CHVRCHES.jpg',
      ),
      Artist(
        index: 5,
        name: 'Drake',
        filename: 'assets/images/artists/Drake.jpg',
      ),
      Artist(
        index: 6,
        name: 'Halsey',
        filename: 'assets/images/artists/Halsey.jpg',
      ),
      Artist(
        index: 7,
        name: 'Hayden James',
        filename: 'assets/images/artists/Hayden_James.jpg',
      ),
      Artist(
        index: 8,
        name: 'Kanye West',
        filename: 'assets/images/artists/Kanye_West.jpg',
      ),
      Artist(
        index: 9,
        name: 'Lana Del Rey',
        filename: 'assets/images/artists/Lana_Del_Rey.jpg',
      ),
      Artist(
        index: 10,
        name: 'London Grammar',
        filename: 'assets/images/artists/London_Grammar.jpg',
      ),
      Artist(
        index: 11,
        name: 'Lorde',
        filename: 'assets/images/artists/Lorde.jpg',
      ),
      Artist(
        index: 12,
        name: 'Madeon',
        filename: 'assets/images/artists/Madeon.jpg',
      ),
      Artist(
        index: 13,
        name: 'Marina',
        filename: 'assets/images/artists/Marina.jpg',
      ),
      Artist(
        index: 14,
        name: 'Nicki Minaj',
        filename: 'assets/images/artists/Nicki_Minaj.jpg',
      ),
      Artist(
        index: 15,
        name: 'Petit Biscuit',
        filename: 'assets/images/artists/Petit_Biscuit.jpg',
      ),
      Artist(
        index: 16,
        name: 'Sigrid',
        filename: 'assets/images/artists/Sigrid.jpg',
      ),
      Artist(
        index: 17,
        name: 'Sky Ferreira',
        filename: 'assets/images/artists/Sky_Ferreira.jpg',
      ),
      Artist(
        index: 18,
        name: 'Superpoze',
        filename: 'assets/images/artists/Superpoze.jpg',
      ),
      Artist(
        index: 19,
        name: 'Travis Scott',
        filename: 'assets/images/artists/Travis_Scott.jpg',
      ),
    ];

    _inArtistsList.add(_artists);
    _inArtistsCount.add(0);
  }

  List<Artist> _artists;

  final BehaviorSubject<List<Artist>> _artistsController =
      BehaviorSubject<List<Artist>>.seeded(<Artist>[]);
  Sink<List<Artist>> get _inArtistsList => _artistsController.sink;
  Stream<List<Artist>> get outArtistsList => _artistsController.stream;

  final BehaviorSubject<int> _artistsCountController =
      BehaviorSubject<int>.seeded(0);
  Sink<int> get _inArtistsCount => _artistsCountController.sink;
  Stream<int> get outArtistsCount => _artistsCountController.stream;

  void toggleArtist(int artistIndex) {
    assert(artistIndex >= 0 && artistIndex < _artists.length);
    _artists[artistIndex].selected = !_artists[artistIndex].selected;
    _inArtistsList.add(_artists);
    _inArtistsCount.add(
        _artists.where((Artist artist) => artist.selected).toList().length);
  }

  @override
  void dispose() {
    _artistsController.close();
    _artistsCountController.close();
  }
}
