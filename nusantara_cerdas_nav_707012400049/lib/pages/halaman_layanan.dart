
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/favorit_model.dart';
import '../navigation/app_routes.dart';

class HalamanLayanan extends StatelessWidget {
  const HalamanLayanan({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.description_outlined),
                text: 'Perizinan',
              ),
              Tab(
                icon: Icon(Icons.local_hospital_outlined),
                text: 'Kesehatan',
              ),
              Tab(
                icon: Icon(Icons.directions_bus_outlined),
                text: 'Transportasi',
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                _daftarLayanan([
                  {
                    'nama': 'Izin Usaha',
                    'dinas': 'Dinas Penanaman Modal',
                    'jam': '08.00 - 15.00',
                    'keterangan':
                        'Pengajuan izin usaha bagi masyarakat dan pelaku UMKM.',
                  },
                  {
                    'nama': 'Izin Bangunan',
                    'dinas': 'Dinas Tata Ruang',
                    'jam': '08.00 - 15.00',
                    'keterangan':
                        'Layanan pengajuan perizinan bangunan dan tata ruang.',
                  },
                  {
                    'nama': 'Izin Keramaian',
                    'dinas': 'Dinas Pelayanan Publik',
                    'jam': '08.00 - 14.00',
                    'keterangan':
                        'Pengajuan izin untuk kegiatan masyarakat di ruang publik.',
                  },
                ]),
                _daftarLayanan([
                  {
                    'nama': 'Puskesmas Terdekat',
                    'dinas': 'Dinas Kesehatan',
                    'jam': '24 Jam',
                    'keterangan':
                        'Informasi lokasi dan layanan puskesmas terdekat.',
                  },
                  {
                    'nama': 'Vaksinasi',
                    'dinas': 'Dinas Kesehatan',
                    'jam': '08.00 - 14.00',
                    'keterangan':
                        'Informasi dan pendaftaran layanan vaksinasi warga.',
                  },
                  {
                    'nama': 'Ambulans Kota',
                    'dinas': 'Dinas Kesehatan',
                    'jam': '24 Jam',
                    'keterangan':
                        'Layanan informasi dan permintaan ambulans kota.',
                  },
                ]),
                _daftarLayanan([
                  {
                    'nama': 'Info Transportasi',
                    'dinas': 'Dinas Perhubungan',
                    'jam': '24 Jam',
                    'keterangan':
                        'Informasi transportasi umum dan rute perjalanan.',
                  },
                  {
                    'nama': 'Bus Kota',
                    'dinas': 'Dinas Perhubungan',
                    'jam': '05.00 - 22.00',
                    'keterangan':
                        'Informasi rute, jadwal, dan halte bus kota.',
                  },
                  {
                    'nama': 'Parkir Digital',
                    'dinas': 'Dinas Perhubungan',
                    'jam': '24 Jam',
                    'keterangan':
                        'Informasi lokasi parkir dan ketersediaan area parkir.',
                  },
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _daftarLayanan(List<Map<String, String>> daftar) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: daftar.length,
      separatorBuilder: (_, __) =>
          const SizedBox(height: 10),
      itemBuilder: (context, index) {
        return _KartuLayanan(layanan: daftar[index]);
      },
    );
  }
}

class _KartuLayanan extends StatelessWidget {
  const _KartuLayanan({
    required this.layanan,
  });

  final Map<String, String> layanan;

  @override
  Widget build(BuildContext context) {
    final nama = layanan['nama']!;
    final favorit = context.watch<FavoritModel>();
    final sudahFavorit = favorit.isFavorit(nama);

    return Card(
      child: ListTile(
        leading: const CircleAvatar(
          child: Icon(Icons.miscellaneous_services),
        ),
        title: Text(
          nama,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(layanan['dinas']!),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              tooltip: sudahFavorit
                  ? 'Hapus dari favorit'
                  : 'Tambahkan ke favorit',
              onPressed: () {
                context
                    .read<FavoritModel>()
                    .toggleFavorit(nama);
              },
              icon: Icon(
                sudahFavorit
                    ? Icons.star
                    : Icons.star_border,
                color: sudahFavorit
                    ? Colors.amber.shade700
                    : null,
              ),
            ),
            const Icon(Icons.chevron_right),
          ],
        ),
        onTap: () async {
          final hasil = await Navigator.pushNamed(
            context,
            AppRoutes.detailLayanan,
            arguments: {
              'nama': layanan['nama']!,
              'dinas': layanan['dinas']!,
              'jam': layanan['jam']!,
              'keterangan': layanan['keterangan']!,
            },
          );

          if (!context.mounted) return;

          if (hasil is String) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(hasil)),
            );
          }
        },
      ),
    );
  }
}