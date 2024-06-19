import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ubs_dei_app/event_item.dart';

var db = FirebaseFirestore.instance;
//retrieve eventItems from firestore
Future<List<Event>> getEventsFromFirebase() async {
  final List<Event> events = [];
  final QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('event').get();

  for (final doc in snapshot.docs) {
    final data = doc.data() as Map<String, dynamic>;
    final event = Event(
      title: data['title'],
      details: data['Details'],
      date: (data['Date'] as Timestamp).toDate(),
      hostId: data['HostID'],
      participants: data['Participants'],
      tags: data['Tags'],
    );
    events.add(event);
  }

  return events;
}

Future<void> main() async {
  final events = await getEventsFromFirebase();
  // Now you can use the 'events' list in your app
  print(events);
}

final eventItem = <String, dynamic> {
  'title': 'Event Title',
  'Details': 'Event Description',
  'Date': DateTime.parse('2024-06-30 12:00:00'),
  'HostID': 'Host ID',
  'Participants': [],
  'Tags': [],
};

// db.collection("event").add(event).then((DocumentReference doc) =>
//   print('DocumentSnapshot added with ID: ${doc.id}'));

// var events = await getEventsFromFirebase();
class EventPage extends StatelessWidget {
  const EventPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upcoming Events'),
      ),
      body: ListView(
        children: [
          EventCard(
            title: eventItem['title'], 
            dateTime: eventItem['Date'], 
            details: eventItem['Details'],
            onMoreDetails: () {
              Navigator.pushNamed(context, '/eventDetail');
            }
          )
        ],
      )
    );
  }
}

class EventCard extends StatelessWidget {
  final String title;
  final DateTime dateTime;
  final String details;
  final VoidCallback onMoreDetails;

  const EventCard({
    super.key,
    required this.title,
    required this.dateTime,
    required this.details,
    required this.onMoreDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey[400]!,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                details,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    size: 16.0,
                    color: Colors.grey[600],
                  ),
                  const SizedBox(width: 8.0),
                  Text(
                    '${dateTime.day}/${dateTime.month}/${dateTime.year} - ${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: onMoreDetails,
                child: const Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}