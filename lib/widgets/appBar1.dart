import 'package:flutter/material.dart';
import 'package:pulsain_task3/homepage/notification_page.dart';

class AppBar1 extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBackPressed;
  final VoidCallback? onNotificationPressed;

  const AppBar1({
    Key? key,
    required this.title,
    this.onBackPressed,
    this.onNotificationPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Color(0xF0F8FF), // Warna latar belakang AppBar (biru muda)
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(top: 15),
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

                  // Judul AppBar
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

                  // Ikon Notifikasi dengan navigasi
                  GestureDetector(
                    onTap:
                        onNotificationPressed ??
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => KotakMasukScreen(),
                            ),
                          );
                        },
                    child: Image.asset(
                      'assets/icon_notification.png', // Ganti dengan path ikon notifikasi
                      width: 30,
                      height: 30,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Divider(thickness: 1, color: Colors.grey.shade300, height: 1),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 16);
}
