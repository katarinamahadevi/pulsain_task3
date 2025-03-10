import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';

class RateModal extends StatelessWidget {
  const RateModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Garis kecil di atas modal
          Container(
            width: 40,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.blue.shade100,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(height: 10), // Jarak antara garis dan teks Telkomsel

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFFF5E9EB),
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/logo_telkomsel.png',
                        width: 30,
                        height: 30,
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Telkomsel',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Daftar Informasi rate',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              Image.asset('assets/label_discount.png', width: 75),
            ],
          ),
          Divider(),
          SizedBox(height: 16),
          _buildRateItem('30.000 - 1.000.000', 0.82, false),
          _buildRateItem('30.000 - 10.000.000', 0.82, false),
          _buildRateItem('30.000 - 100.000.000', 0.82, true), // Item terakhir
          SizedBox(height: 5),
          Divider(),
          SizedBox(height: 15),
          CustomButton(text: 'Tukar Pulsa', onPressed: () {}),
        ],
      ),
    );
  }

  Widget _buildRateItem(String range, double rate, bool isLast) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                range,
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              Row(
                children: [
                  // Icon star abu-abu sebelum harga coret
                  Icon(Icons.star, color: Colors.grey, size: 16),
                  SizedBox(width: 4),
                  // Harga sebelum diskon (dicoret)
                  Text(
                    '0.8', // Nilai sebelum diskon
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      decoration: TextDecoration.lineThrough, // Efek coret
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ), // Jarak antara harga coret dan ikon bintang biru
                  // Icon star biru setelah diskon
                  Icon(Icons.star, color: Colors.blue, size: 16),
                  SizedBox(width: 4),
                  Text(rate.toString(), style: TextStyle(color: Colors.blue)),
                ],
              ),
            ],
          ),
        ),
        if (!isLast) SizedBox(height: 5),
        if (!isLast)
          DottedLine(
            dashColor: Colors.grey,
            lineThickness: 1,
            dashLength: 5,
            dashGapLength: 3,
          ),
        if (!isLast) SizedBox(height: 10),
      ],
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({required this.text, required this.onPressed, Key? key})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
