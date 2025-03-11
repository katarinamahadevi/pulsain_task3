import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pulsain_task3/widgets/primary_appbar.dart';
import 'package:pulsain_task3/widgets/secondary_button.dart';
import 'list_bank_page.dart'; // Import halaman untuk memilih bank
import 'package:pulsain_task3/widgets/primary_button.dart';

class ChangeBankPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFF5F7),
      appBar: PrimaryAppbar(
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
                  MaterialPageRoute(builder: (context) => ListBankPage()),
                );
              },
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFFBFBFF),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xFFCFD7FF)),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1FDFF),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: SvgPicture.asset(
                        'assets/logo_bca.svg',
                        width: 20,
                        height: 20,
                      ),
                    ),
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
                        color: const Color(0xFFdcecfc),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        "Gratis",
                        style: TextStyle(color: const Color(0xFF0075FF)),
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
                fillColor: const Color(
                  0xFFFBFBFF,
                ), // Warna biru muda sebagai latar belakang
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: const Color(
                      0xFFCFD7FF,
                    ), // Warna biru tua untuk border saat tidak fokus
                    width: 1.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.blue, // Warna border saat fokus
                    width: 1.0,
                  ),
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
                fillColor: const Color(
                  0xFFFBFBFF,
                ), // Warna oranye muda sebagai latar belakang
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: const Color(
                      0xFFCFD7FF,
                    ), // Warna oranye tua untuk border saat tidak fokus
                    width: 1.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.orange, // Warna border saat fokus
                    width: 1.0,
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 14,
                ),
              ),
              controller: TextEditingController(text: "Johnatan Ludwig"),
            ),

            SizedBox(height: 200),
            SecondaryButton(text: "Hapus Rekening", onPressed: () {}),
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
