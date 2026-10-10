import 'package:flutter/material.dart';

import '../pages/halaman_detail_layanan.dart';
import '../pages/halaman_keluar.dart';
import '../pages/halaman_pengaturan.dart';
import '../pages/halaman_riwayat.dart';
import '../pages/halaman_tentang.dart';
import 'kerangka_navigasi.dart';

class AppRoutes {
  static const String beranda = '/';
  static const String detailLayanan = '/detail-layanan';
  static const String riwayat = '/riwayat';
  static const String pengaturan = '/pengaturan';
  static const String tentang = '/tentang';
  static const String keluar = '/keluar';

  static Map<String, WidgetBuilder> daftarRoute() {
    return {
      beranda: (context) => const KerangkaNavigasi(),
      riwayat: (context) => const HalamanRiwayat(),
      pengaturan: (context) => const HalamanPengaturan(),
      tentang: (context) => const HalamanTentang(),
      keluar: (context) => const HalamanKeluar(),
    };
  }

  static Route<dynamic>? bentukRoute(RouteSettings settings) {
    if (settings.name == detailLayanan) {
      final arguments =
          settings.arguments as Map<String, String>? ?? const {};

      return MaterialPageRoute(
        builder: (context) => HalamanDetailLayanan(
          nama: arguments['nama'] ?? 'Layanan Tidak Dikenal',
          dinas: arguments['dinas'] ?? 'Tidak tersedia',
          jam: arguments['jam'] ?? 'Tidak tersedia',
          keterangan:
              arguments['keterangan'] ?? 'Tidak ada keterangan.',
        ),
      );
    }

    return null;
  }

  static Route<dynamic> routeTidakDikenal(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Route Tidak Ditemukan'),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.error_outline,
                    size: 80,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Route Tidak Ditemukan',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Route ${settings.name} belum terdaftar.',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Kembali'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}