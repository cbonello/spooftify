import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:spotify/Bloc/provider.dart';

class Podcast {
  Podcast(
      {@required this.index, @required this.name, @required this.filename}) {
    selected = false;
  }

  int index;
  String name, filename;
  bool selected;
}

class PodcastsBloc implements BlocBase {
  PodcastsBloc() {
    _podcasts = <Podcast>[
      Podcast(
        index: 0,
        name: 'Entertainement',
        filename: 'assets/images/podcasts/arts_entertainement.png',
      ),
      Podcast(
        index: 1,
        name: 'Comedy',
        filename: 'assets/images/podcasts/comedy.png',
      ),
      Podcast(
        index: 2,
        name: 'Educational',
        filename: 'assets/images/podcasts/educational.png',
      ),
      Podcast(
        index: 3,
        name: 'Lifestyle & Health',
        filename: 'assets/images/podcasts/lifestyle_health.png',
      ),
      Podcast(
        index: 4,
        name: 'Music',
        filename: 'assets/images/podcasts/music.png',
      ),
      Podcast(
        index: 5,
        name: 'News & Politics',
        filename: 'assets/images/podcasts/news_politics.png',
      ),
      Podcast(
        index: 6,
        name: 'Sports & Recreation',
        filename: 'assets/images/podcasts/sports_recreation.png',
      ),
      Podcast(
        index: 7,
        name: 'Top Podcasts',
        filename: 'assets/images/podcasts/top_podcasts.png',
      ),
    ];

    _inPodcastsList.add(_podcasts);
    _inPodcastsCount.add(0);
  }

  List<Podcast> _podcasts;

  final BehaviorSubject<List<Podcast>> _podcastsController =
      BehaviorSubject<List<Podcast>>.seeded(<Podcast>[]);
  Sink<List<Podcast>> get _inPodcastsList => _podcastsController.sink;
  Stream<List<Podcast>> get outPodcastsList => _podcastsController.stream;

  final BehaviorSubject<int> _podcastsCountController =
      BehaviorSubject<int>.seeded(0);
  Sink<int> get _inPodcastsCount => _podcastsCountController.sink;
  Stream<int> get outPodcastsCount => _podcastsCountController.stream;

  void togglePodcast(int podcastIndex) {
    assert(podcastIndex >= 0 && podcastIndex < _podcasts.length);
    _podcasts[podcastIndex].selected = !_podcasts[podcastIndex].selected;
    _inPodcastsList.add(_podcasts);
    _inPodcastsCount.add(
        _podcasts.where((Podcast podcast) => podcast.selected).toList().length);
  }

  @override
  void dispose() {
    _podcastsController.close();
    _podcastsCountController.close();
  }
}
