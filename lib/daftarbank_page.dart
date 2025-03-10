import 'package:flutter/material.dart';
import 'package:pulsain_task3/widgets/appBar1.dart';

class DaftarbankPage extends StatelessWidget {
  final List<Map<String, String>> bankList = [
    {"name": "Bank Central Asia", "logo": "assets/logo_bca.png"},
    {"name": "Bank Negara Indonesia", "logo": "assets/logo_bni.png"},
    {"name": "Bank Rakyat Indonesia", "logo": "assets/logo_bri.png"},
    {"name": "Mandiri", "logo": "assets/logo_mandiri.png"},
    {"name": "Dana", "logo": "assets/logo_dana.png"},
    {"name": "Gopay", "logo": "assets/logo_gopay.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFF5F7),
      appBar: AppBar1(
        title: "Daftar Bank", // Judul bisa diubah
        onBackPressed: () {
          Navigator.pop(context); // Navigasi kembali
        },
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: bankList.length,
        itemBuilder: (context, index) {
          return _buildBankItem(context, bankList[index]);
        },
      ),
    );
  }

  Widget _buildBankItem(BuildContext context, Map<String, String> bank) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context, bank["name"]);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 12),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1FDFF),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Image.asset(bank["logo"]!, fit: BoxFit.contain),
                ),
                SizedBox(width: 12),
                Text(
                  bank["name"]!,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFFdeebfd),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                "Gratis",
                style: TextStyle(
                  color: const Color(0xFF0075FF),
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
