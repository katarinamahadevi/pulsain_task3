import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:pulsain_task3/aktivitaspage/aktivitas_page.dart';
import 'package:pulsain_task3/tukarpulsapage/chat_page.dart';
import 'package:pulsain_task3/widgets/appBar1.dart';
import 'package:pulsain_task3/widgets/button.dart';
import 'package:pulsain_task3/widgets/button2.dart';

class AktivitasMenunggu extends StatelessWidget {
  const AktivitasMenunggu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFF5F7),
      appBar: AppBar1(
        title: "Orders", // Judul bisa diubah
        onBackPressed: () {
          Navigator.pop(context); // Navigasi kembali
        },
      ),

      body: Stack(
        children: [
          // Ilustrasi di latar belakang
          Positioned(
            top: 90,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/roundvector_aktivitas.png',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          // Konten utama
          Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: Image.asset(
                      'assets/icon_menunggu.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Menunggu Pembayaran",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Berikut detail informasi pesanan ini",
                    style: TextStyle(color: Color(0xFF4F4D74)),
                  ),

                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildTransactionColumn(
                          "assets/logo_telkomsel.png",
                          "Telkomsel",
                          "082198437823",
                          CrossAxisAlignment.start,
                        ),
                        const Icon(Icons.swap_horiz, color: Colors.blueAccent),
                        _buildTransactionColumn(
                          "assets/logo_bca.png",
                          "BCA",
                          "17712100413",
                          CrossAxisAlignment.end,
                          isReversed:
                              true, // Tambahkan parameter ini untuk membalik posisi
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEFFAFF),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xFFCEF3FF)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "*858*082271696916*30000# ",
                          style: TextStyle(fontSize: 16),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Image.asset(
                              'assets/icon_copy.png',
                              width: 20,
                              height: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Notifikasi Peringatan
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 5,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF6F1EB),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.warning_amber_rounded,
                                color: Color(0xFFFFA000),
                                size: 20,
                              ),
                            ),
                            const SizedBox(width: 15),
                            const Expanded(
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Penting!\n",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          "Baca panduan cara tukar pulsa berikut ini.",
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: DottedLine(dashColor: Colors.grey),
                        ),
                        const Text(
                          "Klik kirim untuk transfer pulsa ke nomor kami atau copy kemudian dial ke telepon anda. Beritahu Admin jika sudah berhasil mentransfer pulsa dengan cara Chat Customer Services atau upload bukti berhasil.",
                          style: TextStyle(fontSize: 14, color: Colors.black87),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 70),
                  CustomButton(text: "Transfer Pulsa", onPressed: () {}),
                  const SizedBox(height: 10),
                  Button2(
                    text: "Chat",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChatPage()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionColumn(
    String iconPath,
    String title,
    String subtitle,
    CrossAxisAlignment align, {
    bool isReversed =
        false, // Tambahkan parameter opsional untuk membalik urutan
  }) {
    return Column(
      crossAxisAlignment: align,
      children: [
        Row(
          mainAxisAlignment:
              isReversed ? MainAxisAlignment.end : MainAxisAlignment.start,
          children:
              isReversed
                  ? [
                    Text(
                      title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 5),
                    Image.asset(iconPath, width: 20), // Gambar di kanan
                  ]
                  : [
                    Image.asset(iconPath, width: 20), // Gambar di kiri
                    const SizedBox(width: 5),
                    Text(
                      title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
        ),
        const SizedBox(height: 5),
        Text(subtitle, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}
