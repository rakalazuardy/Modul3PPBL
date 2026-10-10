import 'package:flutter/material.dart';

class HalamanBeranda extends StatelessWidget {
  const HalamanBeranda({super.key});

  final List<Map<String, dynamic>> pilar = const [
    {
      'nama': 'Smart Governance',
      'icon': Icons.account_balance,
      'deskripsi': 'Pemerintahan yang transparan dan terintegrasi.',
    },
    {
      'nama': 'Smart Branding',
      'icon': Icons.campaign,
      'deskripsi': 'Membangun citra kota yang inovatif dan menarik.',
    },
    {
      'nama': 'Smart Economy',
      'icon': Icons.trending_up,
      'deskripsi': 'Mendorong pertumbuhan ekonomi masyarakat.',
    },
    {
      'nama': 'Smart Living',
      'icon': Icons.home_work,
      'deskripsi': 'Meningkatkan kualitas hidup warga kota.',
    },
    {
      'nama': 'Smart Society',
      'icon': Icons.groups,
      'deskripsi': 'Membangun masyarakat yang inklusif dan aktif.',
    },
    {
      'nama': 'Smart Environment',
      'icon': Icons.eco,
      'deskripsi': 'Menjaga lingkungan melalui teknologi cerdas.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.location_city,
                  size: 48,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Nusantara Cerdas Mobile',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Portal layanan warga untuk mendukung '
                  'ekosistem Smart City.',
                  style: TextStyle(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Enam Pilar Smart City',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        ...pilar.map(
          (item) => Card(
            margin: const EdgeInsets.only(bottom: 10),
            child: ListTile(
              leading: CircleAvatar(
                child: Icon(
                  item['icon'] as IconData,
                ),
              ),
              title: Text(
                item['nama'] as String,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                item['deskripsi'] as String,
              ),
            ),
          ),
        ),
      ],
    );
  }
}