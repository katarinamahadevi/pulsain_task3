import 'package:flutter/material.dart';
import 'package:pulsain_task3/models/warning_modal.dart';
import 'package:pulsain_task3/rekening_page.dart';
import 'package:pulsain_task3/tukarpulsa2_page.dart';
import 'package:pulsain_task3/widgets/button.dart';
import 'widgets/button3.dart';
import 'package:dotted_line/dotted_line.dart';

void showWarningModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return const WarningModal();
    },
  );
}

class TukarPulsa2 extends StatelessWidget {
  const TukarPulsa2({super.key});

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
                    child: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                ),

                // Spasi kecil antara ikon back dan teks
                const SizedBox(width: 10),

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
                padding: const EdgeInsets.all(16),
                child: Expanded(
                  // Tambahkan Expanded agar layout tetap responsif
                  child: SingleChildScrollView(
                    // Tambahkan scrolling
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Nomor Telepon"),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const Color(0xFFEFEFFF),
                            borderRadius: BorderRadius.circular(10),
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
                                "Provider Telkomsel",
                                style: TextStyle(
                                  color: Colors.blue.shade700,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
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
                                    bottomLeft: Radius.circular(8),
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
                                    hintText: "82212345678",
                                    hintStyle: TextStyle(
                                      color: const Color(0xFF291C39),
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
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
                                borderRadius: BorderRadius.circular(10),
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
                                    "Hasil 80.000",
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
                                hintText: "Rp 100.000",
                                hintStyle: TextStyle(
                                  color: const Color(0xFF291C39),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
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
                            const SizedBox(height: 20),

                            // Pilihan Rekening
                            const Text("Rekening Utama"),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: const Color(0xFFEFEFFF),
                                borderRadius: BorderRadius.circular(10),
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
                                    "Free",
                                    style: TextStyle(
                                      color: Colors.blue.shade700,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
                                      style: TextStyle(color: Colors.grey),
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
                                        child: Checkbox(
                                          value: false,
                                          onChanged: (value) {},
                                          activeColor: Colors.blue.shade400,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              5,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Text(
                                        "Anda setuju dengan nominal hasil convert",
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Color(0xFF4B4C4D),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),

                            CustomButton(
                              text: "Lanjutkan",
                              onPressed: () {
                                showWarningModal(context);
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
