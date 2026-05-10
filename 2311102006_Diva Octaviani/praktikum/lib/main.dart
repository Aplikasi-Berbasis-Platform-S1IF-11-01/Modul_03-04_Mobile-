import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Modul 3 & 4',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text('Modul 3 & 4 - Mobile'),
        centerTitle: true,
        backgroundColor: const Color(0xFF4B164C),
        foregroundColor: const Color(0xFFF5F5F5),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF8E7F6),
                borderRadius: BorderRadius.circular(12),
                border: const Border(
                  left: BorderSide(color: Color(0xFF4B164C), width: 6),
                ),
              ),
              child: const Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0xFF4B164C),
                    foregroundColor: Color(0xFFF5F5F5),
                    child: Icon(Icons.person),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Diva Octaviani',
                        style: TextStyle(
                          color: Color(0xFF4B164C),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'NIM: 2311102006',
                        style: TextStyle(color: Color(0xFF7A577C)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // 1. Container
            const Text(
              '1. Container',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4B164C),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: const Color(0xFFDD88CF),
                border: Border.all(color: const Color(0xFF4B164C), width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: const Text(
                'Ini Container Berwarna',
                style: TextStyle(
                  color: Color(0xFF4B164C),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 24),

            // 2. GridView
            const Text(
              '2. GridView',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4B164C),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 280,
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                children: List.generate(6, (index) {
                  bool isFilled = index % 2 == 0;
                  return Container(
                    decoration: BoxDecoration(
                      color: isFilled
                          ? const Color(0xFF4B164C)
                          : const Color(0xFFF8E7F6),
                      border: isFilled
                          ? null
                          : Border.all(
                              color: const Color(0xFFDD88CF),
                              width: 2,
                            ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Item ${index + 1}',
                      style: TextStyle(
                        color: isFilled
                            ? const Color(0xFFF5F5F5)
                            : const Color(0xFF4B164C),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 24),

            // 3. ListView
            const Text(
              '3. ListView',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4B164C),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 180,
              child: ListView(
                children: const [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFF4B164C),
                      foregroundColor: Color(0xFFF5F5F5),
                      child: Text('A'),
                    ),
                    title: Text(
                      'Item A',
                      style: TextStyle(color: Color(0xFF4B164C)),
                    ),
                    subtitle: Text(
                      'Deskripsi item A',
                      style: TextStyle(color: Color(0xFF7A577C)),
                    ),
                    tileColor: Color(0xFFF8E7F6),
                    shape: Border(
                      left: BorderSide(color: Color(0xFFDD88CF), width: 4),
                    ),
                  ),
                  SizedBox(height: 8),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFF4B164C),
                      foregroundColor: Color(0xFFF5F5F5),
                      child: Text('B'),
                    ),
                    title: Text(
                      'Item B',
                      style: TextStyle(color: Color(0xFF4B164C)),
                    ),
                    subtitle: Text(
                      'Deskripsi item B',
                      style: TextStyle(color: Color(0xFF7A577C)),
                    ),
                    tileColor: Color(0xFFF8E7F6),
                    shape: Border(
                      left: BorderSide(color: Color(0xFFDD88CF), width: 4),
                    ),
                  ),
                  SizedBox(height: 8),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFF4B164C),
                      foregroundColor: Color(0xFFF5F5F5),
                      child: Text('C'),
                    ),
                    title: Text(
                      'Item C',
                      style: TextStyle(color: Color(0xFF4B164C)),
                    ),
                    subtitle: Text(
                      'Deskripsi item C',
                      style: TextStyle(color: Color(0xFF7A577C)),
                    ),
                    tileColor: Color(0xFFF8E7F6),
                    shape: Border(
                      left: BorderSide(color: Color(0xFFDD88CF), width: 4),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // 4. ListView.builder
            const Text(
              '4. ListView.builder',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4B164C),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 220,
              child: ListView.builder(
                itemCount: mahasiswa.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: const Color(0xFFF8E7F6),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Color(0xFFDD88CF)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: const Color(0xFFDD88CF),
                        foregroundColor: const Color(0xFF4B164C),
                        child: Text('${index + 1}'),
                      ),
                      title: Text(
                        mahasiswa[index]['nama']!,
                        style: const TextStyle(color: Color(0xFF4B164C)),
                      ),
                      subtitle: Text(
                        mahasiswa[index]['nim']!,
                        style: const TextStyle(color: Color(0xFF7A577C)),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Color(0xFF4B164C),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),

            // 5. ListView.separated
            const Text(
              '5. ListView.separated',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4B164C),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 300,
              child: ListView.separated(
                itemCount: buah.length,
                separatorBuilder: (context, index) => const Divider(
                  color: Color(0xFFDD88CF),
                  thickness: 2,
                  height: 1,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(14),
                    color: const Color(0xFFF8E7F6),
                    child: Row(
                      children: [
                        Container(
                          width: 12,
                          height: 12,
                          decoration: const BoxDecoration(
                            color: Color(0xFF4B164C),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          buah[index],
                          style: const TextStyle(
                            color: Color(0xFF4B164C),
                            fontSize: 16,
                          ),
                        ),
                        const Spacer(),
                        const Icon(Icons.bookmark, color: Color(0xFF7A577C)),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),

            // 6. Stack
            const Text(
              '6. Stack',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4B164C),
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: SizedBox(
                width: 240,
                height: 180,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 240,
                      height: 180,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF8E7F6),
                        border: Border.all(
                          color: const Color(0xFFDD88CF),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    Container(
                      width: 170,
                      height: 130,
                      decoration: BoxDecoration(
                        color: const Color(0xFFDD88CF),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    Container(
                      width: 110,
                      height: 70,
                      decoration: BoxDecoration(
                        color: const Color(0xFF4B164C),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 6,
                            offset: const Offset(2, 4),
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'Stack!',
                        style: TextStyle(
                          color: Color(0xFFF5F5F5),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

// Data array untuk ListView.builder
final List<Map<String, String>> mahasiswa = [
  {'nama': 'Diva Octaviani', 'nim': 'NIM: 2311102006'},
  {'nama': 'Jingga Puspita', 'nim': 'NIM: 2302006111'},
  {'nama': 'Zaina Zulfa', 'nim': 'NIM: 2300611102'},
];

// Data array untuk ListView.separated
final List<String> buah = ['Manggis', 'Sawo', 'Alpukat', 'Leci', 'Mangga'];
