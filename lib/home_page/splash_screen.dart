import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:pulsain_task3/home_page/onboarding_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _animation1;
  late Animation<Color?> _animation2;
  late Animation<Color?> _animation3;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _animation1 = ColorTween(
      begin: Colors.grey[300],
      end: const Color(0xFF12C2E9),
    ).animate(_controller);

    _animation2 = ColorTween(
      begin: Colors.grey[300],
      end: const Color(0xFF12C2E9),
    ).animate(CurvedAnimation(parent: _controller, curve: Interval(0.2, 0.8)));

    _animation3 = ColorTween(
      begin: Colors.grey[300],
      end: const Color(0xFF12C2E9),
    ).animate(CurvedAnimation(parent: _controller, curve: Interval(0.4, 1.0)));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 3000,
      splash: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo utama (ikon "P" PulsaIn)
              SizedBox(
                width: 50,
                height: 50,
                child: Image.asset(
                  "assets/logo_pulsain.png",
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 8),
              // Logo teks (Tulisan "PulsaIn Convert Pulsa Indonesia")
              SizedBox(
                width: 150,
                child: Image.asset(
                  "assets/pulsain_onboarding.png",
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 30),

              // Tiga lingkaran loading
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildAnimatedCircle(_animation1.value!),
                      SizedBox(width: 6),
                      _buildAnimatedCircle(_animation2.value!),
                      SizedBox(width: 6),
                      _buildAnimatedCircle(_animation3.value!),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
      nextScreen: OnboardingPage(),
      backgroundColor: Color(0xFF0075FF),
      splashIconSize: 250,
      centered: true,
    );
  }

  // Fungsi untuk membuat lingkaran animasi
  Widget _buildAnimatedCircle(Color color) {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
