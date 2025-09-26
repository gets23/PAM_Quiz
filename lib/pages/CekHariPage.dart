import 'package:flutter/material.dart';

class CekHariPage extends StatefulWidget {
  const CekHariPage({super.key});

  @override
  State<CekHariPage> createState() => _CekHariPageState();
}

class _CekHariPageState extends State<CekHariPage> {
  final TextEditingController _nomorController = TextEditingController();
  String _namaHari = '';

  void _cekHari() {
    int? nomor = int.tryParse(_nomorController.text);
    String input = _nomorController.text.trim();

    if (input.isEmpty) {
    setState(() {
      _namaHari = 'Input tidak boleh kosong.';
    });
    return;
  }

    if (nomor == null || nomor < 1 || nomor > 7) {
      setState(() {
        _namaHari = 'Nomor harus antara 1 sampai 7.';
      });
      return;
    }

    // Menggunakan struktur 'switch' (atau 'when' di Kotlin) yang di Dart menjadi 'if-else' atau map
    String hari;
    switch (nomor) {
      case 1:
        hari = 'Senin';
        break;
      case 2:
        hari = 'Selasa';
        break;
      case 3:
        hari = 'Rabu';
        break;
      case 4:
        hari = 'Kamis';
        break;
      case 5:
        hari = 'Jumat';
        break;
      case 6:
        hari = 'Sabtu';
        break;
      case 7:
        hari = 'Minggu';
        break;
      default:
        hari = 'Nomor tidak valid'; // Seharusnya tidak tercapai karena validasi di awal
    }

    setState(() {
      _namaHari = 'Nomor $nomor adalah hari $hari';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cek Hari dari Nomor')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _nomorController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Masukkan Nomor Hari (1 = Senin, 7 = Minggu)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _cekHari,
              child: const Text('Cek Hari'),
            ),
            const SizedBox(height: 30),
            Text(
              _namaHari,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}