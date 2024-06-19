// import 'package:cloud_firestore/cloud_firestore.dart';

class Comment {
  final String commentID;
  final String content;
  final String forumID;
  final String posterID;
  final DateTime dateTime;
  // list of commentIDs (String)
  final List<dynamic> replyCommentIDs;
  // list of upvoters
  final List<dynamic> upvoters;

  Comment({
    required this.commentID,
    required this.content,
    required this.forumID,
    required this.posterID,
    required this.dateTime,
    required this.replyCommentIDs,
    required this.upvoters,
  });

  factory Comment.fromMap(Map<dynamic, dynamic> map) {
    return Comment(
      commentID: map['commentID'],
      content: map['content'],
      forumID: map['forumID'],
      posterID: map['posterID'],
      dateTime: map['dateTime'],
      replyCommentIDs: map['replyCommentIDs'],
      upvoters: map['upvoters'],
    );
  }

  Map<String, dynamic> toJson() {
      return {
          'commentID': commentID,
          'content': content,
          'forumID': forumID,
          'posterID': posterID,
          'dateTime': dateTime,
          'replyCommentIDs': replyCommentIDs,
          'upvoters': upvoters,
      };
  }
}


class ForumPost {
  final String forumID;
  final String forumTitle;
  final String forumDetails;
  final DateTime postingDate;
  final String posterID;
  final List<dynamic> upvoters;
  final List<dynamic> comments;

  ForumPost({
    required this.forumID,
    required this.forumTitle,
    required this.forumDetails,
    required this.postingDate,
    required this.posterID,
    required this.upvoters,
    required this.comments,
  });
  
  factory ForumPost.fromMap(Map<dynamic, dynamic> map) {
    return ForumPost(
      forumID: map['forumID'],
      forumTitle: map['forumTitle'],
      forumDetails: map['forumDetails'],
      postingDate: map['postingDate'],
      posterID: map['posterID'],
      upvoters: map['upvoters'],
      comments: map['comments'],
    );
  }

  Map<String, dynamic> toJson() {
      return {
          'forumID': forumID,
          'forumTitle': forumTitle,
          'forumDetails': forumDetails,
          'postingDate': postingDate,
          'posterID': posterID,
          'upvoters': upvoters,
          'comments': comments,
      };
  }

}



