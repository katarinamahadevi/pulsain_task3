import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:pulsain_task3/widgets/button.dart';

class EditProfileModal extends StatelessWidget {
  const EditProfileModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700, // Ukuran modal 629px
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        color: Colors.white,
      ),
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
          SizedBox(height: 10),

          // Judul
          Text(
            "Ubah Foto Profil",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),

          // Divider penuh
          Divider(
            color: const Color(0xFFE9E9E9), // Warna garis bisa disesuaikan
            thickness: 1, // Ketebalan garis
            height: 1, // Jarak antar elemen
          ),
          SizedBox(height: 20),

          // Kotak unggah foto
          DottedBorder(
            color: Colors.blue,
            strokeWidth: 1.5,
            dashPattern: [6, 3],
            borderType: BorderType.RRect,
            radius: Radius.circular(12),
            child: Container(
              width: double.infinity,
              height: 200,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF1FDFF),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icon_upload.png', // Sesuaikan dengan asset-mu
                    width: 60,
                    height: 60,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Unggah Foto",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Spesifikasi gambar dengan rasio gambar\n1:1 dan maksimum 5 Megabyte",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),

          // Progress bar upload
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFF1FDFF),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFFCFF8FF)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Uploading...",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),

                // Progress bar & teks
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "15% • 30 seconds remaining",
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                    ),
                    Icon(Icons.pause_circle, color: Colors.red),
                    SizedBox(width: 5),
                    Icon(Icons.cancel, color: const Color(0xFF0075FF)),
                  ],
                ),
                SizedBox(height: 8),

                // Progress bar di bawah teks
                LinearProgressIndicator(
                  borderRadius: BorderRadius.circular(10),
                  value: 0.15,
                  backgroundColor: const Color(0xFFFAFAFA),
                  color: Colors.blue,
                  minHeight: 8,
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Divider(
            color: Color(0xFFE9E9E9),
          ), // Mendorong tombol "Simpan" ke bawah
          // Tombol Simpan
          SizedBox(
            width: double.infinity,
            child: CustomButton(text: "Simpan", onPressed: () {}),
          ),
          SizedBox(height: 0),
        ],
      ),
    );
  }
}
