import 'package:flutter/material.dart';
import 'package:pulsain_task3/modal/rate_modal.dart';

class EditEmailModal extends StatelessWidget {
  const EditEmailModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController(
      text: "john@gmail.com",
    );

    return SingleChildScrollView(
      // ✅ Tambahkan ini agar bisa discroll jika overflow
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Garis kecil di atas modal
            Container(
              width: 50,
              height: 6,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
            ),

            // Judul
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                "Ubah Email",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10),
            Divider(
              color: const Color(0xFFE9E9E9), // Warna garis bisa disesuaikan
              thickness: 1, // Ketebalan garis
              height: 1, // Jarak antar elemen
            ),
            SizedBox(height: 20),
            // Label Email
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Email",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),

            // Input Email
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                filled: true,
                fillColor: const Color(0xFFFBFBFF), // Warna background input
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Color(0xFFCFD7FF),
                    width: 1.5,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Color(0xFFCFD7FF),
                    width: 1.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.blue, width: 2),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Divider(color: Color(0xFFE9E9E9)),

            // Tombol Simpan
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                text: "Simpan",
                onPressed: () {
                  Navigator.pop(context); // Tutup modal
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
