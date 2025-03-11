import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:pulsain_task3/aktivitaspage/aktivitas_page.dart';
import 'package:pulsain_task3/widgets/appBar1.dart';
import 'package:pulsain_task3/widgets/button.dart';

class AktivitasBerhasil extends StatelessWidget {
  const AktivitasBerhasil({super.key});

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
            top: 90, // Menempatkan gambar di atas
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/roundvector_aktivitas.png', // Ganti dengan path ilustrasi
              width: double.infinity,
              fit: BoxFit.cover, // Sesuaikan ukuran gambar
            ),
          ),
          // Konten utama
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150, // Atur ukuran ikon sukses
                  height: 150,
                  child: Image.asset(
                    'assets/icon_sukses.png',
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Pesanan Sukses",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                const Text(
                  "Berikut detail informasi pesanan ini",
                  style: TextStyle(color: Color(0xFF4F4D74)),
                ),
                const SizedBox(height: 16),

                // Kartu Transaksi
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

                // Detail Transaksi
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildDetailRow("Tanggal", "29 Februari 2024"),
                      _buildDetailRow("Nominal", "Rp 100.000"),
                      _buildDetailRow("Nomor Pengirim", "082198437823"),
                      _buildDetailRow("Biaya Transfer", "Rp 0"),
                      SizedBox(height: 10),
                      DottedLine(
                        dashColor: Colors.grey.shade400,
                        lineThickness: 1,
                        dashLength: 5,
                        dashGapLength: 3,
                      ),
                      SizedBox(height: 10),
                      _buildDetailRow(
                        "Hasil Konversi",
                        "Rp. 73.000",
                        isHighlighted: true,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 120),
                CustomButton(text: 'Riwayat Transaksi', onPressed: () {}),
              ],
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

  Widget _buildDetailRow(
    String label,
    String value, {
    bool isHighlighted = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.black)),
          Text(
            value,
            style: TextStyle(
              fontWeight: isHighlighted ? FontWeight.bold : FontWeight.normal,
              color: isHighlighted ? Colors.blue : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
