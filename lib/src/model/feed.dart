import 'package:cloud_firestore/cloud_firestore.dart';

class Feed {
  final String id;
  final String userUrl;
  final String userName;
  final List images;
  final int countLike;
  final int countComment;

  Feed({
    required this.id,
    required this.userUrl,
    required this.userName,
    required this.images,
    required this.countLike,
    required this.countComment,
  });

  factory Feed.fromDocumentSnapshot(DocumentSnapshot doc) {
    return Feed(
        id: doc.id,
        userUrl: doc['userUrl'],
        userName: doc['userName'],
        images: doc['images'],
        countLike: doc['countLike'],
        countComment: doc['countComment']);
  }
}