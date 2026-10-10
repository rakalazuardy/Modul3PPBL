import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/keranjang_model.dart';

class HalamanKeranjang extends StatelessWidget {
  const HalamanKeranjang({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<KeranjangModel>(
      builder: (context, keranjang, child) {
        if (keranjang.items.isEmpty) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.shopping_cart_outlined, size: 64, color: Colors.grey),
                SizedBox(height: 16),
                Text('Keranjang masih kosong', style: TextStyle(fontSize: 18, color: Colors.grey)),
              ],
            ),
          );
        }

        return Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: keranjang.items.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  final item = keranjang.items[index];
                  return ListTile(
                    leading: Text(item.produk.ikon, style: const TextStyle(fontSize: 32)),
                    title: Text(item.produk.nama),
                    subtitle: Text('Jumlah: ${item.jumlah}\nHarga: Rp${item.produk.harga * item.jumlah}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove_circle_outline),
                          onPressed: () => keranjang.kurangi(item.produk),
                        ),
                        Text('${item.jumlah}', style: const TextStyle(fontSize: 16)),
                        IconButton(
                          icon: const Icon(Icons.add_circle_outline),
                          onPressed: () => keranjang.tambah(item.produk),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceVariant,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Total Harga', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text('Rp${keranjang.totalHarga}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () => keranjang.kosongkan(),
                      icon: const Icon(Icons.delete_outline),
                      label: const Text('Kosongkan Keranjang'),
                    ),
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }
}