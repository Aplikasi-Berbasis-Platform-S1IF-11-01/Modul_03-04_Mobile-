import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tugas Praktikum Modul 3_4',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
      ),
      home: const PraktikumScreen(),
    );
  }
}

class PraktikumScreen extends StatelessWidget {
  const PraktikumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Data array untuk ListView.builder dan ListView.separated
    final List<String> dataBuilder = ['Avrizal', 'Setyo', 'Aji', 'Nugroho'];
    final List<String> dataSeparated = [
      'Avrizal Setyo Aji Nugroho',
      '2311102145',
      'Sayonara',
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Tugas Modul 3_4')),
      // SingleChildScrollView agar seluruh halaman bisa di-scroll ke bawah
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. CONTAINER
            const SectionTitle(title: '1. Container'),
            Container(
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(15),
              ),
              alignment: Alignment.center,
              child: const Text(
                'Ini adalah Container Berwarna',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 24),

            // 2. STACK
            const SectionTitle(title: '2. Stack'),
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      color: Colors.redAccent,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const Text(
                    'Stack Cihuy',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // 3. GRIDVIEW (Min 6 item)
            const SectionTitle(title: '3. GridView'),
            GridView.count(
              shrinkWrap: true, // Wajib jika di dalam SingleChildScrollView
              physics:
                  const NeverScrollableScrollPhysics(), // Scroll mengikuti layar utama
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: List.generate(6, (index) {
                return Container(
                  color: Colors.teal[(index % 9 + 1) * 100],
                  alignment: Alignment.center,
                  child: Text(
                    'Grid ${index + 1}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                );
              }),
            ),
            const SizedBox(height: 24),

            // 4. LISTVIEW (3 item: A, B, C)
            const SectionTitle(title: '4. ListView Biasa'),
            Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  ListTile(
                    leading: CircleAvatar(child: Text('A')),
                    title: Text('Item A'),
                  ),
                  ListTile(
                    leading: CircleAvatar(child: Text('B')),
                    title: Text('Item B'),
                  ),
                  ListTile(
                    leading: CircleAvatar(child: Text('C')),
                    title: Text('Item C'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // 5. LISTVIEW.BUILDER
            const SectionTitle(title: '5. ListView.builder'),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: dataBuilder.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 2,
                  child: ListTile(
                    title: Text(dataBuilder[index]),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  ),
                );
              },
            ),
            const SizedBox(height: 24),

            // 6. LISTVIEW.SEPARATED
            const SectionTitle(title: '6. ListView.separated'),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: dataSeparated.length,
                separatorBuilder: (context, index) =>
                    const Divider(color: Colors.black54, thickness: 1),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'Profesi: ${dataSeparated[index]}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 40), // Jarak aman di bagian paling bawah
          ],
        ),
      ),
    );
  }
}

// Widget tambahan untuk membuat judul tiap seksi menjadi lebih rapi
class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.blueGrey,
        ),
      ),
    );
  }
}
