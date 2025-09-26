import 'package:flutter/material.dart';

class KonversiWaktuPage extends StatefulWidget {
  const KonversiWaktuPage({super.key});

  @override
  State<KonversiWaktuPage> createState() => _KonversiWaktuPageState();
}

class _KonversiWaktuPageState extends State<KonversiWaktuPage> {
  TimeOfDay _selectedTime = TimeOfDay.now();
  String _hasilKonversi = '';

  void _pilihWaktu(BuildContext context) async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (newTime != null) {
      setState(() {
        _selectedTime = newTime;
        _konversiWaktu();
      });
    }
  }

  void _konversiWaktu() {
    int jam = _selectedTime.hour;
    int menit = _selectedTime.minute;

    // Asumsi: Waktu yang diinput adalah WIB (Zona Waktu Default)
    // Konversi:
    // WITA = WIB + 1 jam
    // WIT  = WIB + 2 jam

    // 1. Konversi ke WITA (WIB + 1 jam)
    int jamWITA = (jam + 1) % 24;
    String waktuWITA = '${jamWITA.toString().padLeft(2, '0')}:${menit.toString().padLeft(2, '0')}';

    // 2. Konversi ke WIT (WIB + 2 jam)
    int jamWIT = (jam + 2) % 24;
    String waktuWIT = '${jamWIT.toString().padLeft(2, '0')}:${menit.toString().padLeft(2, '0')}';

    setState(() {
      _hasilKonversi = 
          'Waktu Awal (WIB): ${jam.toString().padLeft(2, '0')}:${menit.toString().padLeft(2, '0')}\n'
          'Waktu Indonesia Tengah (WITA): $waktuWITA\n'
          'Waktu Indonesia Timur (WIT): $waktuWIT';
    });
  }

  @override
  void initState() {
    super.initState();
    // Inisialisasi konversi saat halaman dimuat
    _konversiWaktu(); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Konversi Zona Waktu')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => _pilihWaktu(context),
              child: const Text('Pilih Waktu Awal (Asumsi WIB)'),
            ),
            const SizedBox(height: 20),
            Text(
              'Waktu yang Dipilih: ${_selectedTime.format(context)}',
              style: const TextStyle(fontSize: 18),
            ),
            const Divider(height: 30),
            const Text(
              'Hasil Konversi:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Menampilkan hasil konversi
            Text(
              _hasilKonversi,
              style: const TextStyle(fontSize: 16, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}