// this page allows users to create a forum post
// the event is stored in the firebase database

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
// import 'package:ubs_dei_app/user_provider.dart';

class CreateForumPost extends StatefulWidget {
  const CreateForumPost({super.key});

  @override
  CreateForumPostState createState() => CreateForumPostState();
}

class CreateForumPostState extends State<CreateForumPost> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _detailsController = TextEditingController();
  DateTime _selectedDateTime = DateTime.now();
  final _currentUserID = FirebaseAuth.instance.currentUser?.uid;

  @override
  void dispose() {
    _titleController.dispose();
    _detailsController.dispose();
    super.dispose();
  }

  void _saveEvent() async {
    if (_formKey.currentState!.validate()) {
      FirebaseFirestore.instance.collection('forumPost').add({
        'forumTitle': _titleController.text,
        'forumDetails': _detailsController.text,
        'postingDate': _selectedDateTime,
        'posterID': _currentUserID,
        'upvoters': [],
        'comments': [],
      });
      // You can add additional logic here, such as navigating to a different page
      // go back to upcoming events page
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Forum Title',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an discussion title';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _detailsController,
                decoration: const InputDecoration(
                  labelText: 'Post Details',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter details';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  final pickedDateTime = await showDateTimePicker(
                    context: context,
                    initialDateTime: _selectedDateTime,
                  );
                  if (pickedDateTime != null) {
                    setState(() {
                      _selectedDateTime = pickedDateTime;
                    });
                  }
                },
                child: Text(
                  'Select Event Date/Time: ${DateFormat('yyyy-MM-dd HH:mm').format(_selectedDateTime)}',
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _saveEvent,
                child: const Text('Post Discussion'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<DateTime?> showDateTimePicker({
    required BuildContext context,
    required DateTime initialDateTime,
  }) {
    return showDateTimePicker(
      context: context,
      initialDateTime: initialDateTime,
    );
  }
}