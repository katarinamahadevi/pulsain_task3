import 'package:flutter/material.dart';
import 'package:pulsain_task3/homepage/notification_page.dart';
import 'package:pulsain_task3/rekeningpage/rekening_page.dart';
import 'package:pulsain_task3/tukarpulsapage/tukarpulsa2_page.dart';
import 'package:pulsain_task3/widgets/checkbox.dart';
import '../widgets/button3.dart';
import 'package:dotted_line/dotted_line.dart';

class TukarpulsaPage extends StatelessWidget {
  const TukarpulsaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
          Positioned.fill(
            child: Image.asset(
              'assets/bg_tukarpulsa.png', // Pastikan gambar ada di folder assets
              fit: BoxFit.cover,
            ),
          ),

          // AppBar Custom
          Positioned(
            top: 40, // Sesuaikan margin dari atas
            left: 16,
            right: 16,
            child: Row(
              children: [
                // Tombol Back
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                ),

                // Spasi kecil antara ikon back dan teks
                const SizedBox(width: 5),

                // Judul dengan Expanded agar tetap di tengah
                Expanded(
                  child: const Text(
                    "Tukar Pulsa",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign:
                        TextAlign.center, // Pastikan teks berada di tengah
                  ),
                ),

                // Spacer agar ikon notifikasi tetap di kanan
                const Spacer(),
                // Ikon Notifikasi
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => KotakMasukScreen(),
                      ),
                    );
                    // Aksi ketika ikon notifikasi ditekan
                  },
                  child: Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.notifications_none,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      // Notifikasi badge (jika ada notifikasi baru)
                      Positioned(
                        top: 4,
                        right: 4,
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: Colors.yellow,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Column(
            children: [
              Expanded(
                child: Container(), // Untuk memberi ruang pada background atas
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFEFF5F7),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                padding: const EdgeInsets.all(20),
                child: Expanded(
                  // Tambahkan Expanded agar layout tetap responsif
                  child: SingleChildScrollView(
                    // Tambahkan scrolling
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Nomor Telepon"),
                        const SizedBox(height: 5),
                        // Input Nomor Telepon
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: const Color(0xFFCFD7FF)),
                            color: Colors.white,
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 12,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFEFEFFF),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    bottomLeft: Radius.circular(5),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      "+62",
                                      style: TextStyle(
                                        color: const Color(0xFF0075FF),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Colors.blue,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: TextField(
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    hintText: "************",
                                    hintStyle: TextStyle(
                                      color: Colors.grey.shade400,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text("Nominal Pulsa"),
                            const SizedBox(height: 8),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: const Color(0xFFEFEFFF),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.warning,
                                    color: Colors.orange,
                                    size: 18,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    "Minimal Rp 30.000",
                                    style: TextStyle(
                                      color: Colors.blue.shade700,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextField(
                              decoration: InputDecoration(
                                hintText: "Masukkan nominal pulsa",
                                hintStyle: TextStyle(
                                  color: Colors.grey.shade400,
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: const Color(0xFFCFD7FF),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: const Color(0xFFCFD7FF),
                                  ), // Warna border saat tidak aktif
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: const Color(0xFFCFD7FF),
                                  ), // Warna border saat aktif
                                ),
                              ),
                              keyboardType: TextInputType.number,
                            ),
                            const SizedBox(height: 10),

                            // Pilihan Rekening
                            const Text("Rekening Utama"),
                            const SizedBox(height: 8),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RekeningPage(),
                                  ),
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 14,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: const Color(0xFFCFD7FF),
                                  ),
                                ),
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Pilih Rekening",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_drop_down,
                                      color: Color.fromRGBO(33, 150, 243, 1),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),

                            // Informasi Konversi

                            // Checkbox dengan custom UI
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: const Color(0xFFCFD7FF),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Teks Informasi
                                  const Text(
                                    "Untuk dapat convert nominal 30.000 anda harus memiliki pulsa 34.500. "
                                    "Pastikan pulsa anda aman tidak dari tindak ilegal.",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF4B4C4D),
                                    ),
                                  ),
                                  const SizedBox(height: 10),

                                  // Garis Putus-Putus
                                  DottedLine(
                                    dashColor: Colors.grey.shade400,
                                    lineThickness: 1,
                                    dashLength: 5,
                                    dashGapLength: 3,
                                  ),
                                  const SizedBox(height: 5),

                                  // Checkbox dan Teks
                                  Row(
                                    children: [
                                      Transform.scale(
                                        scale: 0.9,
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: Image.asset(
                                            'assets/icon_checkbox.png',
                                            width: 24,
                                            height: 24,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        child: Text(
                                          'Anda setuju dengan nominal hasil convert.',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 80),
                            Button3(
                              text: "Lanjutkan",
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TukarPulsa2(),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
