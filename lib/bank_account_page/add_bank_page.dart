import 'package:flutter/material.dart';
import 'package:pulsain_task3/bank_account_page/list_bank_page.dart';
import 'package:pulsain_task3/widgets/primary_button.dart';
import 'package:pulsain_task3/widgets/primary_appbar.dart';

class AddBankPage extends StatefulWidget {
  @override
  _AddBankPageState createState() => _AddBankPageState();
}

class _AddBankPageState extends State<AddBankPage> {
  String? selectedBank;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFF5F7),
      appBar: PrimaryAppbar(
        title: "Tambah Rekening", // Judul bisa diubah
        onBackPressed: () {
          Navigator.pop(context); // Navigasi kembali
        },
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLabel("Bank/Dompet Digital"),
            _buildBankSelectionButton(),
            SizedBox(height: 20),
            _buildLabel("Nomor Rekening"),
            _buildTextField("Masukkan nomor rekening"),
            SizedBox(height: 20),
            _buildLabel("Nama Pemilik Rekening"),
            _buildTextField("Masukkan nama pemilik rekening"),
            SizedBox(height: 350),

            CustomButton(
              text: "Simpan",
              onPressed: () {
                // Tambahkan aksi saat tombol ditekan
                print("Rekening disimpan!");
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }

  Widget _buildBankSelectionButton() {
    return GestureDetector(
      onTap: () async {
        final selected = await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ListBankPage()),
        );
        if (selected != null) {
          setState(() {
            selectedBank = selected;
          });
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: const Color(0xFFFBFBFF),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xFFCFD7FF)), //ganti warna
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              selectedBank ?? "Pilih Bank",
              style: TextStyle(
                fontSize: 16,
                color: selectedBank == null ? Colors.grey : Colors.black,
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down_outlined,
              size: 20,
              color: const Color(0xFF0075FF),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String hintText) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Color(0xFFFBFBFF), // Ganti warna background TextField
        // Border default (saat tidak fokus)
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Color(0xFFCFD7FF), width: 1.5),
        ),
      ),
    );
  }
}
