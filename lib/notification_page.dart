import 'package:flutter/material.dart';

class KotakMasukScreen extends StatefulWidget {
  @override
  _KotakMasukScreenState createState() => _KotakMasukScreenState();
}

class _KotakMasukScreenState extends State<KotakMasukScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool isSelecting = false; // Menandakan apakah mode pilih aktif
  Set<int> selectedMessages = {}; // Menyimpan indeks pesan yang dipilih

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  void _toggleSelectionMode() {
    setState(() {
      isSelecting = !isSelecting;
      if (!isSelecting) selectedMessages.clear();
    });
  }

  void _toggleMessageSelection(int index) {
    setState(() {
      if (selectedMessages.contains(index)) {
        selectedMessages.remove(index);
      } else {
        selectedMessages.add(index);
      }
    });
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 50,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Opsi Kotak Masuk",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              _buildOptionItem(
                icon: Icons.flag,
                text: "Tandai Pesan",
                color: Colors.blue,
                onTap: () {
                  Navigator.pop(context);
                  _toggleSelectionMode();
                  // Tambahkan fungsi tandai pesan di sini
                },
              ),
              _buildOptionItem(
                icon: Icons.delete,
                text: "Hapus Semua Pesan",
                color: Colors.red,
                onTap: () {
                  Navigator.pop(context);
                  _showDeleteConfirmation();
                  // Tambahkan fungsi hapus semua pesan di sini
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showDeleteConfirmation() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 60, // Panjang garis
                height: 4, // Ketebalan garis
                decoration: BoxDecoration(
                  color: Color(0xFFC5EAFA), // Warna garis samar
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              SizedBox(height: 8), // Jarak antara garis dan teks "Konfirmasi"
              Text(
                "Konfirmasi",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Divider(color: const Color(0xFFE9E9E9), thickness: 1, height: 1),
              SizedBox(height: 10),
              Image.asset('assets/icon_delete.png', width: 64, height: 64),
              SizedBox(height: 10),
              Text(
                "Hapus Pesan",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                "Anda yakin ingin menghapus pesan yang ada?",
                style: TextStyle(fontSize: 14, color: const Color(0xFF818186)),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 5),
              Divider(color: const Color(0xFFE9E9E9), thickness: 1, height: 1),
              SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0075FF),
                  minimumSize: Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  setState(() {
                    selectedMessages.clear();
                  });
                },
                child: Text(
                  "Yakin, Hapus Semua",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildOptionItem({
    required IconData icon,
    required String text,
    required Color color,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: color),
      tileColor: Colors.blue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Image.asset(
            'assets/icon_back_appbar.png',
            width: 30, // Sesuaikan ukuran jika diperlukan
            height: 30,
          ),
          onPressed: () => Navigator.pop(context),
        ),

        title: Text(
          "Kotak Masuk",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.black),
            onPressed: () => _showBottomSheet(context),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.blue,
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.grey,
          tabs: [Tab(text: "Order"), Tab(text: "Notifikasi")],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Tab Order
          OrderTab(
            isSelecting: isSelecting,
            selectedMessages: selectedMessages,
            onMessageTap: _toggleMessageSelection,
          ),

          NotifikasiTab(
            isSelecting: isSelecting,
            selectedMessages: selectedMessages,
            onMessageTap: _toggleMessageSelection,
          ),
        ],
      ),
    );
  }
}

class OrderTab extends StatelessWidget {
  final bool isSelecting;
  final Set<int> selectedMessages;
  final Function(int) onMessageTap;

  OrderTab({
    required this.isSelecting,
    required this.selectedMessages,
    required this.onMessageTap,
  });

  final List<Map<String, dynamic>> messages = [
    {
      "status": "Gagal",
      "statusColor": Colors.red,
      "message": "Transaksi anda #TP-TL-1022007 gagal diproses",
      "date": "12 June 2024, 09:42 AM",
      "unread": true,
    },
    {
      "status": "Sukses",
      "statusColor": Colors.blue,
      "message": "Transaksi anda #TP-TL-1022005 telah berhasil diproses",
      "date": "12 June 2024, 09:42 AM",
      "unread": true,
    },
    {
      "status": "Sukses",
      "statusColor": Colors.grey,
      "message": "Transaksi anda #TP-TL-1022006 telah berhasil",
      "date": "12 June 2024, 09:42 AM",
      "unread": false,
    },
    {
      "status": "Penting",
      "statusColor": Colors.orange,
      "message": "Segera kirim pulsa untuk transaksi #TP-TL-1022007",
      "date": "12 June 2024, 09:42 AM",
      "unread": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final item = messages[index];

        return GestureDetector(
          onTap: () {
            if (isSelecting) {
              onMessageTap(index);
            }
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
            ),
            child: Row(
              children: [
                if (isSelecting)
                  Checkbox(
                    value: selectedMessages.contains(index),
                    onChanged: (_) => onMessageTap(index),
                  ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item["status"],
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: item["statusColor"],
                        ),
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              item["message"],
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color:
                                    item["unread"] ? Colors.black : Colors.grey,
                              ),
                            ),
                          ),
                          if (item["unread"])
                            Icon(Icons.circle, color: Colors.blue, size: 8),
                        ],
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today,
                            size: 14,
                            color: Colors.grey,
                          ),
                          SizedBox(width: 4),
                          Text(
                            item["date"],
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class NotifikasiTab extends StatelessWidget {
  final bool isSelecting;
  final Set<int> selectedMessages;
  final Function(int) onMessageTap;

  NotifikasiTab({
    required this.isSelecting,
    required this.selectedMessages,
    required this.onMessageTap,
  });
  final List<Map<String, dynamic>> messages = [
    {
      "status": "Informasi",
      "statusColor": Colors.blue,
      "message": "Selamat Datang, pembuatan akun anda berhasil",
      "date": "12 June 2024, 09:42 AM",
      "unread": true,
    },
    {
      "status": "Promo Spekta",
      "statusColor": Colors.grey,
      "message": "Promo eksklusif PulsaIn sudah di mulai",
      "date": "12 June 2024, 09:42 AM",
      "unread": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final item = messages[index];

        return GestureDetector(
          onTap: () {
            if (isSelecting) {
              onMessageTap(index);
            }
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
            ),
            child: Row(
              children: [
                if (isSelecting)
                  Checkbox(
                    value: selectedMessages.contains(index),
                    onChanged: (_) => onMessageTap(index),
                  ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item["status"],
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: item["statusColor"],
                        ),
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              item["message"],
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color:
                                    item["unread"] ? Colors.black : Colors.grey,
                              ),
                            ),
                          ),
                          if (item["unread"])
                            Icon(Icons.circle, color: Colors.blue, size: 8),
                        ],
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today,
                            size: 14,
                            color: Colors.grey,
                          ),
                          SizedBox(width: 4),
                          Text(
                            item["date"],
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
