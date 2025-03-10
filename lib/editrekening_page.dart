import 'package:flutter/material.dart';
import 'package:pulsain_task3/widgets/appBar1.dart';
import 'package:pulsain_task3/widgets/button2.dart';
import 'daftarbank_page.dart'; // Import halaman untuk memilih bank
import 'package:pulsain_task3/widgets/button.dart';

class EditRekeningPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFF5F7),
      appBar: AppBar1(
        title: "Ubah Rekening", // Judul bisa diubah
        onBackPressed: () {
          Navigator.pop(context); // Navigasi kembali
        },
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Bank/Dompet Digital",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DaftarbankPage()),
                );
              },
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Row(
                  children: [
                    Image.asset('assets/logo_bca.png', width: 40, height: 40),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        "Bank Central Asia",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        "Gratis",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.blueAccent,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Nomor Rekening",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 14,
                ),
              ),
              controller: TextEditingController(text: "7712678199"),
            ),
            SizedBox(height: 16),
            Text(
              "Nama Pemilik Rekening",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 14,
                ),
              ),
              controller: TextEditingController(text: "Johnatan Ludwig"),
            ),
            SizedBox(height: 200),
            Button2(text: "Hapus Rekening", onPressed: () {}),
            SizedBox(height: 10),
            CustomButton(
              text: "Simpan Perubahan",
              onPressed: () {
                // Tambahkan aksi saat tombol ditekan
                print("Rekening disimpan!");
              },
            ),
          ],
        ),
      ),
    );
  }
}
