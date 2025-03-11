import 'package:flutter/material.dart';
import 'package:pulsain_task3/widgets/primary_button.dart';

class EditPhoneModal extends StatelessWidget {
  const EditPhoneModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController phoneController = TextEditingController(
      text: "82212345678",
    );

    return SingleChildScrollView(
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
                "Ubah Nomor Telepon",
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
            // Label Nomor Telepon
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Nomor Telepon",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),

            // Input Nomor Telepon dengan kode negara dalam container tersendiri
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFCFD7FF), width: 1.5),
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFFFBFBFF), // Warna latar belakang
              ),
              child: Row(
                children: [
                  // Container untuk kode negara
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    decoration: BoxDecoration(
                      color: Color(0xFFEFF1FF),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(
                          "+62",
                          style: TextStyle(
                            color: const Color(0xFF0075FF),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          color: const Color(0xFF0075FF),
                        ),
                      ],
                    ),
                  ),

                  // Input nomor telepon
                  Expanded(
                    child: TextField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: "82212345678",
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Divider(color: Color(0xFFE9E9E9)),
            // Tombol Simpan
            SizedBox(
              width: double.infinity,
              child: CustomButton(text: "Simpan", onPressed: () {}),
            ),
          ],
        ),
      ),
    );
  }
}
