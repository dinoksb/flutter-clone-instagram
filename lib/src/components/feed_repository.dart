import 'package:flutter_clone_instagram_blog/src/components/firebaseDB.dart';
import 'package:flutter_clone_instagram_blog/src/model/feed.dart';

class FeedRepository {
  final FirebaseDB firebaseDB;
  FeedRepository({required this.firebaseDB});

  Stream<List<Feed>> getFeeds() => firebaseDB.getFeeds();
}