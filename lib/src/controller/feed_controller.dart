import 'package:get/get.dart';
import '../components/feed_repository.dart';
import '../model/feed.dart';

class FeedController extends GetxController {
  final Rx<List<Feed>> _feeds = Rx<List<Feed>>([]);
  final FeedRepository feedRepository;
  FeedController({required this.feedRepository});

  List<Feed> get feeds => _feeds.value;

  @override
  void onReady() {
    super.onReady();
    _feeds.bindStream(_fetchData());
  }

  Stream<List<Feed>> _fetchData() => feedRepository.getFeeds();
}