
import 'package:flutter/foundation.dart';

class FavoritModel extends ChangeNotifier {
  final Set<String> _daftarFavorit = {};

  Set<String> get daftarFavorit =>
      Set.unmodifiable(_daftarFavorit);

  bool isFavorit(String namaLayanan) {
    return _daftarFavorit.contains(namaLayanan);
  }

  void tandai(String namaLayanan) {
    if (_daftarFavorit.add(namaLayanan)) {
      notifyListeners();
    }
  }

  void batalTandai(String namaLayanan) {
    if (_daftarFavorit.remove(namaLayanan)) {
      notifyListeners();
    }
  }

  void toggleFavorit(String namaLayanan) {
    if (isFavorit(namaLayanan)) {
      batalTandai(namaLayanan);
    } else {
      tandai(namaLayanan);
    }
  }
}