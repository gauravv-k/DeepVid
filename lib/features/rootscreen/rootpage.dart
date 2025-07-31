import 'package:deep_vid/features/community/community.dart';
import 'package:deep_vid/features/favorite/favourite_page.dart';
import 'package:deep_vid/features/my_creation/my_creation_page.dart';
import 'package:deep_vid/features/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:deep_vid/features/ai_creation/ai_creation_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _selectedIndex = 1; // AI Creation is selected by default

  // Commented out navigation screens as requested
  final List<Widget> _screens = [
    const CommunityPage(),
    const AiCreationPage(),
    const FavouritePage(),
    const MyCreationPage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1C), // Dark background
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(221, 32, 31, 31), // Dark gray background
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        child: SafeArea(
          child: Padding(
            // Increased padding for better touch area
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavItem(0, 'community.png', 'Community'),
                _buildNavItem(1, 'ai creation.png', 'AI Creation'),
                _buildNavItem(2, 'favourite.png', 'Favourite'),
                _buildNavItem(3, 'my creation.png', 'My Creation'),
                _buildNavItem(4, 'user.png', 'Profile'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, String iconPath, String label) {
    final isSelected = _selectedIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () => _onItemTapped(index),
        child: Container(
          // Increased padding for larger touch area
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 3),
          // Added margin for better spacing
          //margin: const EdgeInsets.symmetric(horizontal: 1),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 38,
                decoration: isSelected
                    ? BoxDecoration(
                        color: const Color.fromARGB(
                            60, 198, 88, 245), // Purple background for selected
                        borderRadius: BorderRadius.circular(10),
                      )
                    : BoxDecoration(
                        // Added subtle background for unselected items
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                child: Center(
                  child: Image.asset('assets/images/$iconPath',
                      width: 18,
                      height: 18,
                      color: isSelected
                          ? const Color.fromARGB(255, 198, 88, 245)
                          : Colors
                              .grey // White for selected, gray for unselected
                      ),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  color: isSelected
                      ? Color.fromARGB(255, 198, 88, 245)
                      : Colors.grey,
                  fontSize: 9,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w700, // Always bold
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
