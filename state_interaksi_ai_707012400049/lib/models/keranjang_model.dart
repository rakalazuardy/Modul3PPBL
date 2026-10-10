import 'package:flutter/foundation.dart';

class Produk {
  final String nama;
  final int harga;
  final String ikon;

  Produk({required this.nama, required this.harga, required this.ikon});
}

class ItemKeranjang {
  final Produk produk;
  int jumlah;

  ItemKeranjang({required this.produk, this.jumlah = 1});
}

class KeranjangModel extends ChangeNotifier {
  final List<ItemKeranjang> _items = [];

  // Getter
  List<ItemKeranjang> get items => _items;

  int get totalItem {
    return _items.fold(0, (total, item) => total + item.jumlah);
  }

  int get totalHarga {
    return _items.fold(0, (total, item) => total + (item.produk.harga * item.jumlah));
  }

  // Metode untuk memodifikasi keranjang
  void tambah(Produk produk) {
    final index = _items.indexWhere((item) => item.produk.nama == produk.nama);
    if (index >= 0) {
      _items[index].jumlah++;
    } else {
      _items.add(ItemKeranjang(produk: produk));
    }
    notifyListeners();
  }

  void kurangi(Produk produk) {
    final index = _items.indexWhere((item) => item.produk.nama == produk.nama);
    if (index >= 0) {
      if (_items[index].jumlah > 1) {
        _items[index].jumlah--;
      } else {
        _items.removeAt(index);
      }
      notifyListeners();
    }
  }

  void kosongkan() {
    _items.clear();
    notifyListeners();
  }
}