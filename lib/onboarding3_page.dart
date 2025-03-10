import 'package:flutter/material.dart';
import 'package:pulsain_task3/getstar_page.dart';
import 'package:pulsain_task3/onboarding2_page.dart';
import 'package:pulsain_task3/onboarding3_page.dart';

class OnboardingScreen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1FDFF),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Center(
            child: Image.asset(
              'assets/illust_onboarding3.png',
              width: 250,
              height: 250,
            ),
          ),
          SizedBox(height: 30),
          Text(
            'Termurah',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              'Rate convert paling murah untuk penukaran pulsa menjadi e-money',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 6,
                width: 20,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              SizedBox(width: 5),
              Container(
                height: 6,
                width: 20,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              SizedBox(width: 5),
              Container(
                height: 6,
                width: 30,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ],
          ),
          SizedBox(height: 75),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0075FF), // Warna tombol
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    30,
                  ), // Membuat tombol oval
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 45,
                ), // Padding dalam tombol
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WelcomeScreen()),
                );

                // Aksi saat tombol ditekan
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Mulai",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Warna teks
                    ),
                  ),
                  SizedBox(width: 8), // Jarak antara teks dan ikon
                ],
              ),
            ),
          ),

          SizedBox(height: 50),
        ],
      ),
    );
  }
}
