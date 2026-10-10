import 'package:flutter/material.dart';

class HalamanPengaturan extends StatefulWidget {
  const HalamanPengaturan({super.key});

  @override
  State<HalamanPengaturan> createState() =>
      _HalamanPengaturanState();
}

class _HalamanPengaturanState
    extends State<HalamanPengaturan> {
  bool _notifikasi = true;
  bool _modeHemat = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan Kota'),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            value: _notifikasi,
            onChanged: (value) {
              setState(() {
                _notifikasi = value;
              });
            },
            title: const Text('Notifikasi'),
            subtitle: const Text(
              'Menerima informasi layanan kota.',
            ),
          ),
          SwitchListTile(
            value: _modeHemat,
            onChanged: (value) {
              setState(() {
                _modeHemat = value;
              });
            },
            title: const Text('Mode Hemat Data'),
            subtitle: const Text(
              'Mengurangi penggunaan data internet.',
            ),
          ),
          const ListTile(
            leading: Icon(Icons.language),
            title: Text('Bahasa'),
            subtitle: Text('Bahasa Indonesia'),
          ),
        ],
      ),
    );
  }
}