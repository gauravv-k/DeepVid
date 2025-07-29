import 'package:flutter/material.dart';
import 'creation_list_tile.dart';

class AllMyCreationPage extends StatefulWidget {
  const AllMyCreationPage({super.key});

  @override
  State<AllMyCreationPage> createState() => _AllMyCreationPageState();
}

class _AllMyCreationPageState extends State<AllMyCreationPage> {
  final List<Map<String, String>> creations = [
    {
      'imagePath': 'assets/images/Create 1.jpg',
      'title': 'Beautifull bird',
      'date': '25/04/2025',
      'time': '16:39',
      'fileSize': '150 MB',
      'duration': '00:28',
    },
    {
      'imagePath': 'assets/images/Create 2.jpg',
      'title': 'Nature..',
      'date': '25/04/2025',
      'time': '16:39',
      'fileSize': '149 MB',
      'duration': '00:28',
    },
    {
      'imagePath': 'assets/images/Create 3.jpg',
      'title': 'Colourfull flower',
      'date': '25/04/2025',
      'time': '16:39',
      'fileSize': '149 MB',
      'duration': '00:28',
    },
    {
      'imagePath': 'assets/images/Create 4.jpg',
      'title': 'Dinner',
      'date': '25/04/2025',
      'time': '16:39',
      'fileSize': '149 MB',
      'duration': '00:28',
    },
    {
      'imagePath': 'assets/images/Create 2.jpg',
      'title': 'Beach Scenario',
      'date': '25/04/2025',
      'time': '16:39',
      'fileSize': '149 MB',
      'duration': '00:28',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,      
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: creations.length,
        itemBuilder: (context, index) {
          final creation = creations[index];
          return CreationListTile(
            imagePath: creation['imagePath']!,
            title: creation['title']!,
            date: creation['date']!,
            time: creation['time']!,
            fileSize: creation['fileSize']!,
            duration: creation['duration']!,
            onTap: () {
              // Handle item tap
              print('Tapped on creation ${index + 1}');
            },
            onMoreTap: () {
              // Handle more options tap
              print('More options for creation ${index + 1}');
            },
          );
        },
      ),
    );
  }
}