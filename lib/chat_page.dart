import 'package:flutter/material.dart';
import 'package:pulsain_task3/widgets/appBar3.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1FDFF),
      appBar: AppBar3(title: "Cs 1"), // Gunakan AppBar3
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(12.0),
              children: [
                _buildTimestamp(
                  "Wed, 8:21 AM",
                  isCenter: true,
                ), // Timestamp utama tetap di tengah

                _buildMessageBubble(
                  "This is a sample big message with a longer text paragraph",
                  false,
                  const Color(0xFFF6F1EB),
                  Colors.black,
                  context,
                ),
                _buildTimestamp(
                  "10:30 AM",
                  isSender: false,
                ), // Timestamp penerima

                _buildMessageBubble(
                  "This is a sample message for a chat",
                  true,
                  Colors.blue,
                  Colors.white,
                  context,
                ),
                _buildTimestamp(
                  "10:30 AM",
                  isSender: true,
                ), // Timestamp pengirim

                _buildImageBubble(
                  context,
                  "assets/struk_chat.png",
                  "This is a sample image",
                  false, // False berarti pesan dari penerima
                ),

                _buildMessageBubble(
                  "This is a sample big message with a longer text paragraph",
                  true,
                  Colors.blue,
                  Colors.white,
                  context,
                ),
                _buildTimestamp(
                  "10:30 AM",
                  isSender: true,
                ), // Timestamp pengirim
              ],
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(
    String message,
    bool isSender,
    Color bgColor,
    Color textColor,
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5.0,
        vertical: 4.0,
      ), // Tambahkan padding kiri & kanan
      child: Align(
        alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          padding: const EdgeInsets.all(12.0),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.75,
          ),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Text(
            message,
            style: TextStyle(color: textColor),
            softWrap: true,
          ),
        ),
      ),
    );
  }

  Widget _buildTimestamp(
    String time, {
    bool isCenter = false,
    bool isSender = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
      child: Align(
        alignment:
            isCenter
                ? Alignment.center
                : (isSender
                    ? Alignment.centerRight
                    : Alignment.centerLeft), // Posisi timestamp
        child: Text(
          time,
          style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
        ),
      ),
    );
  }

  Widget _buildImageBubble(
    BuildContext context,
    String assetPath,
    String message,
    bool isSender,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5.0,
        vertical: 8.0,
      ), // Tambahkan padding kiri & kanan
      child: Align(
        alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          padding: const EdgeInsets.all(12.0),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.75,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFFF6F1EB),
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(assetPath, width: 200),
              ),
              const SizedBox(height: 8.0),
              Text(
                message,
                style: TextStyle(color: Colors.black),
                softWrap: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // Background putih
        border: Border(
          top: BorderSide(
            color: const Color(0xFFEDEDED),
            width: 1.0,
          ), // Garis atas samar
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
      child: Row(
        children: [
          // Icon Attachment
          IconButton(
            icon: const Icon(Icons.attach_file, color: Color(0xFF8E8F92)),
            onPressed: () {},
          ),

          // Container untuk TextField
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 5.0,
              ),
              decoration: BoxDecoration(
                color: Color(0xFFF7F7FC), // Warna ungu pastel
                borderRadius: BorderRadius.circular(4.0),
              ),
              constraints: BoxConstraints(
                minHeight: 40, // Atur tinggi minimum
                maxHeight:
                    150, // Batasi tinggi agar tidak terlalu besar saat banyak teks
              ),
              child: TextField(
                maxLines: null, // Agar bisa auto-expand saat teks bertambah
                decoration: InputDecoration(
                  hintText: "Good mor",
                  hintStyle: TextStyle(color: const Color(0xFF0F1828)),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
                ),
              ),
            ),
          ),

          // Icon Send
          IconButton(
            icon: const Icon(Icons.send, color: Color(0xFF3980FD)),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
