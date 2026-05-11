import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Top Up Game',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.grey.shade50,
      ),
      home: const PraktikumScreen(),
    );
  }
}

class PraktikumScreen extends StatelessWidget {
  const PraktikumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Data array untuk ListView.builder (Paket Top Up)
    final List<String> paketTopUp = [
      '86 Diamonds - Rp 20.000',
      '172 Diamonds - Rp 40.000',
      '257 Diamonds - Rp 60.000',
      '344 Diamonds - Rp 80.000',
      '706 Diamonds - Rp 160.000'
    ];

    // Data dummy game untuk GridView
    final List<Map<String, dynamic>> games = [
      {'nama': 'MLBB', 'icon': Icons.security, 'color': Colors.blue},
      {'nama': 'Free Fire', 'icon': Icons.local_fire_department, 'color': Colors.orange},
      {'nama': 'PUBG M', 'icon': Icons.sports_esports, 'color': Colors.brown},
      {'nama': 'Genshin', 'icon': Icons.explore, 'color': Colors.teal},
      {'nama': 'Valorant', 'icon': Icons.track_changes, 'color': Colors.red},
      {'nama': 'Roblox', 'icon': Icons.widgets, 'color': Colors.grey},
    ];

    // Data dummy riwayat untuk ListView.separated
    final List<String> riwayat = [
      'Top Up 86 DM - MLBB (Berhasil)',
      'Top Up 344 DM - MLBB (Berhasil)',
      'Top Up 100 UC - PUBG M (Pending)',
      'Top Up Welkin - Genshin (Gagal)',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('GamerTopUp 🎮', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ==========================================
            // 1. Container (Kartu Saldo)
            // ==========================================
            const SectionTitle(title: 'Informasi Saldo'),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.deepPurple, Colors.purpleAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(color: Colors.purple.withOpacity(0.3), blurRadius: 10, offset: const Offset(0, 5)),
                ],
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('GamerPay Balance', style: TextStyle(color: Colors.white70, fontSize: 14)),
                  SizedBox(height: 8),
                  Text('Rp 250.000', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // ==========================================
            // 2. GridView (Daftar Game)
            // ==========================================
            const SectionTitle(title: 'Pilih Game'),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.1,
              children: List.generate(games.length, (index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(games[index]['icon'], color: games[index]['color'], size: 36),
                      const SizedBox(height: 8),
                      Text(games[index]['nama'], style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                    ],
                  ),
                );
              }),
            ),
            const SizedBox(height: 24),

            // ==========================================
            // 3. ListView (Metode Pembayaran)
            // ==========================================
            const SectionTitle(title: 'Metode Pembayaran'),
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                Card(child: ListTile(leading: Icon(Icons.account_balance_wallet, color: Colors.blue), title: Text('E-Wallet (OVO, Dana, GoPay)'))),
                Card(child: ListTile(leading: Icon(Icons.account_balance, color: Colors.green), title: Text('Transfer Bank (BCA, Mandiri, BRI)'))),
                Card(child: ListTile(leading: Icon(Icons.storefront, color: Colors.orange), title: Text('Minimarket (Alfamart, Indomaret)'))),
              ],
            ),
            const SizedBox(height: 24),

            // ==========================================
            // 4. ListView.builder (Paket Top Up)
            // ==========================================
            const SectionTitle(title: 'Pilih Paket Nominal'),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: paketTopUp.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.amber.shade50,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.amber.shade300, width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.diamond, color: Colors.amber),
                    title: Text(paketTopUp[index], style: const TextStyle(fontWeight: FontWeight.w600)),
                    trailing: const Icon(Icons.add_shopping_cart, color: Colors.deepPurple),
                  ),
                );
              },
            ),
            const SizedBox(height: 24),

            // ==========================================
            // 5. ListView.separated (Riwayat Transaksi)
            // ==========================================
            const SectionTitle(title: 'Riwayat Transaksi'),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: riwayat.length,
                separatorBuilder: (context, index) => const Divider(height: 1, thickness: 1),
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.history, color: Colors.grey),
                    title: Text(riwayat[index], style: const TextStyle(fontSize: 14)),
                    trailing: const Icon(Icons.chevron_right, size: 20),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),

            // ==========================================
            // 6. Stack (Banner Promo)
            // ==========================================
            const SectionTitle(title: 'Promo Spesial'),
            Center(
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  // Latar Belakang Kartu Promo
                  Container(
                    width: double.infinity,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.pinkAccent,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  // Dekorasi lingkaran di belakang
                  Positioned(
                    right: -20,
                    top: -20,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), shape: BoxShape.circle),
                    ),
                  ),
                  // Teks Promo
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('CASHBACK 50%', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                        SizedBox(height: 4),
                        Text('Khusus Top Up Mobile Legends', style: TextStyle(color: Colors.white, fontSize: 14)),
                      ],
                    ),
                  ),
                  // Ikon / Badge melayang
                  Positioned(
                    right: 20,
                    bottom: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                      child: const Text('KLAIM', style: TextStyle(color: Colors.pinkAccent, fontWeight: FontWeight.bold)),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

// Widget Bantuan untuk Judul Bagian
class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
      ),
    );
  }
}