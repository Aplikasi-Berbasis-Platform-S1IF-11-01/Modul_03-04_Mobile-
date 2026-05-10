import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'modul 4',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        scaffoldBackgroundColor: const Color(0xFFFFF0F5),
      ),
      home: const ModulEmpatScreen(),
    );
  }
}

class ModulEmpatScreen extends StatelessWidget {
  const ModulEmpatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> arrayData = [
      'blekyy',
      'Picu',
      'Muja',
      'Aisyah Anis Mazaya',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Modul 4 Widget...'),
        backgroundColor: Colors.pink[200],
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. WIDGET CONTAINER
            const SectionTitle(title: '1. Container'),
            Container(
              width: double.infinity,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.pink[100],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.pink, width: 1),
              ),
              alignment: Alignment.center,
              child: const Text(
                'Tugas Praktikum UI',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),

            // 2. WIDGET GRIDVIEW
            const SectionTitle(title: '2. GridView (6 Item)'),
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              children: List.generate(6, (index) {
                return Container(
                  color: Colors.pink[200],
                  alignment: Alignment.center,
                  child: Text(
                    'Menu ${index + 1}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 20),

            // 3. WIDGET LISTVIEW (STATIS)
            const SectionTitle(title: '3. ListView (3 Item)'),
            Container(
              height: 155,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  ListTile(
                    title: Text('Ais'),
                    leading: Icon(
                      Icons.person,
                      color: Colors.pinkAccent,
                      size: 18,
                    ),
                  ),
                  ListTile(
                    title: Text('Laporan KP'),
                    leading: Icon(
                      Icons.description,
                      color: Colors.pinkAccent,
                      size: 18,
                    ),
                  ),
                  ListTile(
                    title: Text('Laporan Sempro'),
                    leading: Icon(
                      Icons.book,
                      color: Colors.pinkAccent,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // 4. WIDGET LISTVIEW.BUILDER
            const SectionTitle(title: '4. ListView.builder'),
            Container(
              decoration: BoxDecoration(
                color: Colors.pink[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: arrayData.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Anggota: ${arrayData[index]}'),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                      color: Colors.pink,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),

            // 5. WIDGET LISTVIEW.SEPARATED
            const SectionTitle(title: '5. ListView.separated'),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: arrayData.length,
                separatorBuilder: (context, index) =>
                    Divider(color: Colors.pink[100], thickness: 1),
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Tim Project: ${arrayData[index]}'),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),

            // 6. WIDGET STACK
            const SectionTitle(title: '6. Stack'),
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.pink[100],
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  Container(width: 140, height: 140, color: Colors.pink[200]),
                  Positioned(
                    bottom: 20,
                    right: 20,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.white,
                      child: const Text(
                        'Praktikum Modul 4',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.pink,
                        ),
                      ),
                    ),
                  ),
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

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.pink[800],
        ),
      ),
    );
  }
}
