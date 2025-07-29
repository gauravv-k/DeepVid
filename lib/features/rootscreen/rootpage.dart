import 'package:deep_vid/features/community/community.dart';
import 'package:deep_vid/features/favorite/all_favourite.dart';
import 'package:deep_vid/features/favorite/favourite_page.dart';
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
  // final List<Widget> _screens = [
  //   const CommunityScreen(),
  //   const AICreationScreen(),
  //   const FavouriteScreen(),
  //   const MyCreationScreen(),
  //   const ProfileScreen(),
  // ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _getCurrentScreen() {
    switch (_selectedIndex) {
      case 1: // AI Creation
        return const AiCreationPage();
      case 0: // AI Creation
        return const CommunityPage();
      case 2: // AI Creation
        return const FavouritePage();
      default:
        return Center(
          child: Text(
            'Screen ${_selectedIndex + 1}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontFamily: 'Urbanist',
            ),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A), // Dark background
      body: _getCurrentScreen(),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF2A2A2A), // Dark gray background
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: SafeArea(
          child: Padding(
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
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 1),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: isSelected
                    ? BoxDecoration(
                        color: const Color.fromARGB(170, 150, 111, 243), // Purple background for selected
                        borderRadius: BorderRadius.circular(10),
                      )
                    : null,
                child: Center(
                  child: Image.asset(
                    'assets/images/$iconPath',
                    width: 20,
                    height: 20,
                    color: isSelected ? Colors.white : const Color(0xFF9CA3AF), // White for selected, gray for unselected
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style:  TextStyle(
                  color: isSelected ? Color.fromARGB(255, 160, 129, 234) : const Color(0xFF9CA3AF), // Always purple for bold
                  fontSize: 9,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.bold, // Always bold
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
