import 'package:deep_vid/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:deep_vid/features/auth/presentation/cubits/auth_states.dart';
import 'package:deep_vid/features/home/presentation/ui/home_page.dart';
import 'package:deep_vid/features/onboarding/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    
    // Initialize animation controllers
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    
    // Initialize animations
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    ));
    
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeOutCubic,
    ));
    
    // Start animations
    _fadeController.forward();
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) {
        _slideController.forward();
      }
    });
    
    // Strict 5 second timer with fade out
    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) {
        _fadeController.reverse();
      }
    });
    
    Future.delayed(const Duration(milliseconds: 5500), () {
      if (mounted) {
        final authCubit = context.read<AuthCubit>();
        final currentState = authCubit.state;
        
        if (currentState is Authenticated) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        } else {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const OnboardingPage()),
          );
        }
      }
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 197, // Smaller width
                height: 197, // Smaller height
                child: Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 40), // Vertical spacing between logo and title

              // Animated main title "DeepVid" with slide animation
              SlideTransition(
                position: _slideAnimation,
                child: Text(
                  'DeepVid',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF9066B8),
                    fontFamily: 'Urbanist',
                    height: 1.0, // 100% line height
                    letterSpacing: 0.0, // 0% letter spacing
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: 8), // Smaller spacing between title and subtitle

              // Animated subtitle "AI Faceless Video Generator" with slide animation
              SlideTransition(
                position: _slideAnimation,
                child: Text(
                  'AI Faceless Video Generator',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                    fontFamily: 'Urbanist',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
