import 'package:flutter/material.dart';

class AppBar3 extends StatelessWidget implements PreferredSizeWidget {
  //page chat
  final String title;
  final VoidCallback? onBack;

  const AppBar3({Key? key, required this.title, this.onBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Image.asset('assets/icon_back_appbar.png', width: 30, height: 30),
        onPressed: onBack ?? () => Navigator.pop(context),
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.black, fontSize: 16),
      ),
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      elevation: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Color(0xFFDAFAE0),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: const [
                Icon(Icons.check_circle, color: Colors.green, size: 16),
                SizedBox(width: 4),
                Text(
                  "Online",
                  style: TextStyle(color: Colors.green, fontSize: 14),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
