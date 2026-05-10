import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Modul 4 Widget UI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const WidgetUIDemo(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class WidgetUIDemo extends StatelessWidget {
  const WidgetUIDemo({super.key});

  @override
  Widget build(BuildContext context) {
    // Data array untuk ListView.builder
    final List<String> dataArray = ['Hamid', 'Sabirin', 'Hamid Sabirin', '2311102129'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tugas Praktikum Modul 4'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ScrollConfiguration(
        behavior: ScrollBehavior().copyWith(overscroll: false), // Menghilangkan efek overscroll (stretch/bounce)
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('1. Container', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Container(
                  width: 250,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 5, offset: const Offset(2, 2))
                    ],
                  ),
                  child: const Center(
                    child: Text('Container', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                  ),
                ),
                const Divider(height: 40, color: Colors.black),

                const Text('2. GridView (Min 6 item)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                GridView.count(
                  crossAxisCount: 3,
                  shrinkWrap: true, // Penting agar GridView bisa berada di dalam SingleChildScrollView
                  physics: const NeverScrollableScrollPhysics(), // Mematikan scroll internal GridView
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 1.5,
                  children: List.generate(6, (index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.blue.shade200,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text('Item ${index + 1}', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                      ),
                    );
                  }),
                ),
                const Divider(height: 40, color: Colors.black),

                const Text('3. ListView (Item A, B, C)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Card(color: Colors.blue.shade100, child: const ListTile(leading: CircleAvatar(child: Text('1', style: TextStyle(fontWeight: FontWeight.bold))), title: Text('Hamid', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)))),
                    Card(color: Colors.blue.shade100, child: const ListTile(leading: CircleAvatar(child: Text('2', style: TextStyle(fontWeight: FontWeight.bold))), title: Text('Sabirin', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)))),
                    Card(color: Colors.blue.shade100, child: const ListTile(leading: CircleAvatar(child: Text('3', style: TextStyle(fontWeight: FontWeight.bold))), title: Text('Hamid Sabirin', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)))),
                    Card(color: Colors.blue.shade100, child: const ListTile(leading: CircleAvatar(child: Text('4', style: TextStyle(fontWeight: FontWeight.bold))), title: Text('2311102129', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)))),
                  ],
                ),
                const Divider(height: 40, color: Colors.black),

                const Text('4. ListView.builder (Dari Array)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: dataArray.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.blue.shade100,
                      child: ListTile(
                        leading: const Icon(Icons.check_circle, color: Colors.blue),
                        title: Text(dataArray[index], style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                      ),
                    );
                  },
                ),
                const Divider(height: 40, color: Colors.black),

                const Text('5. ListView.separated (Dengan Garis)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: dataArray.length,
                  separatorBuilder: (context, index) => const Divider(color: Colors.black, thickness: 2),
                  itemBuilder: (context, index) {
                    return Container(
                      color: Colors.blue.shade100,
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                      child: Row(
                        children: [
                          const Icon(Icons.format_list_bulleted, color: Colors.blue),
                          const SizedBox(width: 10),
                          Text(dataArray[index], style: const TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    );
                  },
                ),
                const Divider(height: 40, color: Colors.black),

                const Text('6. Stack (Tampilan Bertumpuk)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(width: 200, height: 200, decoration: BoxDecoration(color: Colors.lightBlue.shade200, borderRadius: BorderRadius.circular(16))),
                    Container(width: 140, height: 140, decoration: BoxDecoration(color: Colors.lightBlue.shade400, borderRadius: BorderRadius.circular(16))),
                    Container(width: 80, height: 80, decoration: BoxDecoration(color: Colors.lightBlue.shade700, borderRadius: BorderRadius.circular(16))),
                    const Text('Stack', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
      ),
    );
  }
}
