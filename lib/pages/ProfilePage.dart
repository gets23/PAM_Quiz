// lib/pages/profile_page.dart

import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile Developer')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('assets/image.jpeg'), 
              ),
              const SizedBox(height: 20),
              _buildDataRow('Nama', 'Ghaitsya Faradiba'),
              _buildDataRow('NIM', '124230002'),
              _buildDataRow('Tempat/Tgl Lahir', 'Auckland, 23 Maret 2005'),
              _buildDataRow('Hobi', 'Membaca, Menulis, Jajan'),
              
              const SizedBox(height: 30),
              const Text(
                'Quiz Pemrograman Aplikasi Mobile',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildDataRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            '$label',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}