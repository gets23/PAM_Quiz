import 'package:flutter/material.dart';

class HitungPiramidaPage extends StatefulWidget {
  const HitungPiramidaPage({super.key});

  @override
  State<HitungPiramidaPage> createState() => _HitungPiramidaPageState();
}

class _HitungPiramidaPageState extends State<HitungPiramidaPage> {
  final TextEditingController _sisiAlasController = TextEditingController();
  final TextEditingController _tinggiController = TextEditingController();

  String _hasilVolume = '0.0';
  String _hasilKeliling = '0.0';

  void _hitungPiramida() {
    double? s = double.tryParse(_sisiAlasController.text);
    double? t = double.tryParse(_tinggiController.text);

    if (s != null && t != null && s > 0 && t > 0) {
      // Hitung Volume: V = 1/3 * s^2 * t
      double volume = (1 / 3) * (s * s) * t;

      setState(() {
        _hasilVolume = volume.toStringAsFixed(2);
        _hasilKeliling = 'Keliling tidak terdefinisi, karena piramida merupakan bangun ruang';
      });
    } else {
      setState(() {
        _hasilVolume   = 'Input tidak valid';
        _hasilKeliling = 'Input tidak valid';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kalkulator Piramida')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text('Asumsi: Limas Segiempat Beraturan'),
            _buildTextField(_sisiAlasController, 'Panjang Sisi Alas (s)'),
            _buildTextField(_tinggiController, 'Tinggi Limas (t)'),

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _hitungPiramida,
              child: const Text('Hitung Volume & Keliling'),
            ),

            const SizedBox(height: 30),
            Text('Hasil Volume: $_hasilVolume',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text('Hasil Keliling: $_hasilKeliling',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
