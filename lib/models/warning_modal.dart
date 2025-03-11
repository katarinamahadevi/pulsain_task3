import 'package:flutter/material.dart';
import 'package:pulsain_task3/tukarpulsapage/tukarpulsa3_page.dart';

class WarningModal extends StatelessWidget {
  const WarningModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.blue.shade100,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Peringatan",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Divider(color: const Color(0xFFE9E9E9)),
          const SizedBox(height: 16),
          Row(
            children: [
              const Icon(Icons.warning, color: Colors.orange),
              const SizedBox(width: 10),
              Expanded(
                child: const Text(
                  "Pastikan pulsa anda 34.500 atau lebih untuk bisa convert dengan nominal 30.000",
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Divider(color: const Color(0xFFE9E9E9)),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFF0075FF)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        5,
                      ), // Atur radius di sini
                    ),
                  ),
                  child: const Text(
                    "Batalkan",
                    style: TextStyle(color: Color(0xFF0075FF)),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TukarPulsa3()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0075FF),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        5,
                      ), // Atur radius di sini
                    ),
                  ),
                  child: const Text("Ya"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
