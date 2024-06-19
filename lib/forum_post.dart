import 'package:firebase_auth/firebase_auth.dart';
import 'package:ubs_dei_app/forum_item.dart';

//display for a single forum post in the forums page
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ForumPostPage extends StatelessWidget {
  final ForumPost forumPost;
  final List<Comment> comments;

  const ForumPostPage({super.key, 
    required this.forumPost,
    required this.comments,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(FirebaseAuth.instance.currentUser?.uid ?? ''),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildPostSection(),
              const SizedBox(height: 20),
              _buildCommentsSection(),
              const SizedBox(height: 20),
              _buildAddCommentSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPostSection() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              forumPost.forumTitle,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              forumPost.forumDetails,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Posted by ${forumPost.posterID} • ${DateFormat('yyyy-MM-dd – kk:mm').format(forumPost.postingDate)}',
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.thumb_up),
                      onPressed: () {
                        // Add upvote functionality here
                        //TODO: update the upvoters list in the forum post in firebase by pushing the userID
                        // if already there, then remove it
                      },
                    ),
                    Text(forumPost.upvoters.length.toString()),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCommentsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Comments',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        ...comments.map((comment) => _buildCommentCard(comment)).toList(),
      ],
    );
  }

  Widget _buildCommentCard(Comment comment) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              comment.content,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Posted by ${comment.posterID} • ${DateFormat('yyyy-MM-dd – kk:mm').format(comment.dateTime)}',
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.thumb_up),
                      onPressed: () {
                        // Add upvote functionality here
                      },
                    ),
                    Text(comment.upvoters.length.toString()),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddCommentSection() {
    final TextEditingController commentController = TextEditingController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Add a Comment',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        TextField(
          controller: commentController,
          maxLines: 3,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Comment',
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            // Add comment functionality here
            String commentContent = commentController.text;
            if (commentContent.isNotEmpty) {
              // Handle comment submission
            }
          },
          child: const Text('Submit'),
        ),
      ],
    );
  }
}
