import 'package:flutter/material.dart';

class AppBar1 extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBackPressed;

  const AppBar1({Key? key, required this.title, this.onBackPressed})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Color(0xF0F8FF), // Warna latar belakang AppBar (biru muda)
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(
                top: 15,
              ), // Tambahkan space di atas elemen
              child: Row(
                children: [
                  // Tombol Back dengan aksi yang bisa diubah
                  GestureDetector(
                    onTap: onBackPressed ?? () => Navigator.pop(context),
                    child: Image.asset(
                      'assets/icon_back_appbar.png', // Ganti dengan path ikon panahmu
                      width: 35,
                      height: 35,
                    ),
                  ),
                  SizedBox(width: 12),

                  // Judul AppBar yang bisa diubah
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),

                  // Ikon Notifikasi tanpa Container tambahan
                  Image.asset(
                    'assets/icon_notification.png', // Ganti dengan path ikon notifikasimu
                    width: 30,
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        // Divider abu-abu samar di bawah AppBar
        Divider(thickness: 1, color: Colors.grey.shade300, height: 1),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 16); // Tambahkan ketinggian
}
