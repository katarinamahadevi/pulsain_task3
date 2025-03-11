import 'package:flutter/material.dart';
import 'package:pulsain_task3/homepage/home_page.dart';
import 'package:pulsain_task3/models/rate_modal.dart';
import 'package:pulsain_task3/widgets/button2.dart';
import 'package:pulsain_task3/widgets/button3.dart';
import 'package:pulsain_task3/widgets/navbar.dart';

class TermsAndConditionsScreen extends StatefulWidget {
  @override
  _TermsAndConditionsScreenState createState() =>
      _TermsAndConditionsScreenState();
}

class _TermsAndConditionsScreenState extends State<TermsAndConditionsScreen> {
  bool isChecked = false;

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
            width: 30,
            height: 30,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Syarat dan Ketentuan',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            icon: Image.asset(
              'assets/icon_notification.png', // Ganti dengan path aset yang sesuai
              width: 30, // Sesuaikan ukuran
              height: 30,
            ),
            onPressed: () {},
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(color: Colors.grey.shade300, height: 1),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Text(
              'Does Termlys End User License Agreement Generator Cover All Contract and Consumer Protection Laws?',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  'Ultrices fames et nisl, ut imperdiet cursus maecenas. Etiam placerat tellus eget lacus nec eleifend odio. '
                  'Sollicitudin id egestas proin maecenas consectetur in hac risus. Sed tellus semper ultrices blandit fringilla pulvinar ut congue. '
                  'Tellus suspendisse proin amet pulvinar suspendisse ut ut enim feugiat.\n\n'
                  'Tincidunt lacus porttitor morbi tellus tellus amet, quam mattis. Id faucibus commodo tellus ultrices convallis velit sagittis fermentum, id. '
                  'Augue mauris, diam habitant sit venenatis sed. Nec, aliquam tincidunt at commodo diam laoreet. '
                  'Morbi nibh nisl cursus amet lacus quis. Ornare quis dignissim purus feugiat placerat justo. '
                  'Felis a mi viverra sem phasellus vel diam. Tellus platea bibendum sit feugiat elementum venenatis vel elementum. '
                  'Massa blandit nisi, nulla iaculis amet.'
                  'Eget quam curabitur suscipit pharetra faucibus pellentesque aliquam. '
                  'Tellus suspendisse proin amet pulvinar suspendisse ut ut enim feugiat. '
                  'Tincidunt lacus porttitor morbi tellus tellus amet.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 83, 82, 82),
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isChecked = !isChecked;
                    });
                  },
                  child: Image.asset(
                    isChecked
                        ? 'assets/icon_checkbox.png'
                        : 'assets/icon_checkbox2.png',
                    width: 24,
                    height: 24,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Saya setuju dengan ketentuan layanan ini.',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),

            SizedBox(height: 10),

            // Tombol dengan asset yang berubah
            isChecked
                ? Button3(
                  text: "Setuju, Lanjutkan", // Tambahkan teks di sini
                  onPressed: () {},
                )
                : CustomButton(
                  text: "Setuju, Lanjutkan", // Tambahkan teks di sini juga
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const Navbar()),
                    );
                  }, // Beri aksi jika tombol nonaktif ingin berfungsi
                ),
          ],
        ),
      ),
    );
  }
}
