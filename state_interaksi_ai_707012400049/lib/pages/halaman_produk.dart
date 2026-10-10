import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/keranjang_model.dart';

class HalamanProduk extends StatelessWidget {
  HalamanProduk({super.key});

  final List<Produk> daftarProduk = [
    Produk(nama: 'Nasi Goreng', harga: 15000, ikon: '🍛'),
    Produk(nama: 'Mie Ayam', harga: 12000, ikon: '🍜'),
    Produk(nama: 'Es Teh', harga: 5000, ikon: '🥤'),
    Produk(nama: 'Ayam Geprek', harga: 18000, ikon: '🍗'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: daftarProduk.length,
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final produk = daftarProduk[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: ListTile(
            leading: Text(produk.ikon, style: const TextStyle(fontSize: 32)),
            title: Text(produk.nama),
            subtitle: Text('Rp${produk.harga}'),
            trailing: ElevatedButton(
              onPressed: () {
                // Menambah produk ke keranjang
                context.read<KeranjangModel>().tambah(produk);
              },
              child: const Text('Tambah'),
            ),
          ),
        );
      },
    );
  }
}