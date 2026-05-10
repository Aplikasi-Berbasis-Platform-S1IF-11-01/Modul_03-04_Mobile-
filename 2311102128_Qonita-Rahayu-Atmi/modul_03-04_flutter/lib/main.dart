import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Modul 4 Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const Modul4Page(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Modul4Page extends StatelessWidget {
  const Modul4Page({super.key});

  @override
  Widget build(BuildContext context) {
    // Array data untuk ListView.builder
    final List<String> builderData = ['Data Array 1', 'Data Array 2', 'Data Array 3', 'Data Array 4'];

    // Array data untuk ListView.separated
    final List<String> separatedData = ['Apple', 'Banana', 'Cherry', 'Date'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Modul 4 - 2311102128', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Container (Kotak Berwarna)
              const Text('1. Container', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue)),
              const SizedBox(height: 8),
              Container(
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(2, 2)),
                  ],
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Ini adalah Container Berwarna',
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 24),

              // 2. GridView (Minimal 6 Item)
              const Text('2. GridView (Minimal 6 item)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue)),
              const SizedBox(height: 8),
              GridView.count(
                crossAxisCount: 3, 
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 2.5,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(), 
                children: List.generate(6, (index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.blue.shade300,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,
                    child: Text('Grid ${index + 1}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  );
                }),
              ),
              const SizedBox(height: 16),

              // 3. ListView (3 Item A, B, C)
              const Text('3. ListView (3 Item: A, B, C)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue)),
              const SizedBox(height: 8),
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  ListTile(leading: CircleAvatar(backgroundColor: Colors.blue, child: Text('A', style: TextStyle(color: Colors.white))), title: Text('Item A')),
                  ListTile(leading: CircleAvatar(backgroundColor: Colors.blue, child: Text('B', style: TextStyle(color: Colors.white))), title: Text('Item B')),
                  ListTile(leading: CircleAvatar(backgroundColor: Colors.blue, child: Text('C', style: TextStyle(color: Colors.white))), title: Text('Item C')),
                ],
              ),
              const SizedBox(height: 16),

              // 4. ListView.builder (List dari data array)
              const Text('4. ListView.builder', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue)),
              const SizedBox(height: 8),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: builderData.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.white,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.blue, width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(builderData[index], style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.blue)),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),

              // 5. ListView.separated (List + garis pembatas)
              const Text('5. ListView.separated', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue)),
              const SizedBox(height: 8),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: separatedData.length,
                separatorBuilder: (context, index) => const Divider(color: Colors.blue, thickness: 1.5),
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(separatedData[index], style: const TextStyle(color: Colors.black87)),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.blue),
                  );
                },
              ),
              const SizedBox(height: 16),

              // 6. Stack (Tampilan Bertumpuk)
              const Text('6. Stack', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue)),
              const SizedBox(height: 8),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  Container(
                    height: 90,
                    width: 250,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                  ),
                  const Text(
                    'Teks di Atas Stack',
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
