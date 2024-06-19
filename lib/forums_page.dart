// make an empty page with the title forum


import 'package:flutter/material.dart';
import 'package:ubs_dei_app/add_forum_post.dart';
import 'package:ubs_dei_app/forum_post.dart';
import 'package:ubs_dei_app/forum_item.dart';

class ForumsPage extends StatefulWidget {
  const ForumsPage({super.key});

  @override
  ForumsPageState createState() => ForumsPageState();
}

class ForumsPageState extends State<ForumsPage> {
  final ForumPost forumPost = ForumPost(
    forumID: '12344rerf',
    forumTitle: 'Forum Title',
    forumDetails: 'Forum Details',
    postingDate: DateTime.now(),
    posterID: 'Nidhi Shah',
    upvoters: [],
    comments: [],
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Discussion Forums'),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<CreateForumPost>(
                    builder: (context) => const CreateForumPost(),
                  )
                );
              },
            )
          ],
      ),
      body: ForumPostPage(
          forumPost: forumPost,
          comments: const [],
        ),
    );
  }
}