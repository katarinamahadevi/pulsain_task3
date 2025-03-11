import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:pulsain_task3/models/rate_modal.dart';
import 'package:pulsain_task3/homepage/notification_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentPage = 0;
  final PageController _pageController = PageController(viewportFraction: 0.9);

  List<String> promoImages = [
    'assets/banner_card1.png',
    'assets/banner_card2.png',
    'assets/banner_card3.png',
  ];

  List<Map<String, String>> providerList = [
    {'name': 'Telkomsel', 'image': 'assets/logo_telkomsel.png'},
    {'name': 'Axis', 'image': 'assets/logo_axis.png'},
    {'name': 'XL', 'image': 'assets/logo_xl.png'},
    {'name': 'Indosat', 'image': 'assets/logo_indosat.png'},
    {'name': 'Tri', 'image': 'assets/logo_tri.png'},
    {'name': 'Smartfren', 'image': 'assets/logo_smartfren.png'},
  ];

  void _showModal(BuildContext context, String provider) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => RateModal(), // Panggil modal dengan provider
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFF5F7),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFEFF5F7),
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/profile_user.png'),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Garis biru di atas container putih (menempel)
                  Container(
                    width: 40, // Lebar garis
                    height: 5, // Ketebalan garis
                    decoration: BoxDecoration(
                      color: const Color(0xFF0075FF), // Warna garis
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),

                  // Container putih dengan teks
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.access_time, size: 16, color: Colors.blue),
                        SizedBox(width: 5),
                        Text(
                          "Online",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          "24 Jam Kerja",
                          style: TextStyle(color: Colors.blue, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => KotakMasukScreen()),
                );
              },
              child: Image.asset(
                'assets/icon_notification.png',
                width: 30,
                height: 30,
              ),
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(thickness: 1, color: Colors.grey.shade300, height: 1),
            SizedBox(height: 15),
            Text(
              "Hai, Rebecca 👋",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              "Selamat Datang di Pulsaln.",
              style: TextStyle(color: const Color(0xFFBDBDBD), fontSize: 16),
            ),
            SizedBox(height: 5),
            // **Banner Promo**
            SizedBox(
              height: 150,
              child: PageView.builder(
                controller: _pageController,
                itemCount: promoImages.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: AssetImage(promoImages[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 8),
            // **Indicator PageView**
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(promoImages.length, (index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 3),
                  width: _currentPage == index ? 12 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color:
                        _currentPage == index
                            ? Colors.blue
                            : Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(5),
                  ),
                );
              }),
            ),
            SizedBox(height: 20),

            // **Peringatan**
            // **Peringatan**
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Ikon warning langsung tanpa background lingkaran
                  Image.asset(
                    'assets/icon_warning.png', // Sesuaikan dengan path asset kamu
                    width: 30,
                    height: 30,
                  ),
                  SizedBox(width: 12),

                  // Teks "Penting!" dan deskripsi
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Penting!",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 2), // Spasi kecil
                        RichText(
                          text: TextSpan(
                            text: "Patuhi ",
                            style: TextStyle(fontSize: 14, color: Colors.black),
                            children: [
                              TextSpan(
                                text: "syarat dan ketentuan",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  decoration:
                                      TextDecoration.underline, // Garis bawah
                                ),
                              ),
                              TextSpan(
                                text: " yang berlaku",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Icon panah
                  Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: DottedLine(dashColor: Colors.grey.shade300),
            ),
            // **Pilihan Convert Pulsa**
            Text(
              "Pilihan Convert Pulsa",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            SizedBox(
              height:
                  (providerList.length / 3).ceil() *
                  280, // Sesuaikan tinggi agar cukup untuk semua item
              child: GridView.builder(
                physics:
                    NeverScrollableScrollPhysics(), // Mencegah bentrok dengan SingleChildScrollView
                shrinkWrap: true,
                itemCount: providerList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.7,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap:
                        () => _showModal(context, providerList[index]['name']!),
                    child: _buildPulsaCard(
                      providerList[index]['name']!,
                      providerList[index]['image']!,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPulsaCard(String provider, String imagePath) {
    bool isNoPromoProvider = provider == 'Tri' || provider == 'Smartfren';

    return Stack(
      clipBehavior: Clip.none, // Memastikan label promo tetap terlihat
      children: [
        // Kartu utama
        Container(
          height: 200,
          width: 130,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ), // Beri jarak agar gambar provider tidak tergeser
              // 🔹 Container berbentuk lingkaran untuk membungkus logo pulsa
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFFF9F8F8), // Background lingkaran
                ),
                child: Center(
                  child: Image.asset(imagePath, height: 30), // Logo provider
                ),
              ),

              SizedBox(height: 8),
              Text(provider, style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 4),

              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: DottedLine(dashColor: Colors.grey.shade300),
              ),

              // Bagian harga & diskon
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (!isNoPromoProvider)
                    Text(
                      "0.8",
                      style: TextStyle(
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  if (!isNoPromoProvider) SizedBox(width: 15),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.star, size: 14, color: Colors.white),
                        SizedBox(width: 4),
                        Text("0.9", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        // Label promo (diposisikan di luar container)
        if (!isNoPromoProvider)
          Positioned(
            top: -8,
            left: 25,
            child: Image.asset('assets/label_discount.png', width: 70),
          ),
      ],
    );
  }
}
