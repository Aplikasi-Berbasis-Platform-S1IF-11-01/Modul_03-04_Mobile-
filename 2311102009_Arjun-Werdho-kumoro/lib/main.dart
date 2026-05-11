import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ArjunStore',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'sans-serif',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6C63FF),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const MainPage(),
    );
  }
}

// ─── Warna utama ──────────────────────────────────────────────────────────────
const kPrimary   = Color(0xFF6C63FF);
const kSecondary = Color(0xFFFF6584);
const kAccent    = Color(0xFF43E97B);
const kDark      = Color(0xFF1A1A2E);
const kGrey      = Color(0xFF9E9E9E);

// ─── Model data produk ────────────────────────────────────────────────────────
class Product {
  final String name, category, price, emoji, badge;
  final Color color;
  const Product({required this.name, required this.category, required this.price, required this.emoji, required this.color, this.badge = ''});
}

final List<Product> allProducts = [
  Product(name: 'Nike Air Max', category: 'Sepatu', price: 'Rp 1.299.000', emoji: '👟', color: Color(0xFF6C63FF), badge: 'Terlaris'),
  Product(name: 'Adidas Ultraboost', category: 'Sepatu', price: 'Rp 1.599.000', emoji: '🥿', color: Color(0xFFFF6584), badge: 'Baru'),
  Product(name: 'MacBook Pro M3', category: 'Laptop', price: 'Rp 24.999.000', emoji: '💻', color: Color(0xFF43E97B), badge: 'Hot'),
  Product(name: 'iPhone 15 Pro', category: 'Handphone', price: 'Rp 18.499.000', emoji: '📱', color: Color(0xFFFFB347), badge: ''),
  Product(name: 'Sony WH-1000XM5', category: 'Headphone', price: 'Rp 4.299.000', emoji: '🎧', color: Color(0xFF4ECDC4), badge: 'Terlaris'),
  Product(name: 'Samsung Galaxy S24', category: 'Handphone', price: 'Rp 13.999.000', emoji: '📲', color: Color(0xFFFF6B6B), badge: ''),
  Product(name: 'Kemeja Flannel', category: 'Fashion', price: 'Rp 289.000', emoji: '👕', color: Color(0xFFA29BFE), badge: 'Diskon'),
  Product(name: 'Celana Chino', category: 'Fashion', price: 'Rp 349.000', emoji: '👖', color: Color(0xFFFD79A8), badge: ''),
  Product(name: 'Jam Tangan Casio', category: 'Aksesoris', price: 'Rp 899.000', emoji: '⌚', color: Color(0xFF00B894), badge: 'Baru'),
  Product(name: 'Kacamata Rayban', category: 'Aksesoris', price: 'Rp 1.199.000', emoji: '🕶️', color: Color(0xFFE17055), badge: ''),
];

final List<String> categories = ['Semua', 'Sepatu', 'Laptop', 'Handphone', 'Headphone', 'Fashion', 'Aksesoris'];

// ─── Main Page dengan BottomNav ───────────────────────────────────────────────
class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final List<Widget> _pages = const [HomePage(), GridPage(), ListPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5FF),
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: kPrimary.withOpacity(0.1), blurRadius: 20, offset: const Offset(0, -5))],
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (i) => setState(() => _currentIndex = i),
            selectedItemColor: kPrimary,
            unselectedItemColor: kGrey,
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 11,
            unselectedFontSize: 10,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.grid_view_rounded), label: 'Katalog'),
              BottomNavigationBarItem(icon: Icon(Icons.list_alt_rounded), label: 'Daftar'),
              BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: 'Profil'),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── 1. HOME PAGE — Container & Stack ─────────────────────────────────────────
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── HERO BANNER (Stack) ──
            Stack(
              children: [
                Container(
                  height: 220,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [kPrimary, Color(0xFF9C63FF)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(32)),
                  ),
                ),
                // Lingkaran dekoratif layer 2
                Positioned(
                  top: -30, right: -30,
                  child: Container(
                    width: 150, height: 150,
                    decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withOpacity(0.08)),
                  ),
                ),
                // Lingkaran dekoratif layer 3
                Positioned(
                  bottom: -20, right: 60,
                  child: Container(
                    width: 100, height: 100,
                    decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withOpacity(0.06)),
                  ),
                ),
                // Konten teks layer 4
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Halo, Arjun! 👋', style: TextStyle(color: Colors.white70, fontSize: 14)),
                              Text('ArjunStore', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
                            ],
                          ),
                          // Badge notifikasi (Stack dalam Stack)
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), borderRadius: BorderRadius.circular(14)),
                                child: const Icon(Icons.notifications_rounded, color: Colors.white, size: 24),
                              ),
                              Positioned(
                                top: -4, right: -4,
                                child: Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: const BoxDecoration(color: kSecondary, shape: BoxShape.circle),
                                  child: const Text('3', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // Search bar Container
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 10)],
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.search_rounded, color: kGrey),
                            SizedBox(width: 10),
                            Text('Cari produk...', style: TextStyle(color: kGrey, fontSize: 14)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // ── PROMO BANNER (Container + Stack) ──
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Stack(
                children: [
                  Container(
                    height: 110,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFFF6584), Color(0xFFFFB347)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  const Positioned(
                    right: 10, bottom: -5,
                    child: Text('🎁', style: TextStyle(fontSize: 70)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(color: Colors.white.withOpacity(0.3), borderRadius: BorderRadius.circular(20)),
                          child: const Text('PROMO SPESIAL', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                        ),
                        const SizedBox(height: 6),
                        const Text('Diskon hingga 50%!', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                        const Text('Untuk semua kategori produk', style: TextStyle(color: Colors.white70, fontSize: 12)),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ── KATEGORI (Container + ListView horizontal) ──
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text('Kategori', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: kDark)),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 90,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  _CategoryItem(emoji: '👟', label: 'Sepatu', color: kPrimary),
                  _CategoryItem(emoji: '💻', label: 'Laptop', color: kSecondary),
                  _CategoryItem(emoji: '📱', label: 'HP', color: kAccent),
                  _CategoryItem(emoji: '🎧', label: 'Audio', color: Color(0xFFFFB347)),
                  _CategoryItem(emoji: '👕', label: 'Fashion', color: Color(0xFF4ECDC4)),
                  _CategoryItem(emoji: '⌚', label: 'Aksesoris', color: Color(0xFFA29BFE)),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ── TERLARIS ──
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text('🔥 Produk Terlaris', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: kDark)),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: allProducts.where((p) => p.badge == 'Terlaris').length,
                itemBuilder: (context, index) {
                  final hot = allProducts.where((p) => p.badge == 'Terlaris').toList();
                  return _HotCard(product: hot[index]);
                },
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final String emoji, label;
  final Color color;
  const _CategoryItem({required this.emoji, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          Container(
            width: 56, height: 56,
            decoration: BoxDecoration(
              color: color.withOpacity(0.15),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: color.withOpacity(0.3)),
            ),
            child: Center(child: Text(emoji, style: const TextStyle(fontSize: 26))),
          ),
          const SizedBox(height: 6),
          Text(label, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: kDark)),
        ],
      ),
    );
  }
}

class _HotCard extends StatelessWidget {
  final Product product;
  const _HotCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: product.color.withOpacity(0.15), blurRadius: 12, offset: const Offset(0, 4))],
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 50, height: 50,
                  decoration: BoxDecoration(color: product.color.withOpacity(0.12), borderRadius: BorderRadius.circular(14)),
                  child: Center(child: Text(product.emoji, style: const TextStyle(fontSize: 28))),
                ),
                const SizedBox(height: 10),
                Text(product.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: kDark), maxLines: 2, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 4),
                Text(product.price, style: TextStyle(color: product.color, fontSize: 12, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Positioned(
            top: 10, right: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(color: kSecondary, borderRadius: BorderRadius.circular(20)),
              child: Text(product.badge, style: const TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── 2. GRID PAGE — GridView ───────────────────────────────────────────────────
class GridPage extends StatefulWidget {
  const GridPage({super.key});
  @override
  State<GridPage> createState() => _GridPageState();
}

class _GridPageState extends State<GridPage> {
  String _selected = 'Semua';

  List<Product> get filtered => _selected == 'Semua'
      ? allProducts
      : allProducts.where((p) => p.category == _selected).toList();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('🛍️ Katalog Produk', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: kDark)),
                Text('Temukan produk favoritmu', style: TextStyle(color: kGrey, fontSize: 13)),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Filter horizontal
          SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: categories.length,
              itemBuilder: (context, i) {
                final cat = categories[i];
                final sel = cat == _selected;
                return GestureDetector(
                  onTap: () => setState(() => _selected = cat),
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: sel ? kPrimary : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: sel ? kPrimary : Colors.grey.shade200),
                      boxShadow: sel ? [BoxShadow(color: kPrimary.withOpacity(0.3), blurRadius: 8, offset: const Offset(0, 2))] : [],
                    ),
                    child: Text(cat, style: TextStyle(color: sel ? Colors.white : kGrey, fontSize: 12, fontWeight: FontWeight.w600)),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          // GridView
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                childAspectRatio: 0.78,
              ),
              itemCount: filtered.length,
              itemBuilder: (context, index) {
                final p = filtered[index];
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [BoxShadow(color: p.color.withOpacity(0.12), blurRadius: 12, offset: const Offset(0, 4))],
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity, height: 80,
                              decoration: BoxDecoration(color: p.color.withOpacity(0.1), borderRadius: BorderRadius.circular(14)),
                              child: Center(child: Text(p.emoji, style: const TextStyle(fontSize: 40))),
                            ),
                            const SizedBox(height: 10),
                            Text(p.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: kDark), maxLines: 2, overflow: TextOverflow.ellipsis),
                            const SizedBox(height: 4),
                            Text(p.category, style: const TextStyle(color: kGrey, fontSize: 11)),
                            const SizedBox(height: 6),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(child: Text(p.price, style: TextStyle(color: p.color, fontSize: 11, fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis)),
                                Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(color: p.color.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
                                  child: Icon(Icons.add_shopping_cart_rounded, color: p.color, size: 16),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      if (p.badge.isNotEmpty)
                        Positioned(
                          top: 10, right: 10,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color: p.badge == 'Baru' ? kAccent : p.badge == 'Diskon' ? kSecondary : kPrimary,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(p.badge, style: const TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold)),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ─── 3. LIST PAGE — ListView, builder, separated ───────────────────────────────
class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('📋 Daftar Produk', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: kDark)),
                  Text('Semua jenis tampilan list', style: TextStyle(color: kGrey, fontSize: 13)),
                ],
              ),
            ),

            // ── ListView biasa ──
            _SectionHeader(title: '📌 ListView — Item A, B, C', subtitle: 'List statis ditulis manual'),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)]),
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _StaticTile(label: 'A', title: 'Nike Air Max', subtitle: 'Sepatu  •  Rp 1.299.000', emoji: '👟', color: kPrimary),
                  _StaticTile(label: 'B', title: 'MacBook Pro M3', subtitle: 'Laptop  •  Rp 24.999.000', emoji: '💻', color: kAccent),
                  _StaticTile(label: 'C', title: 'Sony WH-1000XM5', subtitle: 'Headphone  •  Rp 4.299.000', emoji: '🎧', color: Color(0xFF4ECDC4), isLast: true),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ── ListView.builder ──
            _SectionHeader(title: '🔨 ListView.builder', subtitle: 'Dari array ${allProducts.length} produk'),
            SizedBox(
              height: 220,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: allProducts.length,
                itemBuilder: (context, index) {
                  final p = allProducts[index];
                  return Container(
                    width: 120,
                    margin: const EdgeInsets.only(right: 12, bottom: 4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [BoxShadow(color: p.color.withOpacity(0.15), blurRadius: 10, offset: const Offset(0, 4))],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 56, height: 56,
                            decoration: BoxDecoration(color: p.color.withOpacity(0.12), borderRadius: BorderRadius.circular(14)),
                            child: Center(child: Text(p.emoji, style: const TextStyle(fontSize: 28))),
                          ),
                          const SizedBox(height: 8),
                          Text(p.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: kDark), textAlign: TextAlign.center, maxLines: 2, overflow: TextOverflow.ellipsis),
                          const SizedBox(height: 4),
                          Text(p.price, style: TextStyle(color: p.color, fontSize: 10, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                          const SizedBox(height: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(color: p.color.withOpacity(0.1), borderRadius: BorderRadius.circular(20)),
                            child: Text('#${index + 1}', style: TextStyle(color: p.color, fontSize: 10, fontWeight: FontWeight.w600)),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 24),

            // ── ListView.separated ──
            _SectionHeader(title: '📐 ListView.separated', subtitle: 'List + garis pembatas otomatis'),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)]),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: allProducts.length,
                separatorBuilder: (context, index) => Divider(height: 1, color: Colors.grey.shade100, indent: 72, endIndent: 16),
                itemBuilder: (context, index) {
                  final p = allProducts[index];
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    leading: Container(
                      width: 48, height: 48,
                      decoration: BoxDecoration(color: p.color.withOpacity(0.12), borderRadius: BorderRadius.circular(14)),
                      child: Center(child: Text(p.emoji, style: const TextStyle(fontSize: 24))),
                    ),
                    title: Text(p.name, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13, color: kDark)),
                    subtitle: Text(p.category, style: const TextStyle(color: kGrey, fontSize: 11)),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(p.price, style: TextStyle(color: p.color, fontWeight: FontWeight.bold, fontSize: 11)),
                        if (p.badge.isNotEmpty)
                          Container(
                            margin: const EdgeInsets.only(top: 2),
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: p.badge == 'Baru' ? kAccent.withOpacity(0.15) : kSecondary.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(p.badge, style: TextStyle(color: p.badge == 'Baru' ? kAccent : kSecondary, fontSize: 9, fontWeight: FontWeight.bold)),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title, subtitle;
  const _SectionHeader({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: kDark)),
          Text(subtitle, style: const TextStyle(color: kGrey, fontSize: 12)),
        ],
      ),
    );
  }
}

class _StaticTile extends StatelessWidget {
  final String label, title, subtitle, emoji;
  final Color color;
  final bool isLast;
  const _StaticTile({required this.label, required this.title, required this.subtitle, required this.emoji, required this.color, this.isLast = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          leading: Container(
            width: 44, height: 44,
            decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(14)),
            child: Center(child: Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18))),
          ),
          title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13, color: kDark)),
          subtitle: Text(subtitle, style: const TextStyle(color: kGrey, fontSize: 11)),
          trailing: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
            child: Icon(Icons.arrow_forward_ios_rounded, color: color, size: 14),
          ),
        ),
        if (!isLast) Divider(height: 1, color: Colors.grey.shade100, indent: 76),
      ],
    );
  }
}

// ─── 4. PROFILE PAGE ──────────────────────────────────────────────────────────
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Header Stack
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 170,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [kPrimary, Color(0xFF9C63FF)], begin: Alignment.topLeft, end: Alignment.bottomRight),
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(32)),
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(height: 16),
                    Container(
                      width: 80, height: 80,
                      decoration: BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 3),
                        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10)],
                      ),
                      child: const Center(child: Text('🧑‍💻', style: TextStyle(fontSize: 36))),
                    ),
                    const SizedBox(height: 10),
                    const Text('Arjun Werdho Kumoro', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                    const Text('NIM: 2311102009', style: TextStyle(color: Colors.white70, fontSize: 13)),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Stat cards
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  _StatCard(label: 'Produk', value: '${allProducts.length}', emoji: '📦', color: kPrimary),
                  const SizedBox(width: 12),
                  _StatCard(label: 'Kategori', value: '${categories.length - 1}', emoji: '🏷️', color: kSecondary),
                  const SizedBox(width: 12),
                  _StatCard(label: 'Widget', value: '6', emoji: '⚡', color: kAccent),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Info tugas
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('📚 Info Tugas', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: kDark)),
                  const SizedBox(height: 16),
                  _InfoRow(icon: Icons.person_rounded, label: 'Nama', value: 'Arjun Werdho Kumoro', color: kPrimary),
                  _InfoRow(icon: Icons.badge_rounded, label: 'NIM', value: '2311102009', color: kSecondary),
                  _InfoRow(icon: Icons.book_rounded, label: 'Mata Kuliah', value: 'Pemrograman Mobile', color: kAccent),
                  _InfoRow(icon: Icons.assignment_rounded, label: 'Tugas', value: 'Praktikum Modul 4', color: Color(0xFFFFB347)),
                  _InfoRow(icon: Icons.widgets_rounded, label: 'Total Widget', value: '6 Widget Flutter', color: Color(0xFF4ECDC4), isLast: true),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Widget list
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('⚡ Widget yang Digunakan', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: kDark)),
                  const SizedBox(height: 12),
                  _WidgetBadge('Container', 'Kotak dekorasi & layout', kPrimary),
                  _WidgetBadge('GridView', 'Tampilan grid katalog produk', kSecondary),
                  _WidgetBadge('ListView', 'List item A, B, C statis', kAccent),
                  _WidgetBadge('ListView.builder', 'List dari array 10 produk', Color(0xFFFFB347)),
                  _WidgetBadge('ListView.separated', 'List + garis pembatas', Color(0xFF4ECDC4)),
                  _WidgetBadge('Stack', 'Tampilan bertumpuk & badge', Color(0xFFA29BFE)),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label, value, emoji;
  final Color color;
  const _StatCard({required this.label, required this.value, required this.emoji, required this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withOpacity(0.2)),
        ),
        child: Column(
          children: [
            Text(emoji, style: const TextStyle(fontSize: 22)),
            const SizedBox(height: 4),
            Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color)),
            Text(label, style: const TextStyle(fontSize: 11, color: kGrey)),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label, value;
  final Color color;
  final bool isLast;
  const _InfoRow({required this.icon, required this.label, required this.value, required this.color, this.isLast = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
                child: Icon(icon, color: color, size: 18),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(label, style: const TextStyle(color: kGrey, fontSize: 11)),
                    Text(value, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13, color: kDark)),
                  ],
                ),
              ),
            ],
          ),
        ),
        if (!isLast) Divider(height: 1, color: Colors.grey.shade100),
      ],
    );
  }
}

class _WidgetBadge extends StatelessWidget {
  final String name, desc;
  final Color color;
  const _WidgetBadge(this.name, this.desc, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          Container(width: 8, height: 8, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
          const SizedBox(width: 10),
          Text(name, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 13)),
          const SizedBox(width: 8),
          Expanded(child: Text(desc, style: const TextStyle(color: kGrey, fontSize: 11))),
        ],
      ),
    );
  }
}