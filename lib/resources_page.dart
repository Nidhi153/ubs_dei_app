// make an empty page with just the title resources

import 'package:flutter/material.dart';

class ResourcesPage extends StatefulWidget {
  const ResourcesPage({super.key});

  @override
  ResourcesPageState createState() => ResourcesPageState();
}

class ResourcesPageState extends State<ResourcesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resources'),
      ),
      body: const Center(
        child: Text('Resources'),
      ),
    );
  }
}