import 'package:flutter/material.dart';

class HalamanRiwayat extends StatefulWidget {
  const HalamanRiwayat({super.key});

  @override
  State<HalamanRiwayat> createState() =>
      _HalamanRiwayatState();
}

class _HalamanRiwayatState
    extends State<HalamanRiwayat> {
  int _jumlahLaporan = 2;

  void _tambahLaporan() {
    setState(() {
      _jumlahLaporan++;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Laporan baru berhasil ditambahkan.',
        ),
      ),
    );
  }

  void _tampilkanPesan(String pesan) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(pesan),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Laporan'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Icon(
                    Icons.assignment_turned_in_outlined,
                    size: 52,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Total Laporan',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '$_jumlahLaporan',
                    style: const TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.check),
              ),
              title: const Text(
                'Lampu Jalan Rusak',
              ),
              subtitle: const Text(
                'Status: Selesai',
              ),
              trailing: const Icon(
                Icons.chevron_right,
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.pending_actions),
              ),
              title: const Text(
                'Jalan Berlubang',
              ),
              subtitle: const Text(
                'Status: Diproses',
              ),
              trailing: const Icon(
                Icons.chevron_right,
              ),
            ),
          ),
          if (_jumlahLaporan > 2)
            Card(
              child: ListTile(
                leading: const CircleAvatar(
                  child: Icon(Icons.fiber_new),
                ),
                title: const Text(
                  'Laporan Baru',
                ),
                subtitle: const Text(
                  'Status: Diterima',
                ),
                trailing: const Icon(
                  Icons.chevron_right,
                ),
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _tambahLaporan,
        tooltip: 'Tambah laporan',
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              tooltip: 'Cari',
              onPressed: () {
                _tampilkanPesan(
                  'Mencari laporan...',
                );
              },
              icon: const Icon(Icons.search),
            ),
            IconButton(
              tooltip: 'Filter',
              onPressed: () {
                _tampilkanPesan(
                  'Filter laporan...',
                );
              },
              icon: const Icon(Icons.filter_list),
            ),
            const SizedBox(width: 40),
            IconButton(
              tooltip: 'Urutkan',
              onPressed: () {
                _tampilkanPesan(
                  'Mengurutkan laporan...',
                );
              },
              icon: const Icon(Icons.sort),
            ),
            IconButton(
              tooltip: 'Lainnya',
              onPressed: () {
                _tampilkanPesan(
                  'Menu lainnya...',
                );
              },
              icon: const Icon(Icons.more_vert),
            ),
          ],
        ),
      ),
    );
  }
}