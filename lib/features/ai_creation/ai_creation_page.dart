import 'package:deep_vid/features/ai_creation/widgets/showbox.dart';
import 'package:flutter/material.dart';
import '../app_bar/app_bar.dart';
import 'widgets/ai_creation_card.dart';

class AiCreationPage extends StatelessWidget {
  const AiCreationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: CustomAppBar(title: "Ai Creation"),
      ),
      backgroundColor: Colors.black12,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        children: [          
          const SizedBox(height: 10),
          AiCreationCard(
            title: "AI VIDEO CREATION",
            description: "Generate stunning videos from text or images",
            icon: Icons.videocam,
            iconColor: const Color(0xFF4A90E2),
            backgroundImage: "assets/images/ai1.png",
            statusTag: "NEW",
            statusColor: const Color(0xFF007AFF),
            shadowColor: Colors.blueAccent,
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => Dialog(
                  backgroundColor: Colors.transparent,
                  insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                  child: SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Material(
                        color: Colors.transparent,
                        child: ShowBox(
                          onClose: () {
                            Navigator.of(context).pop();
                          },
                          onVideoGenerationTap: () {
                            // You can add navigation or logic here for video generation
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 20.0),
          AiCreationCard(
            title: "AI IMAGE CREATION",
            description: "Transform text into stunning visuals",
            icon: Icons.image,
            iconColor: const Color(0xFF8E44AD),
            backgroundImage: "assets/images/ai2.jpg",
            statusTag: "POPULAR",
            statusColor: const Color.fromARGB(255, 189, 4, 186),
            shadowColor: const Color.fromARGB(213, 141, 68, 173),
          ),
          const SizedBox(height: 20.0),
          AiCreationCard(
            title: "AI AUDIO CREATION",
            description: "Generate music and sounds from text prompts",
            icon: Icons.music_note,
            iconColor: const Color.fromARGB(255, 159, 69, 59),
            backgroundImage: "assets/images/ai3.png",
            statusTag: "NEW FEATURE ",
            statusColor: const Color.fromARGB(255, 159, 69, 59),
            shadowColor: const Color.fromARGB(175, 231, 77, 60),
          ),
        ],
      ),
    );
  }
}
