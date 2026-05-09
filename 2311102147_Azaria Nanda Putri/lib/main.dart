import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Praktikum Modul 4 Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Data untuk ListView.builder
  final List<String> builderItems = const [
    'Flutter',
    'Dart',
    'Android',
    'Widget',
  ];

  // Data untuk ListView.separated
  final List<String> separatedItems = const [
    'Belajar Flutter',
    'Belajar Dart',
    'Belajar Android Studio',
    'Belajar Widget',
    'Belajar Layout',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ─── AppBar ───────────────────────────────────────────────
      appBar: AppBar(
        backgroundColor: Colors.pink.shade400,
        title: const Text(
          'Praktikum Modul 4 Flutter',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(36),
          child: Container(
            color: Colors.pink.shade300,
            padding: const EdgeInsets.symmetric(vertical: 6),
            width: double.infinity,
            child: const Column(
              children: [
                Text(
                  'Azaria Nanda Putri',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
                Text(
                  'NIM: 2311102147',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      // ─── Body: SingleChildScrollView ──────────────────────────
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ════════════════════════════════════════
            // 1. CONTAINER
            // ════════════════════════════════════════
            _sectionTitle('1. Container'),
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.pink.shade100,
                border: Border.all(color: Colors.pink.shade400, width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: Text(
                'Ini Container',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink.shade700,
                ),
              ),
            ),

            const SizedBox(height: 24),

            // ════════════════════════════════════════
            // 2. GRIDVIEW
            // ════════════════════════════════════════
            _sectionTitle('2. GridView'),
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              children: [
                _gridItem('Item 1', Colors.pink.shade200),
                _gridItem('Item 2', Colors.purple.shade200),
                _gridItem('Item 3', Colors.orange.shade200),
                _gridItem('Item 4', Colors.teal.shade200),
                _gridItem('Item 5', Colors.blue.shade200),
                _gridItem('Item 6', Colors.amber.shade200),
              ],
            ),

            const SizedBox(height: 24),

            // ════════════════════════════════════════
            // 3. LISTVIEW (statis)
            // ════════════════════════════════════════
            _sectionTitle('3. ListView (Statis)'),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.pink.shade200),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _staticListTile('A', 'Item A', Colors.pink.shade400),
                  _staticListTile('B', 'Item B', Colors.purple.shade400),
                  _staticListTile('C', 'Item C', Colors.orange.shade400),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ════════════════════════════════════════
            // 4. LISTVIEW.BUILDER
            // ════════════════════════════════════════
            _sectionTitle('4. ListView.builder'),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: builderItems.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.pink.shade50,
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Colors.pink.shade200),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.pink.shade400,
                      child: Text(
                        '${index + 1}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    title: Text(
                      builderItems[index],
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios,
                        size: 16, color: Colors.pink.shade300),
                  ),
                );
              },
            ),

            const SizedBox(height: 24),

            // ════════════════════════════════════════
            // 5. LISTVIEW.SEPARATED
            // ════════════════════════════════════════
            _sectionTitle('5. ListView.separated'),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.pink.shade200),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: separatedItems.length,
                separatorBuilder: (context, index) => Divider(
                  color: Colors.pink.shade200,
                  thickness: 1,
                  indent: 16,
                  endIndent: 16,
                  height: 0,
                ),
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.favorite,
                        color: Colors.pink.shade400, size: 20),
                    title: Text(separatedItems[index]),
                  );
                },
              ),
            ),

            const SizedBox(height: 24),

            // ════════════════════════════════════════
            // 6. STACK
            // ════════════════════════════════════════
            _sectionTitle('6. Stack'),
            Stack(
              alignment: Alignment.center,
              children: [
                // Layer bawah: kotak gradasi
                Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.pink.shade300, Colors.purple.shade300],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                // Layer tengah: kotak putih semi-transparan
                Container(
                  width: 220,
                  height: 90,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white54, width: 1.5),
                  ),
                ),
                // Layer atas: teks & icon
                const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.layers, color: Colors.white, size: 30),
                    SizedBox(height: 4),
                    Text(
                      'Ini adalah Stack!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Widget bertumpuk',
                      style: TextStyle(color: Colors.white70, fontSize: 13),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 24),

            // ════════════════════════════════════════
            // Footer identitas
            // ════════════════════════════════════════
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.pink.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.pink.shade200),
              ),
              child: Column(
                children: [
                  Icon(Icons.person, color: Colors.pink.shade400, size: 28),
                  const SizedBox(height: 4),
                  Text(
                    'Azaria Nanda Putri',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.pink.shade700,
                    ),
                  ),
                  Text(
                    'NIM: 2311102147',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.pink.shade500,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Praktikum Modul 4 — Flutter Widget Dasar',
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
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

  // ─── Helper: judul setiap bagian ──────────────────────────────
  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 18,
            decoration: BoxDecoration(
              color: Colors.pink.shade400,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.pink.shade700,
            ),
          ),
        ],
      ),
    );
  }

  // ─── Helper: item GridView ─────────────────────────────────────
  Widget _gridItem(String label, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
      ),
    );
  }

  // ─── Helper: item ListView statis ─────────────────────────────
  Widget _staticListTile(String avatar, String title, Color color) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color,
        child: Text(avatar, style: const TextStyle(color: Colors.white)),
      ),
      title: Text(title),
    );
  }
}
