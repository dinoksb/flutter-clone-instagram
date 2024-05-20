import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_clone_instagram_blog/src/model/feed.dart';

class FirebaseDB {
  final FirebaseFirestore firebaseFirestore;
  FirebaseDB({
    required this.firebaseFirestore,
  });

  Stream<List<Feed>> getFeeds() {
    try {
      return firebaseFirestore
          .collection('feeds')
          .snapshots()
          .map((querySnapshot) {
        List<Feed> feeds = [];
        for (var feed in querySnapshot.docs) {
          final feedModel = Feed.fromDocumentSnapshot(feed);
          print("feedModel.countLike: ${feedModel.countLike}");
          feeds.add(feedModel);
        }
        return feeds;
      });
    } catch (e) {
      throw Exception();
    }
  }
}