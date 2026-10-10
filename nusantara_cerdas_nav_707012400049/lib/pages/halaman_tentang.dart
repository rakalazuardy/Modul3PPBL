import 'package:flutter/material.dart';

class HalamanTentang extends StatelessWidget {
  const HalamanTentang({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang Aplikasi'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.location_city,
                size: 80,
              ),
              const SizedBox(height: 20),
              const Text(
                'Nusantara Cerdas Mobile',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Purwarupa aplikasi layanan warga '
                'berbasis Smart City.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Text(
                'Modul II - Pemrograman Perangkat '
                'Bergerak Lanjut',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}