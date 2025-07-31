
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool pushNotificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A), // Dark charcoal background
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1A1A),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 24,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Settings',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w600,
            fontFamily: 'Urbanist',
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //const SizedBox(height: 20),

            // Notifications Section
            _buildSectionHeader('Notifications'),
            const SizedBox(height: 16),
            _buildNotificationTile(),

            const SizedBox(height: 20),

            // Contact Section
            _buildSectionHeader('Contact'),
            const SizedBox(height: 16),
            _buildContactTile(),

            const SizedBox(height: 20),

            // Account Section
            _buildSectionHeader('Account'),
            const SizedBox(height: 16),
            _buildLogoutTile(),
            const SizedBox(height: 16),
            _buildDeleteAccountTile(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        fontFamily: 'Urbanist',
      ),
    );
  }

  Widget _buildNotificationTile() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            const Icon(
              Icons.notifications_outlined,
              color: Colors.white,
              size: 30,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Push Notifications',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Urbanist',
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Get notified about updates',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 12,
                      fontFamily: 'Urbanist',
                    ),
                  ),
                ],
              ),
            ),
            CupertinoSwitch(
              value: pushNotificationsEnabled,
              onChanged: (value) {
                setState(() {
                  pushNotificationsEnabled = value;
                });
              },
              activeColor: const Color(0xFF8B5CF6), // Purple color
              trackColor: Colors.grey[600],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactTile() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            const Icon(Icons.email_outlined, color: Colors.white, size: 20),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                'feedback@deepvid.ai',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Urbanist',
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_rounded,
              color: Colors.white,
              size: 22,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogoutTile() {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      // onTap: () async {        
      //   try {
      //     await FirebaseAuth.instance.signOut();
      //     // if (mounted) {
      //     //   Navigator.pushReplacement(
      //     //     context,
      //     //     MaterialPageRoute(builder: (context) => OnboardingPage()),
      //     //   );
      //     // }
      //   } catch (e) {
      //     ScaffoldMessenger.of(context).showSnackBar(
      //       SnackBar(
      //         content: Text('Logout failed: $e'),
      //         backgroundColor: Colors.red,
      //       ),
      //     );
      //   }
      // },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF2A2A2A),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              const Icon(
                Icons.logout_outlined,
                color: Colors.white,
                size: 35,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Logout',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Urbanist',
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Temporarily logout from your account',
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 11.5,
                        fontFamily: 'Urbanist',
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_rounded,
                color: Colors.white,
                size: 22,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDeleteAccountTile() {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF2A2A2A),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              const Icon(
                Icons.delete_outline_outlined,
                color: Colors.red,
                size: 35,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Delete Account',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Urbanist',
                      ),
                    ),
                    const SizedBox(height: 2),
                    const Text(
                      'Permanently remove your account',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                        fontFamily: 'Urbanist',
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_rounded,
                color: Colors.red,
                size: 22,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
