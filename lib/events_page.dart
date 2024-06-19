import 'package:flutter/material.dart';
import 'package:ubs_dei_app/upcoming_events.dart';
import 'package:ubs_dei_app/add_event.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});
  // final currentUserID;

  @override
  EventsPageState createState() => EventsPageState();
}

class EventsPageState extends State<EventsPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Events'),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<CreateEventPage>(
                    builder: (context) => const CreateEventPage(),
                  )
                );
              },
            )
          ],
        automaticallyImplyLeading: false,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Upcoming Events'),
              Tab(text: 'My Events'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            UpcomingEventsSection(),
            MyEventsSection(),
          ],
        ),
      ),
    );
  }
}

class UpcomingEventsSection extends StatelessWidget {
  const UpcomingEventsSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Implement the Upcoming Events section
    return const EventPage();
  }
}

class MyEventsSection extends StatelessWidget {
  const MyEventsSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Implement the My Events section
    return const Center(
      child: Text('My Events'),
    );
  }
}