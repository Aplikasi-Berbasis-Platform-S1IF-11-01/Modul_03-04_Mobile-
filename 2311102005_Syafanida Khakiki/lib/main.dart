import 'package:flutter/material.dart';

void main() => runApp(const SnapFoodApp());

class SnapFoodApp extends StatelessWidget {
  const SnapFoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.deepOrange,
        fontFamily: 'Georgia',
      ),
      home: const SnapFoodScreen(),
    );
  }
}

class SnapFoodScreen extends StatefulWidget {
  const SnapFoodScreen({super.key});

  @override
  State<SnapFoodScreen> createState() => _SnapFoodScreenState();
}

class _SnapFoodScreenState extends State<SnapFoodScreen> {
  int _selectedCategory = 0;

  // Data untuk ListView (kategori horizontal) — 3 item A, B, C
  final List<Map<String, dynamic>> categories = const [
    {"label": "A. Trending", "icon": Icons.local_fire_department},
    {"label": "B. Asian", "icon": Icons.rice_bowl},
    {"label": "C. Dessert", "icon": Icons.cake},
  ];

  // Data untuk ListView.builder (chef highlights)
  final List<Map<String, dynamic>> chefs = const [
    {"name": "Chef Arya", "specialty": "Nusantara Fusion", "rating": "4.9"},
    {"name": "Chef Mira", "specialty": "Modern Pastry", "rating": "4.8"},
    {"name": "Chef Budi", "specialty": "Street Food", "rating": "4.7"},
    {"name": "Chef Laras", "specialty": "Vegan Cuisine", "rating": "4.6"},
  ];

  // Data untuk ListView.separated (bahan trending)
  final List<String> ingredients = const [
    "Tempe Orek",
    "Rendang Sapi",
    "Ayam Geprek",
  ];

  // Data untuk GridView — 6 item makanan
  final List<Map<String, dynamic>> foods = const [
    {
      "name": "Nasi Goreng\nSpesial",
      "emoji": "🍳",
      "cal": "480 kkal",
      "color": Color(0xFFFFF3E0),
    },
    {
      "name": "Soto\nAyam",
      "emoji": "🍲",
      "cal": "320 kkal",
      "color": Color(0xFFE8F5E9),
    },
    {
      "name": "Gado-\nGado",
      "emoji": "🥗",
      "cal": "260 kkal",
      "color": Color(0xFFF3E5F5),
    },
    {
      "name": "Mie\nAyam",
      "emoji": "🍜",
      "cal": "390 kkal",
      "color": Color(0xFFE3F2FD),
    },
    {
      "name": "Martabak\nManis",
      "emoji": "🥞",
      "cal": "520 kkal",
      "color": Color(0xFFFCE4EC),
    },
    {
      "name": "Es\nDawet",
      "emoji": "🧃",
      "cal": "180 kkal",
      "color": Color(0xFFE0F7FA),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF7F4),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ─── HEADER ───────────────────────────────────────
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "SnapFood 🍴",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFFBF360C),
                            letterSpacing: -0.5,
                          ),
                        ),
                        Text(
                          "Discover your next meal",
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF8D6E63),
                          ),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      radius: 22,
                      backgroundColor: const Color(0xFFFFCCBC),
                      child: const Text(
                        "A",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFBF360C),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // ─── 1. STACK — Hero Banner ─────────────────────────
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Stack(
                  children: [
                    // Layer 1: background card
                    Container(
                      height: 180,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xFFBF360C),
                        borderRadius: BorderRadius.circular(28),
                      ),
                    ),
                    // Layer 2: dekorasi lingkaran besar
                    Positioned(
                      right: -30,
                      bottom: -30,
                      child: Container(
                        width: 160,
                        height: 160,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.08),
                        ),
                      ),
                    ),
                    // Layer 3: dekorasi lingkaran kecil
                    Positioned(
                      left: -15,
                      top: -15,
                      child: Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.06),
                        ),
                      ),
                    ),
                    // Layer 4: teks & badge
                    Padding(
                      padding: const EdgeInsets.all(22),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              "⚡ Resep Hari Ini",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Nasi Goreng\nKampung Spesial",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                              height: 1.2,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              _statBadge("⏱ 20 mnt"),
                              const SizedBox(width: 8),
                              _statBadge("🔥 480 kkal"),
                              const SizedBox(width: 8),
                              _statBadge("⭐ 4.9"),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Layer 5: emoji makanan pojok kanan
                    const Positioned(
                      right: 20,
                      top: 20,
                      child: Text("🍳", style: TextStyle(fontSize: 64)),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              // ─── 2. LISTVIEW (Horizontal) — Kategori A, B, C ──────
              const Padding(
                padding: EdgeInsets.only(left: 20, bottom: 12),
                child: Text(
                  "Browse Menu",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF3E2723),
                  ),
                ),
              ),
              SizedBox(
                height: 44,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: List.generate(categories.length, (i) {
                    final isSelected = _selectedCategory == i;
                    return GestureDetector(
                      onTap: () => setState(() => _selectedCategory = i),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xFFBF360C)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(22),
                          border: Border.all(
                            color: isSelected
                                ? const Color(0xFFBF360C)
                                : const Color(0xFFD7CCC8),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              categories[i]['icon'],
                              size: 16,
                              color: isSelected
                                  ? Colors.white
                                  : const Color(0xFF8D6E63),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              categories[i]['label'],
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                                color: isSelected
                                    ? Colors.white
                                    : const Color(0xFF5D4037),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),

              const SizedBox(height: 28),

              // ─── 3. GRIDVIEW — 6 Makanan Popular ─────────────────
              const Padding(
                padding: EdgeInsets.only(left: 20, bottom: 12),
                child: Text(
                  "Menu Populer",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF3E2723),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.85,
                  children: foods.map((food) {
                    return Container(
                      decoration: BoxDecoration(
                        color: food['color'],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            food['emoji'],
                            style: const TextStyle(fontSize: 32),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            food['name'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF3E2723),
                              height: 1.3,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            food['cal'],
                            style: const TextStyle(
                              fontSize: 9.5,
                              color: Color(0xFF8D6E63),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),

              const SizedBox(height: 28),

              // ─── 4. CONTAINER — Promo Banner ──────────────────────
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF8E1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: const Color(0xFFFFCC80),
                      width: 1.5,
                    ),
                  ),
                  child: Row(
                    children: [
                      const Text("🎉", style: TextStyle(fontSize: 36)),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Promo Hari Ini!",
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 15,
                                color: Color(0xFFE65100),
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "Diskon 30% untuk semua menu dessert. Berlaku hingga pukul 20.00.",
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF795548),
                                height: 1.4,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 28),

              // ─── 5. LISTVIEW.BUILDER — Chef Highlights ────────────
              const Padding(
                padding: EdgeInsets.only(left: 20, bottom: 12),
                child: Text(
                  "Top Chefs",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF3E2723),
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: chefs.length,
                itemBuilder: (context, index) {
                  final chef = chefs[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: const Color(0xFFEFEBE9)),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 24,
                          backgroundColor: const Color(0xFFFFCCBC),
                          child: Text(
                            chef['name'].toString().split(' ')[1][0],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Color(0xFFBF360C),
                            ),
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                chef['name'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                  color: Color(0xFF3E2723),
                                ),
                              ),
                              Text(
                                chef['specialty'],
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF8D6E63),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFF3E0),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.star_rounded,
                                size: 14,
                                color: Color(0xFFFF6F00),
                              ),
                              const SizedBox(width: 3),
                              Text(
                                chef['rating'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                  color: Color(0xFFE65100),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),

              const SizedBox(height: 28),

              // ─── 6. LISTVIEW.SEPARATED — Bahan Trending ───────────
              const Padding(
                padding: EdgeInsets.only(left: 20, bottom: 12),
                child: Text(
                  "Bahan Trending",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF3E2723),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: const Color(0xFFEFEBE9)),
                  ),
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: ingredients.length,
                    separatorBuilder: (_, __) => const Divider(
                      height: 1,
                      indent: 56,
                      endIndent: 16,
                      color: Color(0xFFF5F5F5),
                    ),
                    itemBuilder: (context, index) {
                      return ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 4,
                        ),
                        leading: Container(
                          width: 36,
                          height: 36,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFBE9E7),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            ["🫘", "🥩", "🍗"][index],
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                        title: Text(
                          ingredients[index],
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Color(0xFF3E2723),
                          ),
                        ),
                        subtitle: Text(
                          "${(index + 1) * 234} resep",
                          style: const TextStyle(
                            fontSize: 11,
                            color: Color(0xFF8D6E63),
                          ),
                        ),
                        trailing: const Icon(
                          Icons.trending_up_rounded,
                          color: Color(0xFFE64A19),
                          size: 20,
                        ),
                      );
                    },
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),

      // Bottom Nav
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Color(0xFFEFEBE9))),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _navItem(Icons.home_rounded, "Home", true),
                _navItem(Icons.explore_outlined, "Explore", false),
                _navItem(Icons.bookmark_border_rounded, "Saved", false),
                _navItem(Icons.person_outline_rounded, "Profile", false),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _statBadge(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.18),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _navItem(IconData icon, String label, bool active) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 24,
          color: active ? const Color(0xFFBF360C) : const Color(0xFFBCAAA4),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            fontWeight: active ? FontWeight.w700 : FontWeight.w400,
            color: active ? const Color(0xFFBF360C) : const Color(0xFFBCAAA4),
          ),
        ),
      ],
    );
  }
}
