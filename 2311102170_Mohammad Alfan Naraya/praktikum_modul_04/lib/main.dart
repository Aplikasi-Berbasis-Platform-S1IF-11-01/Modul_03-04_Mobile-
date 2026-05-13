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
      title: 'Alfan Lab Modul 4',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF121212),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple, brightness: Brightness.dark),
      ),
      home: const MainDashboard(),
    );
  }
}

class MainDashboard extends StatelessWidget {
  const MainDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FLUTTER WIDGETS", style: TextStyle(letterSpacing: 2, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 10),
            _buildTile(context, "Container", "Box decoration & Shape", Colors.orangeAccent, const PageContainer()),
            _buildTile(context, "GridView", "Grid layout 6 items", Colors.pinkAccent, const PageGrid()),
            _buildTile(context, "ListView", "Static items list", Colors.blueAccent, const PageListStatic()),
            _buildTile(context, "ListView.builder", "Dynamic array data", Colors.greenAccent, const PageListBuilder()),
            _buildTile(context, "ListView.separated", "List with separators", Colors.purpleAccent, const PageListSeparated()),
            _buildTile(context, "Stack", "Overlapping widgets", Colors.redAccent, const PageStack()),
          ],
        ),
      ),
    );
  }

  Widget _buildTile(BuildContext context, String title, String sub, Color color, Widget target) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [color.withOpacity(0.2), Colors.white10],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(color: Colors.white12),
      ),
      child: ListTile(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => target)),
        leading: Icon(Icons.circle, color: color, size: 12),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        subtitle: Text(sub, style: const TextStyle(color: Colors.white60, fontSize: 12)),
        trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.white38),
      ),
    );
  }
}

// --- DETAIL PAGES ---

class PageContainer extends StatelessWidget {
  const PageContainer({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Container")),
      body: Center(
        child: Container(
          width: 150, height: 150,
          decoration: BoxDecoration(
            color: Colors.orangeAccent,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [BoxShadow(color: Colors.orangeAccent.withOpacity(0.4), blurRadius: 20)],
          ),
          child: const Center(child: Text("UI Box", style: TextStyle(fontWeight: FontWeight.bold))),
        ),
      ),
    );
  }
}

class PageGrid extends StatelessWidget {
  const PageGrid({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("GridView")),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(20),
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        children: List.generate(6, (i) => Container(
          decoration: BoxDecoration(color: Colors.pinkAccent.withOpacity(0.1), borderRadius: BorderRadius.circular(15), border: Border.all(color: Colors.pinkAccent)),
          child: Center(child: Text("Item ${i+1}")),
        )),
      ),
    );
  }
}

class PageListStatic extends StatelessWidget {
  const PageListStatic({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Standard List")),
      body: ListView(
        children: const [
          ListTile(title: Text("A"), trailing: Icon(Icons.star_border)),
          ListTile(title: Text("B"), trailing: Icon(Icons.star_border)),
          ListTile(title: Text("C"), trailing: Icon(Icons.star_border)),
        ],
      ),
    );
  }
}

class PageListBuilder extends StatelessWidget {
  const PageListBuilder({super.key});
  @override
  Widget build(BuildContext context) {
    final items = ["PHP", "SQL", "JavaScript", "Dart", "C++"];
    return Scaffold(
      appBar: AppBar(title: const Text("Builder List")),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (ctx, i) => ListTile(title: Text(items[i]), leading: const Icon(Icons.code)),
      ),
    );
  }
}

class PageListSeparated extends StatelessWidget {
  const PageListSeparated({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Separated List")),
      body: ListView.separated(
        itemCount: 4,
        separatorBuilder: (ctx, i) => const Divider(color: Colors.purpleAccent, indent: 20, endIndent: 20),
        itemBuilder: (ctx, i) => ListTile(title: Text("Separated Row $i")),
      ),
    );
  }
}

class PageStack extends StatelessWidget {
  const PageStack({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Stack Widget")),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(width: 200, height: 200, color: Colors.grey[900]),
            Container(width: 100, height: 100, color: Colors.redAccent.withOpacity(0.5)),
            const Text("Layered", style: TextStyle(letterSpacing: 4)),
          ],
        ),
      ),
    );
  }
}