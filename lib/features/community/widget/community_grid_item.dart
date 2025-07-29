import 'package:flutter/material.dart';

class CommunityGridItem extends StatelessWidget {
  final String imagePath;
  final bool isVideo;
  const CommunityGridItem({Key? key, required this.imagePath, this.isVideo = false}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(imagePath, fit: BoxFit.cover),
          if (isVideo)
            Center(
              child: Icon(Icons.play_circle_fill, color: Colors.white70, size: 48),
            ),
        ],
      ),
    );
  }
}