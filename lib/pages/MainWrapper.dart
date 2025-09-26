import 'package:flutter/material.dart';
import 'PiramidaPage.dart';
import 'KonversiWaktuPage.dart';
import 'CekHariPage.dart';
import 'ProfilePage.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int _currentIndex = 0;

  // Halaman untuk Bottom Navigation Bar
  final List<Widget> _bottomPages = [
    const HomePage(), // Index 0: Home (Akan berisi 3 menu utama)
    const ProfilePage(), // Index 1: Profile
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bottomPages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// --- Halaman Home (Menampilkan 3 Menu Utama) ---
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Menu Utama Quiz')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildMenuItem(context, 'Piramida (Volume & Keliling)', const HitungPiramidaPage()),
          _buildMenuItem(context, 'Konversi Waktu (WIB, WIT, WITA)', const KonversiWaktuPage()),
          _buildMenuItem(context, 'Cek Hari (Input Nomor)', const CekHariPage()),
        ],
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, String title, Widget page) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
      ),
    );
  }
}