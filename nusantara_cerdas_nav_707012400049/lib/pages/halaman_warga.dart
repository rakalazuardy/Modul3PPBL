
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/favorit_model.dart';
import '../models/pengajuan_model.dart';
import '../navigation/app_routes.dart';

class HalamanWarga extends StatelessWidget {
  const HalamanWarga({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const SizedBox(height: 20),
        const Center(
          child: CircleAvatar(
            radius: 48,
            child: Icon(
              Icons.person,
              size: 48,
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Center(
          child: Text(
            'Muhammad Raka Putra Lazuardy',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 6),
        const Center(
          child: Text('Warga Nusantara Cerdas'),
        ),
        const SizedBox(height: 28),

        Card(
          child: Column(
            children: const [
              ListTile(
                leading: Icon(Icons.badge_outlined),
                title: Text('Nomor Identitas'),
                subtitle: Text('707012400049'),
              ),
              Divider(height: 1),
              ListTile(
                leading: Icon(Icons.location_on_outlined),
                title: Text('Domisili'),
                subtitle: Text('Kota Nusantara'),
              ),
              Divider(height: 1),
              ListTile(
                leading: Icon(Icons.verified_user_outlined),
                title: Text('Status'),
                subtitle: Text('Warga Terverifikasi'),
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),

        const Text(
          'Layanan Favorit',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),

        Consumer<FavoritModel>(
          builder: (context, model, child) {
            final daftar = model.daftarFavorit.toList()
              ..sort();

            if (daftar.isEmpty) {
              return const Card(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Icon(
                        Icons.star_border,
                        size: 40,
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Belum ada layanan favorit.',
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Buka menu Layanan dan tekan ikon bintang.',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            }

            return Card(
              child: Column(
                children: [
                  for (int i = 0; i < daftar.length; i++) ...[
                    if (i > 0) const Divider(height: 1),
                    ListTile(
                      leading: const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      title: Text(daftar[i]),
                      trailing: IconButton(
                        tooltip: 'Hapus dari favorit',
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          context
                              .read<FavoritModel>()
                              .batalTandai(daftar[i]);
                        },
                      ),
                    ),
                  ],
                ],
              ),
            );
          },
        ),

        const SizedBox(height: 24),

        const Text(
          'Riwayat Pengajuan',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),

        Consumer<PengajuanModel>(
          builder: (context, model, child) {
            if (model.daftarPengajuan.isEmpty) {
              return const Card(
                child: ListTile(
                  leading: Icon(Icons.inbox_outlined),
                  title: Text('Belum ada pengajuan'),
                  subtitle: Text(
                    'Permohonan yang diajukan akan muncul di sini.',
                  ),
                ),
              );
            }

            return Card(
              child: Column(
                children: [
                  for (
                    int i = 0;
                    i < model.daftarPengajuan.length;
                    i++
                  ) ...[
                    if (i > 0) const Divider(height: 1),
                    ListTile(
                      leading: const Icon(
                        Icons.assignment_turned_in_outlined,
                      ),
                      title: Text(
                        model.daftarPengajuan[i]['nama'] ??
                            'Layanan',
                      ),
                      subtitle: Text(
                        model.daftarPengajuan[i]['dinas'] ??
                            'Dinas tidak diketahui',
                      ),
                      trailing: const Icon(
                        Icons.check_circle_outline,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ],
              ),
            );
          },
        ),

        const SizedBox(height: 20),

        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(
                context,
                AppRoutes.riwayat,
              );
            },
            icon: const Icon(Icons.history),
            label: const Text('Lihat Riwayat Laporan'),
          ),
        ),
      ],
    );
  }
}