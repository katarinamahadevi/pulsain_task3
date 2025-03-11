import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:pulsain_task3/activity_page/success_activity_page.dart';
import 'package:pulsain_task3/activity_page/failed_activity_page.dart';
import 'package:pulsain_task3/activity_page/waiting_activity_page.dart';
import 'package:pulsain_task3/home_page/inbox_page.dart';
import 'package:pulsain_task3/widgets/navbar.dart';

class ActivityPage extends StatelessWidget {
  final Color backgroundColor;

  ActivityPage({this.backgroundColor = const Color(0xFFEFF5F7)});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          actionsPadding: EdgeInsets.symmetric(horizontal: 16),
          backgroundColor: backgroundColor,
          elevation: 0,
          leading: IconButton(
            icon: Image.asset(
              'assets/icon_back_appbar.png',
              width: 35,
              height: 35,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Navbar()),
              );
            },
          ),
          title: Text(
            'Aktivitas',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              icon: Image.asset(
                'assets/icon_notification.png',
                width: 30,
                height: 30,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InboxPage()),
                );
              },
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(48),
            child: Column(
              children: [
                Container(height: 1, color: const Color(0xFFE0E0E0)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TabBar(
                    dividerColor: const Color(0xFF95b9f9),
                    indicatorColor: Color(0xff0075FF),
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelColor: const Color(0xFF0075FF),
                    unselectedLabelColor: const Color(0xFF95b9f9),
                    tabs: [Tab(text: "Proses"), Tab(text: "Berhasil")],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Container(
          color: backgroundColor,
          child: TabBarView(
            children: [TransactionList(), SuccessTransactionList()],
          ),
        ),
      ),
    );
  }
}

class TransactionList extends StatelessWidget {
  final List<Map<String, String>> transactions = [
    {
      'id': '#TP-TL-1022007',
      'date': '29 Februari 2024',
      'provider': 'Telkomsel',
      'nominal': 'Rp 100.000',
      'converted': 'Rp 73.000',
      'logo': 'assets/logo_telkomsel.png',
    },
    {
      'id': '#TP-TL-1022007',
      'date': '29 Februari 2024',
      'provider': 'Axis',
      'nominal': 'Rp 100.000',
      'converted': 'Rp 73.000',
      'logo': 'assets/logo_axis.png',
    },
    {
      'id': '#TP-TL-1022007',
      'date': '29 Februari 2024',
      'provider': 'XL',
      'nominal': 'Rp 100.000',
      'converted': 'Rp 73.000',
      'logo': 'assets/logo_xl.png',
    },
    {
      'id': '#TP-TL-1022007',
      'date': '29 Februari 2024',
      'provider': 'Indosat',
      'nominal': 'Rp 100.000',
      'converted': 'Rp 73.000',
      'logo': 'assets/logo_indosat.png',
    },
    {
      'id': '#TP-TL-1022007',
      'date': '29 Februari 2024',
      'provider': 'Tri',
      'nominal': 'Rp 100.000',
      'converted': 'Rp 73.000',
      'logo': 'assets/logo_tri.png',
    },
  ];
  final Map<String, Color> providerColors = {
    'Telkomsel': const Color(0xFFF5E9EB),
    'Axis': const Color(0xFFE4EBFF),
    'XL': const Color(0xFFE3F7F6),
    'Indosat': const Color(0xFFF6F1EB),
    'Tri': const Color(0xFFF5E9EB),
  };

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 120),
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        final transaction = transactions[index];

        return GestureDetector(
          onTap: () {
            if (transaction['provider'] == 'Axis') {
              // Navigasi ke halaman gagal jika provider adalah Axis
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => FailedActivityPage(), // Pastikan halaman ini ada
                ),
              );
            } else {
              // Navigasi default ke halaman menunggu
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WaitingActivityPage()),
              );
            }
          },
          child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 0,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color:
                              providerColors[transaction['provider']] ??
                              Colors
                                  .grey
                                  .shade200, // Default warna jika tidak ada
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            transaction['logo']!,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),

                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            transaction['id']!,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            transaction['date']!,
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      Spacer(),
                      Chip(
                        label: Row(
                          children: [
                            Icon(Icons.schedule, color: Colors.blue, size: 15),
                            SizedBox(width: 5),
                            Text(
                              'Diproses',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        backgroundColor: Colors.blue.withOpacity(0.1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        side: BorderSide(color: Colors.transparent),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  DottedLine(
                    dashColor: Colors.grey.shade400,
                    lineThickness: 1,
                    dashLength: 5,
                    dashGapLength: 3,
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Nominal Pulsa'),
                          SizedBox(height: 5),
                          Text('Hasil Konversi'),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            transaction['nominal']!,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text(
                            transaction['converted']!,
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class SuccessTransactionList extends StatelessWidget {
  final List<Map<String, String>> transactions = [
    {
      'id': '#TP-TL-1022007',
      'date': '29 Februari 2024',
      'provider': 'XL',
      'nominal': 'Rp 100.000',
      'converted': 'Rp 73.000',
      'platform': 'Aplikasi',
      'status': 'Selesai',
      'logo': 'assets/logo_xl.png',
    },
    {
      'id': '#TP-TL-1022007',
      'date': '29 Februari 2024',
      'provider': 'Axis',
      'nominal': 'Rp 100.000',
      'converted': 'Rp 73.000',
      'platform': 'Whatsapp',
      'status': 'In Whatsapp',
      'logo': 'assets/logo_axis.png',
    },
    {
      'id': '#TP-TL-1022007',
      'date': '29 Februari 2024',
      'provider': 'Indosat',
      'nominal': 'Rp 100.000',
      'converted': 'Rp 73.000',
      'platform': 'Whatsapp',
      'status': 'Gagal',
      'logo': 'assets/logo_indosat.png',
    },
  ];
  final Map<String, Color> providerColors = {
    'Telkomsel': const Color(0xFFF5E9EB),
    'Axis': const Color(0xFFE4EBFF),
    'XL': const Color(0xFFE3F7F6),
    'Indosat': const Color(0xFFF6F1EB),
    'Tri': const Color(0xFFF5E9EB),
  };

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 120),
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        final transaction = transactions[index];

        // Cek apakah status transaksi "Gagal"
        bool isFailed = transaction['status'] == 'Gagal';

        // Warna status berdasarkan kondisi
        Color statusColor = isFailed ? const Color(0xFFF44336) : Colors.green;
        Color statusBackground =
            isFailed ? Color(0xFFFFE5E5) : Color(0xFFDFF6DD);
        IconData statusIcon = isFailed ? Icons.cancel : Icons.check_circle;

        return GestureDetector(
          onTap: () {
            // Navigasi ke halaman detail saat item diklik
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SuccessActivityPage()),
            );
          },

          child: Container(
            margin: EdgeInsets.only(bottom: 10),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color:
                            providerColors[transaction['provider']] ??
                            Colors
                                .grey
                                .shade200, // Default warna jika tidak ada
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          transaction['logo']!,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          transaction['id']!,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          transaction['date']!,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Spacer(),
                    Chip(
                      label: Row(
                        children: [
                          Icon(statusIcon, color: statusColor, size: 15),
                          SizedBox(width: 5),
                          Text(
                            transaction['status']!,
                            style: TextStyle(color: statusColor, fontSize: 12),
                          ),
                        ],
                      ),
                      backgroundColor: statusBackground,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: BorderSide(color: Colors.transparent),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 10),
                DottedLine(
                  dashColor: Colors.grey,
                  lineThickness: 1,
                  dashLength: 5,
                  dashGapLength: 3,
                ),
                SizedBox(height: 10),

                // Nominal dan Konversi
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Nominal Pulsa'),
                        SizedBox(height: 5),
                        Text('Hasil Konversi'),
                        SizedBox(height: 5),
                        Text('Platform'),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          transaction['nominal']!,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text(
                          transaction['converted']!,
                          style: TextStyle(
                            color: statusColor, // Warna berubah sesuai status
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Chip(
                          label: Text(
                            transaction['platform']!,
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                          backgroundColor:
                              transaction['platform'] == 'Aplikasi'
                                  ? const Color(0xFF0075FF)
                                  : const Color(0xFF05DC31),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                            side: BorderSide(color: Colors.transparent),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
