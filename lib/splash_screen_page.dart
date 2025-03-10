import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:pulsain_task3/onboarding_page.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 3000,
      splash: SafeArea(
        child: Center(
          // Supaya konten tetap di tengah layar
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
              SizedBox(height: 8), // Spasi antara logo dan teks
              // Logo teks (Tulisan "PulsaIn Convert Pulsa Indonesia")
              SizedBox(
                width: 150,
                child: Image.asset(
                  "assets/pulsain_onboarding.png",
                  fit: BoxFit.contain,
                ),
              ),

              SizedBox(height: 30), // Spasi sebelum lingkaran
              // Tiga lingkaran di bawah logo
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color:
                          Colors.blue[200], // Warna lingkaran pertama (aktif)
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 6), // Jarak antar lingkaran
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Colors.grey[300], // Warna lingkaran kedua
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 6), // Jarak antar lingkaran
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Colors.white, // Warna lingkaran ketiga
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      nextScreen: OnboardingScreen(),
      backgroundColor: Color(0xFF0075FF),
      splashIconSize: 250, // Ukuran diperbesar agar cukup untuk semua elemen
      centered: true, // Pastikan splash tetap di tengah layar
    );
  }
}
