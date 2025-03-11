import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';

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
                width: 60,
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
              Divider(),
              SizedBox(height: 5),
              _buildOptionItem(
                iconPath: 'assets/icon_flag.png',
                text: "Tandai Pesan",
                color: Colors.blue,
                circleColor: const Color(
                  0xFF0075FF,
                ), // Warna latar belakang lingkaran
                iconColor: Colors.white, // Warna ikon
                onTap: () {
                  Navigator.pop(context);
                  _toggleSelectionMode();
                },
              ),

              _buildOptionItem(
                iconPath: 'assets/icon_delete.png',
                text: "Hapus Semua Pesan",
                color: Colors.red,
                circleColor: const Color(
                  0xFFFF6565,
                ), // Warna latar belakang lingkaran
                iconColor: Colors.white, // Warna ikon
                onTap: () {
                  Navigator.pop(context);
                  _showDeleteConfirmation(context, () {
                    // Aksi yang dilakukan saat tombol "Yakin, Hapus Semua" ditekan
                    setState(() {
                      selectedMessages
                          .clear(); // Contoh: Menghapus semua pesan yang dipilih
                    });
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showDeleteConfirmation(BuildContext context, Function onDelete) {
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
              // Garis kecil biru di atas teks "Konfirmasi"
              Container(
                width: 60, // Sesuaikan lebar dengan desain
                height: 5, // Sesuaikan ketebalan garis
                decoration: BoxDecoration(
                  color: const Color(0xFFC5EAFA), // Warna biru muda
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(height: 10), // Jarak ke teks "Konfirmasi"
              Text(
                "Konfirmasi",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Divider(color: const Color(0xFFE9E9E9)),
              SizedBox(height: 16),
              SvgPicture.asset(
                'assets/icon_delete2.svg',
                width: 64,
                height: 64,
              ),
              SizedBox(height: 16),
              Text(
                "Hapus Pesan",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "Anda yakin ingin menghapus pesan yang ada?",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
              SizedBox(height: 16),
              Divider(height: 1, thickness: 1, color: const Color(0xFFE9E9E9)),
              SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0075FF),
                    padding: EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    onDelete();
                  },
                  child: Text(
                    "Yakin, Hapus Semua",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }

  Widget _buildOptionItem({
    required String iconPath,
    required String text,
    required Color color,
    required VoidCallback onTap,
    Color circleColor = Colors.grey,
    Color iconColor = Colors.white,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFFEDFCFF), // Background warna bisa diubah
          borderRadius: BorderRadius.circular(9),
        ),
        child: Row(
          children: [
            Image.asset(iconPath, width: 24, height: 24, color: color),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                text,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                color: circleColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.keyboard_arrow_right,
                size: 15,
                color: iconColor,
              ),
            ),
          ],
        ),
      ),
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
            padding: EdgeInsets.only(right: 30),
            icon: Icon(Icons.more_vert, color: Colors.black),
            onPressed: () => _showBottomSheet(context),
          ),
        ],
        bottom: TabBar(
          dividerColor: const Color(0xFF95b9f9),
          controller: _tabController,
          indicatorColor: Color(0xff0075FF),
          indicatorSize: TabBarIndicatorSize.tab,
          labelColor: const Color(0xFF0075FF),
          unselectedLabelColor: const Color(0xFF95b9f9),
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
      "statusColor": Colors.grey,
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

        return Slidable(
          key: ValueKey(index),
          startActionPane: ActionPane(
            extentRatio: 0.1,
            // Geser ke kiri
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: (context) {
                  print("Hapus pesan ${item["message"]}");
                },
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFFFF6565),
                icon: Icons.delete,
              ),
            ],
          ),
          child: GestureDetector(
            onTap: () {
              if (isSelecting) {
                onMessageTap(index);
              }
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: const Color(0xFFE9E8E8)),
                ),
              ),
              child: Row(
                children: [
                  if (isSelecting)
                    GestureDetector(
                      onTap:
                          () =>
                              onMessageTap(index), // Memastikan perubahan state
                      child: Image.asset(
                        selectedMessages.contains(index)
                            ? 'assets/icon_checkbox.png' // Icon saat tercentang
                            : 'assets/icon_checkbox2.png', // Icon saat belum dipilih
                        width: 24,
                        height: 24,
                      ),
                    ),
                  SizedBox(width: 10),

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
                        Text(
                          item["message"],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: item["unread"] ? Colors.black : Colors.grey,
                          ),
                        ),
                        Text(
                          item["date"],
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  if (item["unread"])
                    Icon(Icons.circle, color: Colors.blue, size: 8),
                ],
              ),
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

        return Slidable(
          key: ValueKey(index),
          startActionPane: ActionPane(
            extentRatio: 0.1,
            // Geser ke kiri
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: (context) {
                  print("Hapus pesan ${item["message"]}");
                },
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFFFF6565),
                icon: Icons.delete,
              ),
            ],
          ),
          child: GestureDetector(
            onTap: () {
              if (isSelecting) {
                onMessageTap(index);
              }
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: const Color(0xFFE9E8E8)),
                ),
              ),
              child: Row(
                children: [
                  if (isSelecting)
                    GestureDetector(
                      onTap:
                          () =>
                              onMessageTap(index), // Memastikan perubahan state
                      child: Image.asset(
                        selectedMessages.contains(index)
                            ? 'assets/icon_checkbox.png' // Icon saat tercentang
                            : 'assets/icon_checkbox2.png', // Icon saat belum dipilih
                        width: 24,
                        height: 24,
                      ),
                    ),
                  SizedBox(width: 10),

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
                        Text(
                          item["message"],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: item["unread"] ? Colors.black : Colors.grey,
                          ),
                        ),
                        Text(
                          item["date"],
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  if (item["unread"])
                    Icon(Icons.circle, color: Colors.blue, size: 8),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
