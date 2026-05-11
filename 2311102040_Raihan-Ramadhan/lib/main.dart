import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Modul 4 - Widgets',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, dynamic>> dataArray = const [
    {'nama': 'Apel', 'icon': Icons.apple, 'color': Colors.red},
    {
      'nama': 'Mangga',
      'icon': Icons.energy_savings_leaf,
      'color': Colors.orange,
    },
    {'nama': 'Jeruk', 'icon': Icons.circle, 'color': Colors.deepOrange},
    {'nama': 'Pisang', 'icon': Icons.looks_one, 'color': Colors.yellow},
    {'nama': 'Anggur', 'icon': Icons.grain, 'color': Colors.purple},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FF),
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        title: const Text(
          'Modul 4 - Flutter Widgets',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── 1. CONTAINER ─────────────────────────────
            _sectionTitle('1. Container'),
            Container(
              width: double.infinity,
              height: 90,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.indigo, Colors.purpleAccent],
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.indigo.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.widgets, color: Colors.white, size: 28),
                  SizedBox(width: 10),
                  Text(
                    'Ini adalah Container',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            _sectionTitle('2. GridView (6 item)'),
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                _gridItem('Item 1', Colors.red, Icons.looks_one),
                _gridItem('Item 2', Colors.orange, Icons.looks_two),
                _gridItem('Item 3', Colors.amber, Icons.looks_3),
                _gridItem('Item 4', Colors.green, Icons.looks_4),
                _gridItem('Item 5', Colors.blue, Icons.looks_5),
                _gridItem('Item 6', Colors.purple, Icons.looks_6),
              ],
            ),

            _sectionTitle('3. ListView (A, B, C)'),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _listTileCustom('Item A', Icons.star, Colors.indigo),
                  const Divider(height: 1),
                  _listTileCustom('Item B', Icons.favorite, Colors.pink),
                  const Divider(height: 1),
                  _listTileCustom('Item C', Icons.bolt, Colors.amber),
                ],
              ),
            ),

            _sectionTitle('4. ListView.builder (dari array)'),
            Container(
              height: 220,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: ListView.builder(
                itemCount: dataArray.length,
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemBuilder: (context, index) {
                  final item = dataArray[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: (item['color'] as Color).withOpacity(
                        0.15,
                      ),
                      child: Icon(
                        item['icon'] as IconData,
                        color: item['color'] as Color,
                      ),
                    ),
                    title: Text(
                      item['nama'],
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    trailing: const Icon(
                      Icons.chevron_right,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),

            _sectionTitle('5. ListView.separated (+ garis)'),
            Container(
              height: 220,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: ListView.separated(
                itemCount: dataArray.length,
                padding: const EdgeInsets.symmetric(vertical: 8),
                separatorBuilder: (_, __) => const Divider(
                  indent: 16,
                  endIndent: 16,
                  color: Colors.indigo,
                ),
                itemBuilder: (context, index) {
                  final item = dataArray[index];
                  return ListTile(
                    leading: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: (item['color'] as Color).withOpacity(0.15),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        item['icon'] as IconData,
                        color: item['color'] as Color,
                      ),
                    ),
                    title: Text(
                      item['nama'],
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      'Buah no. ${index + 1}',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  );
                },
              ),
            ),

            _sectionTitle('6. Stack (bertumpuk)'),
            SizedBox(
              height: 180,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 180,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Colors.indigo, Colors.purple],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  Positioned(
                    top: -20,
                    right: -20,
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -30,
                    left: -10,
                    child: Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.08),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 30,
                    left: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Stack Widget',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'Widget bertumpuk satu\ndi atas yang lain',
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 16,
                    right: 16,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Modul 4 ✨',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.indigo,
        ),
      ),
    );
  }

  Widget _gridItem(String label, Color color, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 32),
          const SizedBox(height: 6),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  Widget _listTileCustom(String title, IconData icon, Color color) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: color),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
    );
  }
}
