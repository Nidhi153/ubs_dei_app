// import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  final String title;
  final String details;
  final DateTime date;
  final String hostId;
  final List<dynamic> participants;
  final List<dynamic> tags;

  Event({
    required this.title,
    required this.details,
    required this.date,
    required this.hostId,
    required this.participants,
    required this.tags,
  });

  factory Event.fromMap(Map<dynamic, dynamic> map) {
    return Event(
      title: map['Title'],
      details: map['Details'],
      date: map['DateTime'],
      hostId: map['HostID'],
      participants: map['Participants'],
      tags: map['Tags'],
    );
  }

  Map<String, dynamic> toJson() {
      return {
          'Title': title,
          'Details': details,
          'DateTime': date,
          'HostID' : hostId,
          'Participants': participants,
          'Tags': tags,
      };
  }
}



