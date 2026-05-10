import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UI Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Widget Demo'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. CONTAINER
              const Text(
                '1. Container Widget',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    'Container Berwarna Oranye',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // 2. GRIDVIEW
              const Text(
                '2. GridView',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 200,
                child: GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.5,
                  children: List.generate(6, (index) {
                    return Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.blue.shade400,
                            Colors.purple.shade400,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          'Item ${index + 1}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 24),

              // 3. LISTVIEW
              const Text(
                '3. ListView',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    const ListTile(
                      leading: Icon(Icons.filter_1, color: Colors.red),
                      title: Text('A', style: TextStyle(fontSize: 18)),
                    ),
                    Container(
                      color: Colors.grey.shade100,
                      child: const ListTile(
                        leading: Icon(Icons.filter_2, color: Colors.green),
                        title: Text('B', style: TextStyle(fontSize: 18)),
                      ),
                    ),
                    const ListTile(
                      leading: Icon(Icons.filter_3, color: Colors.blue),
                      title: Text('C', style: TextStyle(fontSize: 18)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // 4. LISTVIEW.BUILDER
              const Text(
                '4. ListView.builder',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: fruits.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const Icon(Icons.favorite, color: Colors.pink),
                      title: Text(fruits[index]),
                      subtitle: Text('Buah ke-${index + 1}'),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),

              // 5. LISTVIEW.SEPARATED
              const Text(
                '5. ListView.separated',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: animals.length,
                  separatorBuilder: (context, index) {
                    return const Divider(
                      color: Colors.grey,
                      thickness: 1,
                      indent: 60,
                      endIndent: 16,
                    );
                  },
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Icon(
                        animalIcons[index],
                        color: Colors.orange,
                      ),
                      title: Text(animals[index]),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),

              // 6. STACK
              const Text(
                '6. Stack Widget',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 200,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Layer 1: Kotak merah besar
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.red.shade300,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    // Layer 2: Kotak biru sedang
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade300,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    // Layer 3: Kotak hijau kecil
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.green.shade300,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    // Layer 4: Text di paling atas
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.7),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        'STACK\nBERTUMPUK',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
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
      ),
    );
  }
}

// Data array untuk ListView.builder
const List<String> fruits = [
  'Apel',
  'Jeruk',
  'Mangga',
  'Pisang',
  'Anggur',
  'Semangka',
];

// Data array untuk ListView.separated
const List<String> animals = [
  'Kucing',
  'Anjing',
  'Kelinci',
  'Burung',
  'Ikan',
];

// Icon untuk setiap animal
const List<IconData> animalIcons = [
  Icons.pets,
  Icons.pets,
  Icons.pets,
  Icons.flutter_dash,
  Icons.set_meal,
];