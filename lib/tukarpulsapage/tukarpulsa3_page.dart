import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:pulsain_task3/aktivitaspage/aktivitas_menunggu.page.dart';
import 'package:pulsain_task3/homepage/notification_page.dart';
import 'package:pulsain_task3/widgets/button.dart';
import 'package:pulsain_task3/widgets/button2.dart';

class TukarPulsa3 extends StatelessWidget {
  const TukarPulsa3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
          Positioned.fill(
            child: Image.asset('assets/bg_tukarpulsa.png', fit: BoxFit.cover),
          ),

          // AppBar Custom
          Positioned(
            top: 40,
            left: 16,
            right: 16,
            child: Row(
              children: [
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
                const SizedBox(width: 10),
                Expanded(
                  child: const Text(
                    "Tukar Pulsa",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => KotakMasukScreen(),
                      ),
                    );
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
              Expanded(child: Container()),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF1FDFF),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildProviderInfo(), // Container Info Provider & Bank
                    const SizedBox(height: 12),
                    _buildTransactionDetails(), // Container Info Transaksi
                    const SizedBox(height: 16),
                    Button2(
                      text: "Aplikasi",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AktivitasMenunggu(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    CustomButton(
                      text: "Whatsapp",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AktivitasMenunggu(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Widget untuk menampilkan informasi provider & bank
  Widget _buildProviderInfo() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(05),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset('assets/logo_telkomsel.png', height: 24),
                  const SizedBox(width: 8),
                  const Text(
                    "Telkomsel",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Text("082198437823", style: TextStyle(color: Colors.grey)),
            ],
          ),
          const Icon(Icons.swap_horiz, color: Colors.blue),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Image.asset('assets/logo_bca.png', height: 20),
                  const SizedBox(width: 8),
                  const Text(
                    "BCA",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Text("17712100413", style: TextStyle(color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }

  /// Widget untuk menampilkan detail transaksi
  Widget _buildTransactionDetails() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildInfoRow("Nominal", "Rp 100.000"),
          _buildInfoRow("Rate", "0.8"),
          _buildInfoRow("Hasil Konversi", "Rp 80.000"),
          _buildInfoRow("Biaya Transfer", "Rp 0"),
          const SizedBox(height: 5),
          const DottedLine(
            dashColor: Colors.grey,
            lineThickness: 1,
            dashLength: 5,
            dashGapLength: 3,
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment:
                CrossAxisAlignment.start, // Pastikan sejajar ke atas
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Total Akhir",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Jumlah uang yang diterima",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  SizedBox(height: 25), // Tambahkan jarak agar sejajar
                  Text(
                    "Rp 80.000",
                    style: TextStyle(
                      color: Color(0xFF0075FF),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Widget reusable untuk menampilkan baris informasi transaksi
Widget _buildInfoRow(
  String title,
  String value, {
  bool isBold = false,
  bool isHighlight = false,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: isHighlight ? Colors.blue : Colors.black,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    ),
  );
}
