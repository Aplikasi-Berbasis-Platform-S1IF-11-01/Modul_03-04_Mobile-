import 'package:flutter/material.dart';

void main() => runApp(const MindEaseApp());

class MindEaseApp extends StatelessWidget {
  const MindEaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.teal,
      ),
      home: const MentalHealthScreen(),
    );
  }
}

class MentalHealthScreen extends StatelessWidget {
  const MentalHealthScreen({super.key});

  // Data untuk ListView.builder
  final List<Map<String, String>> affirmations = const [
    {"quote": "You are enough.", "sub": "Remind yourself today"},
    {"quote": "Take a deep breath.", "sub": "Inhale peace, exhale stress"},
    {"quote": "One step at a time.", "sub": "Progress is progress"},
    {"quote": "Progress over perfection.", "sub": "Keep moving forward"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFB),
      appBar: AppBar(
        title: const Text("MindEase", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. STACK (Banner Modern)
              const Text("Daily Focus", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              Stack(
                children: [
                  Container(
                    height: 160,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF80CBC4), Color(0xFF4DB6AC)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.teal.withOpacity(0.3),
                          blurRadius: 15,
                          offset: const Offset(0, 8),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    right: -20,
                    top: -20,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white.withOpacity(0.1),
                    ),
                  ),
                  const Positioned.fill(
                    child: Center(
                      child: Text(
                        "How are you feeling today?",
                        style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // 2. GRIDVIEW (Self-Care Activities - 6 Item)
              const Text("Self-Care Activities", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                childAspectRatio: 2.5,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                children: [
                  _buildGridItem("Stay Hydrated", Icons.water_drop, Colors.blue.shade50),
                  _buildGridItem("Journaling", Icons.edit, Colors.orange.shade50),
                  _buildGridItem("Mindfulness", Icons.spa, Colors.green.shade50),
                  _buildGridItem("Walk", Icons.directions_run, Colors.red.shade50),
                  _buildGridItem("Reading", Icons.menu_book, Colors.purple.shade50),
                  _buildGridItem("Sleep", Icons.bedtime, Colors.indigo.shade50),
                ],
              ),
              const SizedBox(height: 30),

              // 3. LISTVIEW (Main Categories - A, B, C)
              const Text("Main Categories", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              SizedBox(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildCategoryChip("A. Meditation", Colors.teal),
                    _buildCategoryChip("B. Journaling", Colors.teal),
                    _buildCategoryChip("C. Breathing", Colors.teal),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // 4. LISTVIEW.BUILDER (Daily Affirmations)
              const Text("Daily Affirmations", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: affirmations.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 0,
                    margin: const EdgeInsets.only(bottom: 10),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    child: ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Color(0xFFFFEBEE),
                        child: Icon(Icons.favorite, color: Colors.redAccent, size: 20),
                      ),
                      title: Text(affirmations[index]['quote']!),
                      subtitle: Text(affirmations[index]['sub']!),
                    ),
                  );
                },
              ),
              const SizedBox(height: 30),

              // 5. LISTVIEW.SEPARATED (Emergency Contacts)
              const Text("Emergency Contacts", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  separatorBuilder: (context, index) => const Divider(height: 1, indent: 20, endIndent: 20),
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const Icon(Icons.person_pin, color: Colors.teal),
                      title: Text("Counselor ${index + 1}"),
                      trailing: const Icon(Icons.call, color: Colors.green, size: 20),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Widget Helper untuk Grid Item
  Widget _buildGridItem(String title, IconData icon, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 20, color: Colors.black87),
          const SizedBox(width: 8),
          Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  // Widget Helper untuk Category Chip
  Widget _buildCategoryChip(String label, Color color) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Center(
        child: Text(label, style: TextStyle(color: color, fontWeight: FontWeight.bold)),
      ),
    );
  }
}