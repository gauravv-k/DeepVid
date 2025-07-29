import 'package:deep_vid/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:deep_vid/features/auth/presentation/cubits/auth_states.dart';
import 'package:deep_vid/features/onboarding/onboarding_page.dart';
import 'package:deep_vid/features/settings/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is Unauthenticated) {
          // Navigate to onboarding page when user logs out
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const OnboardingPage()),
            (route) => false, // Remove all previous routes
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("DeepVid"),
          actions: [
            IconButton(
              icon: Icon(Icons.logout_outlined),
              tooltip: 'Logout',
              onPressed: () {
                context.read<AuthCubit>().logout();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Logout Pressed.!')),
                );
              },
            ),
          ],
        ),
        body: SettingsPage(),
      ),
    );
  }
}