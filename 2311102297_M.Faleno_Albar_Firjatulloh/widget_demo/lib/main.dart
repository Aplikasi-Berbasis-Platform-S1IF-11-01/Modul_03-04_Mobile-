import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// ═══════════════════════════════════════════
// THEME COLORS
// ═══════════════════════════════════════════
class AppColors {
  static const bg = Color(0xFF0F1117);
  static const surface = Color(0xFF1A1D27);
  static const card = Color(0xFF22263A);
  static const accent = Color(0xFF00D9C0);
  static const accentSoft = Color(0xFF1A3D3A);
  static const purple = Color(0xFF7C6FF7);
  static const purpleSoft = Color(0xFF26254A);
  static const amber = Color(0xFFFFC857);
  static const amberSoft = Color(0xFF3A2E1A);
  static const coral = Color(0xFFFF6B6B);
  static const coralSoft = Color(0xFF3A1E1E);
  static const textPrimary = Color(0xFFF0F2FF);
  static const textSecondary = Color(0xFF8B90A8);
  static const divider = Color(0xFF2E3248);
}

// ═══════════════════════════════════════════
// APP
// ═══════════════════════════════════════════
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget Showcase',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.bg,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.accent,
          surface: AppColors.surface,
        ),
      ),
      home: const HomePage(),
    );
  }
}

// ═══════════════════════════════════════════
// HOME PAGE
// ═══════════════════════════════════════════
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const List<String> buahList = [
    'Apel 🍎',
    'Mangga 🥭',
    'Jeruk 🍊',
    'Pisang 🍌',
    'Anggur 🍇',
    'Semangka 🍉',
  ];

  static const List<String> namaList = [
    'Budi Santoso',
    'Sari Dewi',
    'Andi Pratama',
    'Rina Wulandari',
    'Doni Kusuma',
  ];

  static const List<Map<String, dynamic>> gridItems = [
    {
      'icon': Icons.dashboard_rounded,
      'label': 'Dashboard',
      'color': AppColors.accent,
      'bg': AppColors.accentSoft,
    },
    {
      'icon': Icons.analytics_rounded,
      'label': 'Analitik',
      'color': AppColors.purple,
      'bg': AppColors.purpleSoft,
    },
    {
      'icon': Icons.notifications_rounded,
      'label': 'Notifikasi',
      'color': AppColors.amber,
      'bg': AppColors.amberSoft,
    },
    {
      'icon': Icons.people_rounded,
      'label': 'Pengguna',
      'color': AppColors.coral,
      'bg': AppColors.coralSoft,
    },
    {
      'icon': Icons.settings_rounded,
      'label': 'Pengaturan',
      'color': AppColors.accent,
      'bg': AppColors.accentSoft,
    },
    {
      'icon': Icons.bar_chart_rounded,
      'label': 'Laporan',
      'color': AppColors.purple,
      'bg': AppColors.purpleSoft,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: CustomScrollView(
        slivers: [
          // ── APP BAR ──────────────────────────────────
          SliverAppBar(
            expandedHeight: 110,
            pinned: true,
            backgroundColor: AppColors.bg,
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.only(left: 20, bottom: 14),
              title: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Widget Showcase',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                      letterSpacing: -0.5,
                    ),
                  ),
                  Text(
                    'FLUTTER UI DEMO',
                    style: TextStyle(
                      fontSize: 10,
                      color: AppColors.accent.withOpacity(0.8),
                      fontWeight: FontWeight.w600,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ── CONTENT ──────────────────────────────────
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 40),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                // ─────────────────────────────────────────
                // 1. CONTAINER
                // ─────────────────────────────────────────
                _SectionHeader(
                  label: '01',
                  title: 'Container',
                  color: AppColors.accent,
                ),
                const SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF00D9C0), Color(0xFF006A8E)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.accent.withOpacity(0.25),
                        blurRadius: 24,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 52,
                        height: 52,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const Icon(
                          Icons.widgets_rounded,
                          color: Colors.white,
                          size: 26,
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Container Widget',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Kotak dasar dengan dekorasi & shadow',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 28),

                // ─────────────────────────────────────────
                // 2. GRIDVIEW
                // ─────────────────────────────────────────
                _SectionHeader(
                  label: '02',
                  title: 'GridView',
                  color: AppColors.purple,
                ),
                const SizedBox(height: 12),
                GridView.count(
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.1,
                  children: gridItems.map((item) {
                    return Container(
                      decoration: BoxDecoration(
                        color: item['bg'] as Color,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: (item['color'] as Color).withOpacity(0.2),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            item['icon'] as IconData,
                            color: item['color'] as Color,
                            size: 26,
                          ),
                          const SizedBox(height: 6),
                          Text(
                            item['label'] as String,
                            style: TextStyle(
                              color: item['color'] as Color,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),

                const SizedBox(height: 28),

                // ─────────────────────────────────────────
                // 3. LISTVIEW (biasa)
                // ─────────────────────────────────────────
                _SectionHeader(
                  label: '03',
                  title: 'ListView',
                  color: AppColors.amber,
                ),
                const SizedBox(height: 12),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.card,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.divider),
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: const [
                      _StaticTile(
                        letter: 'A',
                        title: 'Item A',
                        subtitle: 'ListView item pertama',
                      ),
                      Divider(height: 1, color: AppColors.divider, indent: 64),
                      _StaticTile(
                        letter: 'B',
                        title: 'Item B',
                        subtitle: 'ListView item kedua',
                      ),
                      Divider(height: 1, color: AppColors.divider, indent: 64),
                      _StaticTile(
                        letter: 'C',
                        title: 'Item C',
                        subtitle: 'ListView item ketiga',
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 28),

                // ─────────────────────────────────────────
                // 4. LISTVIEW.BUILDER
                // ─────────────────────────────────────────
                _SectionHeader(
                  label: '04',
                  title: 'ListView.builder',
                  color: AppColors.coral,
                ),
                const SizedBox(height: 12),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.card,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.divider),
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: buahList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 13,
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 36,
                                  height: 36,
                                  decoration: BoxDecoration(
                                    color: AppColors.coralSoft,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '${index + 1}',
                                      style: const TextStyle(
                                        color: AppColors.coral,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  buahList[index],
                                  style: const TextStyle(
                                    color: AppColors.textPrimary,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.chevron_right_rounded,
                                  color: AppColors.textSecondary,
                                  size: 18,
                                ),
                              ],
                            ),
                          ),
                          if (index < buahList.length - 1)
                            const Divider(
                              height: 1,
                              color: AppColors.divider,
                              indent: 64,
                            ),
                        ],
                      );
                    },
                  ),
                ),

                const SizedBox(height: 28),

                // ─────────────────────────────────────────
                // 5. LISTVIEW.SEPARATED
                // ─────────────────────────────────────────
                _SectionHeader(
                  label: '05',
                  title: 'ListView.separated',
                  color: AppColors.accent,
                ),
                const SizedBox(height: 12),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.card,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.divider),
                  ),
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: namaList.length,
                    separatorBuilder: (_, __) => Container(
                      height: 1,
                      margin: const EdgeInsets.only(left: 72),
                      color: AppColors.divider,
                    ),
                    itemBuilder: (context, index) {
                      const colors = [
                        AppColors.accent,
                        AppColors.purple,
                        AppColors.amber,
                        AppColors.coral,
                        AppColors.accent,
                      ];
                      const bgs = [
                        AppColors.accentSoft,
                        AppColors.purpleSoft,
                        AppColors.amberSoft,
                        AppColors.coralSoft,
                        AppColors.accentSoft,
                      ];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 42,
                              height: 42,
                              decoration: BoxDecoration(
                                color: bgs[index % bgs.length],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Text(
                                  namaList[index][0],
                                  style: TextStyle(
                                    color: colors[index % colors.length],
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  namaList[index],
                                  style: const TextStyle(
                                    color: AppColors.textPrimary,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  'Pengguna #${index + 1}',
                                  style: const TextStyle(
                                    color: AppColors.textSecondary,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: colors[index % colors.length]
                                    .withOpacity(0.12),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                'Aktif',
                                style: TextStyle(
                                  color: colors[index % colors.length],
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 28),

                // ─────────────────────────────────────────
                // 6. STACK
                // ─────────────────────────────────────────
                _SectionHeader(
                  label: '06',
                  title: 'Stack',
                  color: AppColors.purple,
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 190,
                  child: Stack(
                    children: [
                      // Layer 1 – paling bawah
                      Positioned(
                        top: 24,
                        left: 24,
                        right: 0,
                        child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                            color: AppColors.purpleSoft,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: AppColors.purple.withOpacity(0.3),
                            ),
                          ),
                        ),
                      ),
                      // Layer 2 – tengah
                      Positioned(
                        top: 12,
                        left: 12,
                        right: 12,
                        child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                            color: AppColors.accentSoft,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: AppColors.accent.withOpacity(0.3),
                            ),
                          ),
                        ),
                      ),
                      // Layer 3 – depan (konten utama)
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 24,
                        child: Container(
                          height: 150,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: AppColors.card,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: AppColors.divider),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 20,
                                offset: const Offset(0, 8),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Stack Widget',
                                      style: TextStyle(
                                        color: AppColors.textPrimary,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    const Text(
                                      '3 layer bertumpuk dengan\nPositioned untuk kontrol posisi',
                                      style: TextStyle(
                                        color: AppColors.textSecondary,
                                        fontSize: 12,
                                        height: 1.6,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Row(
                                      children: [
                                        _LayerBadge(
                                          label: 'Layer 1',
                                          color: AppColors.purple,
                                        ),
                                        const SizedBox(width: 6),
                                        _LayerBadge(
                                          label: 'Layer 2',
                                          color: AppColors.accent,
                                        ),
                                        const SizedBox(width: 6),
                                        _LayerBadge(
                                          label: 'Layer 3',
                                          color: AppColors.amber,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const Icon(
                                Icons.layers_rounded,
                                color: AppColors.accent,
                                size: 44,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════
// REUSABLE HELPER WIDGETS
// ═══════════════════════════════════════════

class _SectionHeader extends StatelessWidget {
  final String label;
  final String title;
  final Color color;
  const _SectionHeader({
    required this.label,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
          decoration: BoxDecoration(
            color: color.withOpacity(0.15),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 11,
              fontWeight: FontWeight.w700,
              letterSpacing: 1,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          title,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 15,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.3,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(child: Container(height: 1, color: AppColors.divider)),
      ],
    );
  }
}

class _StaticTile extends StatelessWidget {
  final String letter;
  final String title;
  final String subtitle;
  const _StaticTile({
    required this.letter,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: AppColors.amberSoft,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                letter,
                style: const TextStyle(
                  color: AppColors.amber,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _LayerBadge extends StatelessWidget {
  final String label;
  final Color color;
  const _LayerBadge({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 10,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
