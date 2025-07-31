import 'package:deep_vid/features/ai_creation/widgets/ai_nav1.dart';
import 'package:deep_vid/features/ai_creation/widgets/showbox.dart';
import 'package:flutter/material.dart';
import '../app_bar/app_bar.dart';
import 'widgets/ai_creation_card.dart';

class AiCreationPage extends StatelessWidget {
  const AiCreationPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions for responsive design
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;
    
    // Calculate dynamic padding and spacing based on screen size
    final horizontalPadding = screenWidth * 0.04; // 4% of screen width
    final verticalPadding = screenHeight * 0.015; // 1.5% of screen height
    final cardSpacing = screenHeight * 0.025; // 2.5% of screen height
    final topSpacing = screenHeight * 0.012; // 1.2% of screen height

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: CustomAppBar(title: "Ai Creation"),
      ),
      backgroundColor: Colors.black12,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
        children: [          
          SizedBox(height: topSpacing),
          AiCreationCard(
            title: "AI VIDEO CREATION",
            description: "Generate stunning videos from text or images",
            icon: Icons.videocam,
            iconColor: const Color(0xFF4A90E2),
            backgroundImage: "assets/images/ai1.png", // update and use gif and make it live 
            statusTag: "NEW",
            statusColor: const Color(0xFF007AFF),
            shadowColor: Colors.blueAccent,
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => Dialog(
                  backgroundColor: Colors.transparent,
                  insetPadding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.06, // 6% of screen width
                    vertical: screenHeight * 0.03, // 3% of screen height
                  ),
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
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const AiImageCreatorPage()));
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          SizedBox(height: cardSpacing),
          AiCreationCard(
            title: "AI IMAGE CREATION",
            description: "Transform text into stunning visuals",
            icon: Icons.image,
            iconColor: const Color(0xFF8E44AD),
            backgroundImage: "assets/images/ai2.jpg",
            statusTag: "POPULAR",
            statusColor: const Color.fromARGB(255, 189, 4, 186),
            shadowColor: const Color.fromARGB(213, 141, 68, 173),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AiImageCreatorPage()),
              );
            },
          ),
          SizedBox(height: cardSpacing),
          AiCreationCard(
            title: "AI AUDIO CREATION",
            description: "Generate music and sounds from text prompts",
            icon: Icons.music_note,
            iconColor: const Color.fromARGB(255, 159, 69, 59),
            backgroundImage: "assets/images/ai3.png",
            statusTag: "NEW FEATURE ",
            statusColor: const Color.fromARGB(255, 159, 69, 59),
            shadowColor: const Color.fromARGB(175, 231, 77, 60),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AiImageCreatorPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
