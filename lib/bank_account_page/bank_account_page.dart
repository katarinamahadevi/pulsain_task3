import 'package:flutter/material.dart';
import 'package:pulsain_task3/bank_account_page/add_bank_page.dart';
import 'package:pulsain_task3/bank_account_page/change_bank_page.dart';
import 'package:pulsain_task3/home_page/home_page.dart';
import 'package:pulsain_task3/widgets/primary_appbar.dart';
import 'package:pulsain_task3/widgets/primary_button.dart';
import 'package:pulsain_task3/widgets/navbar.dart';

class BankAccountPage extends StatelessWidget {
  final List<Map<String, String>> rekeningList = [
    {'bank': 'BCA', 'image': 'assets/logo_bca.png'},
    {'bank': 'BNI', 'image': 'assets/logo_bni.png'},
    {'bank': 'BANK BRI', 'image': 'assets/logo_bri.png'},
    {'bank': 'Mandiri', 'image': 'assets/logo_mandiri.png'},
    {'bank': 'DANA', 'image': 'assets/logo_dana.png'},
    {'bank': 'GoPay', 'image': 'assets/logo_gopay.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFF5F7),
      appBar: PrimaryAppbar(
        title: "Daftar Rekening", 
        onBackPressed: () {
          Navigator.pop(context); 
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: rekeningList.length,
                itemBuilder: (context, index) {
                  return RekeningCard(
                    bankName: rekeningList[index]['bank']!,
                    imagePath: rekeningList[index]['image']!,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChangeBankPage(),
                        ),
                      );
                    },
                  );
                },
              ),
              SizedBox(height: 20),
              CustomButton(
                text: "Tambah Rekening",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddBankPage()),
                  );
                },
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class RekeningCard extends StatelessWidget {
  final String bankName;
  final String imagePath;
  final VoidCallback onTap;

  const RekeningCard({
    required this.bankName,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, 
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                color: const Color(0xFFF1FDFF), // Warna latar belakang logo
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                // Agar logo tetap di tengah
                child: Image.asset(imagePath, width: 30, height: 30),
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Johnatan Kayar",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("7712812799", style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 16, color: Colors.blueAccent),
          ],
        ),
      ),
    );
  }
}
