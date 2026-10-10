import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/pengajuan_model.dart';
import '../pages/halaman_beranda.dart';
import '../pages/halaman_layanan.dart';
import '../pages/halaman_warga.dart';
import 'app_routes.dart';

class KerangkaNavigasi extends StatefulWidget {
  const KerangkaNavigasi({super.key});

  @override
  State<KerangkaNavigasi> createState() => _KerangkaNavigasiState();
}

class _KerangkaNavigasiState extends State<KerangkaNavigasi> {
  int _indeksTerpilih = 0;

  final List<Widget> _halaman = const [
    HalamanBeranda(),
    HalamanLayanan(),
    HalamanWarga(),
  ];

  final List<String> _judul = const ['Beranda', 'Layanan', 'Warga'];

  void _pilihTujuan(int indeks) {
    setState(() {
      _indeksTerpilih = indeks;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double lebarLayar = MediaQuery.of(context).size.width;

    final bool layarLebar = lebarLayar >= 600;

    return Scaffold(
      appBar: AppBar(title: Text(_judul[_indeksTerpilih])),
      drawer: _buatDrawer(),
      body: layarLebar ? _tataLetakLebar() : _halaman[_indeksTerpilih],
      bottomNavigationBar: layarLebar ? null : _buatNavigationBar(),
    );
  }

  Widget _buatNavigationBar() {
    return NavigationBar(
      selectedIndex: _indeksTerpilih,
      onDestinationSelected: _pilihTujuan,
      destinations: [
        const NavigationDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home),
          label: 'Beranda',
        ),
        const NavigationDestination(
          icon: Icon(Icons.miscellaneous_services_outlined),
          selectedIcon: Icon(Icons.miscellaneous_services),
          label: 'Layanan',
        ),
        NavigationDestination(
          icon: const _IkonWargaDenganBadge(terpilih: false),
          selectedIcon: const _IkonWargaDenganBadge(terpilih: true),
          label: 'Warga',
        ),
      ],
    );
  }

  Widget _tataLetakLebar() {
    return Row(
      children: [
        NavigationRail(
          selectedIndex: _indeksTerpilih,
          onDestinationSelected: _pilihTujuan,
          extended: true,
          leading: const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Icon(Icons.location_city, size: 32),
          ),
          destinations: [
            const NavigationRailDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: Text('Beranda'),
            ),
            const NavigationRailDestination(
              icon: Icon(Icons.miscellaneous_services_outlined),
              selectedIcon: Icon(Icons.miscellaneous_services),
              label: Text('Layanan'),
            ),
            const NavigationRailDestination(
              icon: _IkonWargaDenganBadge(terpilih: false),
              selectedIcon: _IkonWargaDenganBadge(terpilih: true),
              label: Text('Warga'),
            ),
          ],
        ),
        const VerticalDivider(thickness: 1, width: 1),
        Expanded(child: _halaman[_indeksTerpilih]),
      ],
    );
  }

  Widget _buatDrawer() {
    return NavigationDrawer(
      selectedIndex: _indeksTerpilih,
      onDestinationSelected: (indeks) {
        _pilihTujuan(indeks);
        Navigator.pop(context);
      },
      children: [
        const UserAccountsDrawerHeader(
          accountName: Text('Nusantara Cerdas Mobile'),
          accountEmail: Text('Layanan Warga Smart City'),
          currentAccountPicture: CircleAvatar(child: Icon(Icons.location_city)),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 16, 10),
          child: Text('Menu Utama'),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home),
          label: Text('Beranda'),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.miscellaneous_services_outlined),
          selectedIcon: Icon(Icons.miscellaneous_services),
          label: Text('Layanan'),
        ),
        const NavigationDrawerDestination(
          icon: _IkonWargaDenganBadge(terpilih: false),
          selectedIcon: _IkonWargaDenganBadge(terpilih: true),
          label: Text('Warga'),
        ),
        const Divider(indent: 28, endIndent: 28),
        ListTile(
          leading: const Icon(Icons.settings_outlined),
          title: const Text('Pengaturan Kota'),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, AppRoutes.pengaturan);
          },
        ),
        ListTile(
          leading: const Icon(Icons.info_outline),
          title: const Text('Tentang Aplikasi'),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, AppRoutes.tentang);
          },
        ),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text('Keluar'),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, AppRoutes.keluar);
          },
        ),
      ],
    );
  }
}

class _IkonWargaDenganBadge extends StatelessWidget {
  const _IkonWargaDenganBadge({required this.terpilih});

  final bool terpilih;

  @override
  Widget build(BuildContext context) {
    final total = context.select<PengajuanModel, int>(
      (model) => model.totalPengajuan,
    );

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Padding(
          padding: const EdgeInsets.all(4),
          child: Icon(terpilih ? Icons.person : Icons.person_outline),
        ),
        if (total > 0)
          Positioned(
            right: -8,
            top: -8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              constraints: const BoxConstraints(minWidth: 18, minHeight: 18),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                total > 99 ? '99+' : '$total',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
