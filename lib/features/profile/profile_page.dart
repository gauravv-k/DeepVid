import 'package:deep_vid/features/app_bar/app_bar.dart';
import 'package:deep_vid/features/settings/setting_page1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'data/firebase_profile_repo.dart';
import 'presentation/cubits/profile_cubit.dart';
import 'presentation/cubits/profile_states.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    // Fetch user profile when page loads
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId != null) {
      context.read<ProfileCubit>().fetchUserProfile(userId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: CustomAppBar(title: "Profile"),
      ),
      body: BlocConsumer<ProfileCubit, ProfileStates>(
        listener: (context, state) {
          if (state is ProfileError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Color(0xFF8A56E2),
              ),
            );
          } else if (state is ProfileLoaded) {
            return _buildProfileContent(state.profile);
          } else if (state is ProfileNotFound) {
            return _buildProfileNotFound();
          } else if (state is ProfileError) {
            return _buildErrorState(state.message);
          } else {
            return const Center(
              child: Text(
                'No profile data',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildProfileContent(profile) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User Profile Section
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                // Profile Image
                Container(
                  width: 80,
                  height: 80,
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/profile1.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                // Name and Email
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                Text(
                  profile.name.isNotEmpty ? profile.name : 'No Name',
                  style: const TextStyle(
                    fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontFamily: 'Urbanist',
                  ),
                ),
                if (profile.email != null) ...[
                        const SizedBox(height: 2),
                  Text(
                    profile.email,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Color(0xFF9E9E9E),
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Urbanist',
                    ),
                  ),
                ],
              ],
            ),
          ),
              ],
            ),
          ),
          const SizedBox(height: 18),

          // Plan and Top-ups Section wrapped in background container
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xCC222634), // #222634CC
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  _buildPlanCard(),
                  const SizedBox(height: 16),
                  _buildTopUpsCard(),
                  
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),

          // Refer & Earn Section
          _buildReferEarnCard(),
          const SizedBox(height: 32),

          // Other Section
          const Text(
            'Other',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontFamily: 'Urbanist',
            ),
          ),
          const SizedBox(height: 16),

          // Other Options
          _buildOtherOption(
            Icons.settings,
            'Settings',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingPage()),
              );
            },
          ),
          _buildOtherOption(Icons.receipt, 'Invoice History'),
          _buildOtherOption(Icons.description, 'Terms & Conditions'),
          _buildOtherOption(Icons.privacy_tip, 'Privacy Policy'),
          _buildOtherOption(Icons.feedback, 'Feedback'),
        ],
      ),
    );
  }

  Widget _buildPlanCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.star,
                color: const Color(0xFF8A56E2),
                size: 20,
              ),
              const SizedBox(width: 8),
              const Text(
                'Plan : Starter (Premium)',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Urbanist',
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'Renews on 12 July 2025',
            style: TextStyle(
              color: Color(0xFF9E9E9E),
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: 'Urbanist',
            ),
          ),
            const SizedBox(height: 16),
          Opacity(
            opacity: 1,
            child: Container(
              width: 84,
              height: 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: const LinearGradient(
                  colors: [Color(0xFF9066B8), Color(0xFFB089F1)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () {
                    // Handle manage button
                  },
                  child: const Center(
                    child: Text(
                      'Manage',
                      style: TextStyle(
                        color: Color(0xFF0D0D12),
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Urbanist',
                        fontStyle: FontStyle.normal, 
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopUpsCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.add,
                color: const Color(0xFF8A56E2),
                size: 20,
              ),
              const SizedBox(width: 8),
              const Text(
                'Add Tops-ups',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Urbanist',
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'Purchase extra credits for more creations',
            style: TextStyle(
              color: Color(0xFF9E9E9E),
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: 'Urbanist',
            ),
          ),
          const SizedBox(height: 16),
          Opacity(
            opacity: 1,
            child: Container(
              width: 88,
              height: 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: const LinearGradient(
                  colors: [Color(0xFF9066B8), Color(0xFFB089F1)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () {
                    // Handle manage button
                  },
                  child: const Center(
                    child: Text(
                      'Buy More',
                      style: TextStyle(
                        color: Color(0xFF0D0D12),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Urbanist',
                        fontStyle: FontStyle.normal, 
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReferEarnCard() {
    return Container(
      width: 364,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
          colors: [Color(0xFF6033B0), Color(0xFF8752D8)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16), // Increased padding for better spacing
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min, // Use minimum space needed
          children: [
            Row(
              children: [
                // Circular icon background
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xFF6A3FB8),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.people,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  'Refer & Earn',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Urbanist',
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              'Invite your friends and earn rewards!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontFamily: 'Urbanist',
                fontStyle: FontStyle.normal,
              ),
            ),
            const SizedBox(height: 16), // Fixed spacing instead of Spacer
            SizedBox(
              width: 89,
              height: 32,
              child: ElevatedButton(
                onPressed: () {
                  // Handle refer now button
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white.withOpacity(1),
                  foregroundColor: const Color(0xFF0D0D12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
                ),
                child: Center(
                  child: const Text(
                    'Refer',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Urbanist',
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOtherOption(IconData icon, String title, {VoidCallback? onTap}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: onTap,
          child: Row(
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: 20,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Urbanist',
                  ),
                ),
              ),
              const Icon(
                Icons.chevron_right,
                color: Colors.white,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileNotFound() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.person_off,
            size: 64,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          const Text(
            'Profile Not Found',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              fontFamily: 'Urbanist',
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'No profile data found for this user.',
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF9E9E9E),
              fontWeight: FontWeight.w400,
              fontFamily: 'Urbanist',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 64,
            color: Colors.red[400],
          ),
          const SizedBox(height: 16),
          const Text(
            'Error Loading Profile',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.red,
              fontFamily: 'Urbanist',
            ),
          ),
          const SizedBox(height: 8),
          Text(
            message,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF9E9E9E),
              fontWeight: FontWeight.w400,
              fontFamily: 'Urbanist',
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              final userId = FirebaseAuth.instance.currentUser?.uid;
              if (userId != null) {
                context.read<ProfileCubit>().fetchUserProfile(userId);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF8A56E2),
              foregroundColor: Colors.white,
            ),
            child: const Text(
              'Retry',
              style: TextStyle(
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
