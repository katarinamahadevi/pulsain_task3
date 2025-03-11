import 'package:flutter/material.dart';
import 'package:pulsain_task3/models/editemail_modal.dart';
import 'package:pulsain_task3/models/editname_modal.dart';
import 'package:pulsain_task3/models/editphone_modal.dart';
import 'package:pulsain_task3/models/editprofile_modal.dart';
import 'package:pulsain_task3/profilepage/pusatbantuan_page.dart';
import 'package:pulsain_task3/widgets/appBar1.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFF5F7),
      appBar: AppBar1(
        title: "Profile", // Judul bisa diubah
        onBackPressed: () {
          Navigator.pop(context); // Navigasi kembali
        },
      ),
      body: SingleChildScrollView(
        physics:
            ScrollPhysics(), // Tambahkan physics agar scrolling lebih natural
        child: Container(
          // Bungkus Column dengan Container agar tidak menyebabkan overflow
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage(
                            'assets/profile_user.png',
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20),
                                  ),
                                ),
                                builder: (context) => EditProfileModal(),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF1FDFF),
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(
                                'assets/icon_editprofil.png',
                                width: 30,
                                height: 30,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10), // Spasi antara avatar dan teks
                    Text(
                      "Johnatan Ludwig",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "john@email.com",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              ProfileOption(
                icon: 'assets/icon_profile2.png',
                title: 'Nama Lengkap',
                subtitle: 'Johnatan Ludwig',
                backgroundColor: const Color(0xFFE5ECFF), // Warna khusus
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    builder: (context) => EditNameModal(),
                  );
                },
              ),

              ProfileOption(
                icon: 'assets/icon_email.png',
                title: 'Alamat Email',
                subtitle: 'john@email.com',
                backgroundColor: const Color(0xFFFCFFEB), // Warna berbeda
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    builder: (context) => EditEmailModal(),
                  );
                },
              ),

              ProfileOption(
                icon: 'assets/icon_telp.png',
                title: 'Nomor Telepon',
                subtitle: '082212345678',
                backgroundColor: const Color(0xFFE4FFF5), // Warna berbeda lagi
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    builder: (context) => EditPhoneModal(),
                  );
                },
              ),

              ProfileOption(
                icon: 'assets/icon_pusatbantuan.png',
                title: 'Pusat Bantuan',
                subtitle: 'Hubungi kami terkait kendala anda',
                backgroundColor: const Color(0xFFE4ECFF), // Warna berbeda
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PusatbantuanPage()),
                  );
                },
              ),

              ProfileOption(
                icon: 'assets/icon_logout.png',
                title: 'Keluar',
                subtitle: 'Keluar dari akun anda sekarang',
                backgroundColor: const Color(0xFFF6F1EB), // Warna terakhir
                onTap: () {
                  EditNameModal();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileOption extends StatelessWidget {
  final String icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final Color backgroundColor; // Tambahkan parameter warna

  const ProfileOption({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.backgroundColor, // Wajib diisi
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: backgroundColor, // Warna berdasarkan parameter
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.asset(icon, width: 24, height: 24),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: const Color(0xFF0075FF),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
