
import 'package:flutter/foundation.dart';

class PengajuanModel extends ChangeNotifier {
  final List<Map<String, String>> _daftarPengajuan = [];

  List<Map<String, String>> get daftarPengajuan =>
      List.unmodifiable(_daftarPengajuan);

  int get totalPengajuan => _daftarPengajuan.length;

  void tambahPengajuan(Map<String, String> layanan) {
    _daftarPengajuan.add(
      Map<String, String>.unmodifiable(layanan),
    );

    notifyListeners();
  }
}