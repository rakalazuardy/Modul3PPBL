import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/keranjang_model.dart';
import 'pages/halaman_produk.dart';
import 'pages/halaman_keranjang.dart';

void main() {
  runApp(
    // Provider dibungkus di level paling atas agar state keranjang tersedia di seluruh aplikasi
    ChangeNotifierProvider(
      create: (context) => KeranjangModel(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kantin Kampus',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const BerandaKantin(),
    );
  }
}

class BerandaKantin extends StatefulWidget {
  const BerandaKantin({super.key});

  @override
  State<BerandaKantin> createState() => _BerandaKantinState();
}

class _BerandaKantinState extends State<BerandaKantin> {
  int _indeksTerpilih = 0;

  final List<Widget> _halaman = [
    HalamanProduk(),
    const HalamanKeranjang(),
  ];

  @override
  Widget build(BuildContext context) {
    // Membaca jumlah total item keranjang untuk ditampilkan pada badge/label navigasi
    final totalItemKeranjang = context.select<KeranjangModel, int>((keranjang) => keranjang.totalItem);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kantin Kampus'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: _halaman[_indeksTerpilih],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _indeksTerpilih,
        onDestinationSelected: (int index) {
          // Navigasi dikelola oleh setState lokal
          setState(() {
            _indeksTerpilih = index;
          });
        },
        destinations: [
          const NavigationDestination(
            icon: Icon(Icons.restaurant_menu),
            label: 'Produk',
          ),
          NavigationDestination(
            icon: const Icon(Icons.shopping_cart),
            label: 'Keranjang ($totalItemKeranjang)',
          ),
        ],
      ),
    );
  }
}