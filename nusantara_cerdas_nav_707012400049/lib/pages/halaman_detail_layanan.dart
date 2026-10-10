
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/pengajuan_model.dart';

class HalamanDetailLayanan extends StatefulWidget {
  const HalamanDetailLayanan({
    super.key,
    required this.nama,
    required this.dinas,
    required this.jam,
    required this.keterangan,
  });

  final String nama;
  final String dinas;
  final String jam;
  final String keterangan;

  @override
  State<HalamanDetailLayanan> createState() =>
      _HalamanDetailLayananState();
}

class _HalamanDetailLayananState
    extends State<HalamanDetailLayanan> {
  bool _sedangMengajukan = false;

  Future<void> _ajukanPermohonan() async {
    if (_sedangMengajukan) return;

    setState(() {
      _sedangMengajukan = true;
    });

    // Simulasi proses pengajuan.
    await Future.delayed(
      const Duration(milliseconds: 900),
    );

    if (!mounted) return;

    context.read<PengajuanModel>().tambahPengajuan({
      'nama': widget.nama,
      'dinas': widget.dinas,
      'jam': widget.jam,
      'keterangan': widget.keterangan,
    });

    Navigator.pop(
      context,
      'Permohonan ${widget.nama} telah diajukan.',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Layanan'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const Icon(
            Icons.article_outlined,
            size: 72,
          ),
          const SizedBox(height: 20),
          Text(
            widget.nama,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),

          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(
                    Icons.account_balance,
                  ),
                  title: const Text(
                    'Dinas Penanggung Jawab',
                  ),
                  subtitle: Text(widget.dinas),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.access_time),
                  title: const Text('Jam Operasional'),
                  subtitle: Text(widget.jam),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.info_outline),
                  title: const Text('Keterangan'),
                  subtitle: Text(widget.keterangan),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: _sedangMengajukan
                  ? null
                  : _ajukanPermohonan,
              icon: _sedangMengajukan
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    )
                  : const Icon(Icons.send),
              label: Text(
                _sedangMengajukan
                    ? 'Memproses Pengajuan...'
                    : 'Ajukan Permohonan',
              ),
            ),
          ),
        ],
      ),
    );
  }
}