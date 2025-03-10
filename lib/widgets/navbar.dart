import 'package:flutter/material.dart';
import 'package:pulsain_task3/home_page.dart';
import 'package:pulsain_task3/aktivitas_page.dart';
import 'package:pulsain_task3/rekening_page.dart';
import 'package:pulsain_task3/tukarpulsa_page.dart';
import 'package:pulsain_task3/profile_page.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int currentIndex = 0;

  // Daftar halaman yang akan dipanggil berdasarkan index
  final List<Widget> _pages = [
    HomeScreen(),
    AktivitasPage(),
    TukarpulsaPage(),
    RekeningPage(),
    const ProfilePage(),
  ];

  // Fungsi untuk mengganti halaman saat tab dipilih
  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Fungsi untuk membangun konten berdasarkan tab yang dipilih
    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return HomeScreen(); // Menampilkan HomePage jika Home tab dipilih
        case 1:
          return AktivitasPage(); // Menampilkan AktivitasPage jika Aktivitas tab dipilih
        case 2:
          return TukarpulsaPage(); // Menampilkan TukarPulsaPage jika Tukar Pulsa tab dipilih
        case 3:
          return RekeningPage(); // Menampilkan RekeningPage jika Rekening tab dipilih
        case 4:
          return const ProfilePage(); // Menampilkan ProfilPage jika Profil tab dipilih
        default:
          return HomeScreen(); // Default ke HomePage jika index tidak dikenali
      }
    }

    // Membuat item navbar
    Widget navbarItem({
      String? text,
      int? index,
      String? assetPath, // Path gambar untuk ikon
    }) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: InkWell(
          onTap: () {
            onTabTapped(index!); // Mengubah halaman saat item navbar dipilih
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                assetPath!,
                width: 30, // Ukuran ikon navbar
                height: 30, // Ukuran ikon navbar
                color:
                    currentIndex == index
                        ? Colors.blue
                        : Colors.grey, // Warna ikon berdasarkan status aktif
              ),
              Text(
                text!,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color:
                      currentIndex == index
                          ? Colors.blue
                          : Colors.grey, // Warna teks berdasarkan status aktif
                ),
              ),
            ],
          ),
        ),
      );
    }

    // Membuat bottom navbar kustom dengan gambar assets
    Widget customBottomNavigationBar() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/BG.png'),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              navbarItem(
                text: 'Home',
                index: 0,
                assetPath:
                    'assets/icon_home.png', // Menggunakan gambar dari assets
              ),
              navbarItem(
                text: 'Aktivitas',
                index: 1,
                assetPath:
                    'assets/icon_aktivitas.png', // Menggunakan gambar dari assets
              ),
              const SizedBox(
                width: 70,
              ), // Menyediakan ruang untuk tombol floating
              navbarItem(
                text: 'Rekening',
                index: 3,
                assetPath:
                    'assets/icon_rekening.png', // Menggunakan gambar dari assets
              ),
              navbarItem(
                text: 'Profile',
                index: 4,
                assetPath:
                    'assets/icon_profile.png', // Menggunakan gambar dari assets
              ),
            ],
          ),
        ),
      );
    }

    // Membuat FloatingActionButton untuk Tukar Pulsa
    Widget floatingActionButton() {
      return Padding(
        padding: const EdgeInsets.only(
          bottom: 50,
        ), // Memberikan padding agar tidak tumpang tindih
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: FloatingActionButton(
              onPressed: () {
                // Menavigasi ke halaman Tukar Pulsa
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TukarpulsaPage()),
                );
              },
              shape: CircleBorder(),
              backgroundColor: Color(
                0xFF3D95FD,
              ), // Ganti dengan warna yang diinginkan

              child: Icon(Icons.swap_horiz, color: Colors.white),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          buildContent(currentIndex), // Konten berdasarkan tab yang dipilih
          customBottomNavigationBar(), // Navbar yang menggunakan gambar dari assets
          floatingActionButton(), // Floating action button
        ],
      ),
    );
  }
}
