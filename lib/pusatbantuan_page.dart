import 'package:flutter/material.dart';
import 'package:pulsain_task3/widgets/appBar1.dart';

class PusatbantuanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFF5F7),
      appBar: AppBar1(
        title: "Pusat Bantuan",
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          // Menggunakan Stack agar Positioned bisa bekerja
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade100,
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        "assets/icon_chat.png",
                        height: 30,
                        width: 30,
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hai, Rebecca 👋",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Punya pertanyaan atau keluhan untuk disampaikan?",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/bg_pusatbantuan.png"),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Yuk, sampaikan langsung ke CS kami melalui berbagai pilihan di bawah",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 12),
                      ContactItem(
                        iconPath: "assets/icon_email2.png",
                        title: "Email",
                        content: "customercare@pulsain.com",
                      ),
                      SizedBox(height: 8),
                      ContactItem(
                        iconPath: "assets/icon_instagram.png",
                        title: "Instagram",
                        content: "@pulsain",
                      ),
                      SizedBox(height: 8),
                      ContactItem(
                        iconPath: "assets/icon_whatsapp.png",
                        title: "Whatsapp",
                        content: "0821-1111-1111",
                      ),
                      SizedBox(height: 8),
                      ContactItem(
                        iconPath: "assets/icon_website.png",
                        title: "Website",
                        content: "www.pulsain.com",
                      ),
                      Divider(color: const Color(0x1FF3D95FD)),
                      SizedBox(height: 70),
                    ],
                  ),
                ),
              ],
            ),

            // Ilustrasi orang di sebelah kanan bawah
            Positioned(
              bottom: -20,
              right: -5,
              child: Image.asset("assets/illust_people.png", width: 250),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactItem extends StatelessWidget {
  final String iconPath;
  final String title;
  final String content;

  ContactItem({
    required this.iconPath,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            height: 70,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Image.asset(iconPath, width: 40, height: 40),
          ),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                content,
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
