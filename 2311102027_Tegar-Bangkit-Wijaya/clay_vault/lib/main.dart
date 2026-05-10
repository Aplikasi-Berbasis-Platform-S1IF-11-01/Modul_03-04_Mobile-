import 'package:flutter/material.dart';

void main() {
  runApp(const NeonVaultApp());
}

// ─────────────────────────────────────────
//  ROOT APP
// ─────────────────────────────────────────
class NeonVaultApp extends StatelessWidget {
  const NeonVaultApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clay Vault',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: const Color(0xFFFDF6EE),
        colorScheme: const ColorScheme.light(
          primary: Color(0xFFC96A3A),    // terracotta
          secondary: Color(0xFF7A9E7E),  // sage green
          surface: Color(0xFFFEFAF5),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

// ─────────────────────────────────────────
//  HOME – SINGLE SCROLL PAGE
// ─────────────────────────────────────────
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Data untuk ListView.builder
  static const List<Map<String, dynamic>> _skills = [
    {'icon': Icons.flash_on, 'label': 'Flutter', 'level': 0.92},
    {'icon': Icons.hub, 'label': 'Dart', 'level': 0.85},
    {'icon': Icons.layers, 'label': 'State Mgmt', 'level': 0.78},
    {'icon': Icons.animation, 'label': 'Animation', 'level': 0.70},
    {'icon': Icons.api, 'label': 'REST API', 'level': 0.88},
    {'icon': Icons.storage, 'label': 'Firebase', 'level': 0.74},
  ];

  // Data untuk GridView
  static const List<Map<String, dynamic>> _gridItems = [
    {'label': 'UI Kit',  'icon': Icons.widgets,               'color': Color(0xFFC96A3A)}, // terracotta
    {'label': 'Motion',  'icon': Icons.animation,             'color': Color(0xFF7A9E7E)}, // sage
    {'label': 'Charts',  'icon': Icons.bar_chart,             'color': Color(0xFFB07090)}, // mauve
    {'label': 'Auth',    'icon': Icons.lock_open,             'color': Color(0xFFD4A85A)}, // gold
    {'label': 'Push',    'icon': Icons.notifications_active,  'color': Color(0xFF6A8FAF)}, // slate blue
    {'label': 'Media',   'icon': Icons.play_circle,           'color': Color(0xFF8B6F5E)}, // warm brown
  ];

  // Data untuk ListView biasa (A, B, C)
  static const List<Map<String, dynamic>> _channels = [
    {'tag': 'A', 'title': 'Alpha Channel',  'sub': 'Core system layer',     'color': Color(0xFFC96A3A)},
    {'tag': 'B', 'title': 'Beta Channel',   'sub': 'Experimental builds',   'color': Color(0xFF7A9E7E)},
    {'tag': 'C', 'title': 'Canary Channel', 'sub': 'Bleeding edge release',  'color': Color(0xFFB07090)},
  ];

  // Data untuk ListView.separated
  static const List<Map<String, dynamic>> _logs = [
    {'time': '08:01', 'msg': 'System boot complete', 'ok': true},
    {'time': '08:03', 'msg': 'Network handshake OK', 'ok': true},
    {'time': '08:07', 'msg': 'Auth token refreshed', 'ok': true},
    {'time': '08:12', 'msg': 'Data sync started', 'ok': true},
    {'time': '08:15', 'msg': 'Cache invalidation warning', 'ok': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // ── App Bar ──────────────────────────────
          _buildSliverAppBar(),

          // ── Section: Container ───────────────────
          _sliverPad(_buildSectionLabel('01 · CONTAINER')),
          _sliverPad(_buildContainerSection()),

          // ── Section: Stack ───────────────────────
          _sliverPad(_buildSectionLabel('02 · STACK')),
          _sliverPad(_buildStackSection()),

          // ── Section: GridView ────────────────────
          _sliverPad(_buildSectionLabel('03 · GRID VIEW')),
          _buildGridSection(),

          // ── Section: ListView (A, B, C) ──────────
          _sliverPad(_buildSectionLabel('04 · LIST VIEW')),
          _sliverPad(_buildListViewSection()),

          // ── Section: ListView.builder ────────────
          _sliverPad(_buildSectionLabel('05 · LIST VIEW . BUILDER')),
          _buildListViewBuilderSection(),

          // ── Section: ListView.separated ──────────
          _sliverPad(_buildSectionLabel('06 · LIST VIEW . SEPARATED')),
          _sliverPad(_buildListViewSeparatedSection()),

          const SliverToBoxAdapter(child: SizedBox(height: 40)),
        ],
      ),
    );
  }

  // ─── APP BAR ────────────────────────────────────────────────────────────────
  SliverAppBar _buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 140,
      pinned: true,
      backgroundColor: const Color(0xFFFDF6EE),
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.only(left: 20, bottom: 16),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'CLAY VAULT',
              style: TextStyle(
                fontFamily: 'monospace',
                fontSize: 22,
                fontWeight: FontWeight.w900,
                color: Color(0xFFC96A3A),
                letterSpacing: 4,
              ),
            ),
            Text(
              'Widget Showcase · Flutter',
              style: TextStyle(
                fontSize: 10,
                color: const Color(0xFF4A2F22).withOpacity(0.5),
                letterSpacing: 2,
              ),
            ),
          ],
        ),
        background: Stack(
          fit: StackFit.expand,
          children: [
            Container(color: const Color(0xFFFDF6EE)),
            CustomPaint(painter: _GridPainter()),
          ],
        ),
      ),
    );
  }

  // ─── LABEL ──────────────────────────────────────────────────────────────────
  Widget _buildSectionLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 28, bottom: 10),
      child: Row(
        children: [
          Container(width: 3, height: 14, color: const Color(0xFFC96A3A)),
          const SizedBox(width: 8),
          Text(
            text,
            style: const TextStyle(
              fontFamily: 'monospace',
              fontSize: 11,
              letterSpacing: 2.5,
              color: Color(0xFFC96A3A),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // ─── 01 · CONTAINER ─────────────────────────────────────────────────────────
  Widget _buildContainerSection() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color(0xFFC96A3A),
            ),
            child: const Center(
              child: Text('SOLID', style: TextStyle(fontFamily: 'monospace', fontWeight: FontWeight.w900, letterSpacing: 2, color: Colors.white)),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Container(
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color(0xFFF5ECD7),
              border: Border.all(color: const Color(0xFF7A9E7E), width: 2),
            ),
            child: const Center(
              child: Text('BORDER', style: TextStyle(fontFamily: 'monospace', fontWeight: FontWeight.w900, letterSpacing: 2, color: Color(0xFF3B6D11))),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Container(
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color(0xFFEDE0D4),
            ),
            child: const Center(
              child: Text('MUTED', style: TextStyle(fontFamily: 'monospace', fontWeight: FontWeight.w900, letterSpacing: 2, color: Color(0xFF712B13))),
            ),
          ),
        ),
      ],
    );
  }

  // ─── 02 · STACK ─────────────────────────────────────────────────────────────
  Widget _buildStackSection() {
    return SizedBox(
      height: 160,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: const Color(0xFFFEFAF5),
              border: Border.all(color: const Color(0xFFD4A85A).withOpacity(0.4)),
            ),
          ),
          Positioned(
            left: -20, top: -20,
            child: Container(width: 120, height: 120, decoration: BoxDecoration(shape: BoxShape.circle, color: const Color(0xFFD4A85A).withOpacity(0.12))),
          ),
          Positioned(
            right: -10, bottom: -10,
            child: Container(width: 90, height: 90, decoration: BoxDecoration(shape: BoxShape.circle, color: const Color(0xFFC96A3A).withOpacity(0.10))),
          ),
          Positioned(
            left: 24, top: 28,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('LAYER STACK', style: TextStyle(fontFamily: 'monospace', fontSize: 20, fontWeight: FontWeight.w900, color: Color(0xFF4A2F22), letterSpacing: 3)),
                const SizedBox(height: 6),
                Text('Widget bertumpuk · z-index aware', style: TextStyle(fontSize: 12, color: const Color(0xFF4A2F22).withOpacity(0.45))),
              ],
            ),
          ),
          Positioned(
            right: 16, top: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: const Color(0xFFD4A85A)),
              child: const Text('STACK', style: TextStyle(fontFamily: 'monospace', fontSize: 10, fontWeight: FontWeight.bold, color: Color(0xFF412402), letterSpacing: 2)),
            ),
          ),
          Positioned(
            left: 24, bottom: 16,
            child: Row(
              children: ['L0', 'L1', 'L2', 'L3', 'L4', 'L5'].map((l) => Container(
                margin: const EdgeInsets.only(right: 6),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: const Color(0xFFD4A85A).withOpacity(0.15),
                  border: Border.all(color: const Color(0xFFD4A85A).withOpacity(0.45), width: 0.5),
                ),
                child: Text(l, style: const TextStyle(fontFamily: 'monospace', fontSize: 9, color: Color(0xFF633806))),
              )).toList(),
            ),
          ),
        ],
      ),
    );
  }

  // ─── 03 · GRIDVIEW ──────────────────────────────────────────────────────────
  Widget _buildGridSection() {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final item = _gridItems[index];
            return _GridCard(
              label: item['label'] as String,
              icon: item['icon'] as IconData,
              accent: item['color'] as Color,
            );
          },
          childCount: _gridItems.length,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.95,
        ),
      ),
    );
  }

  // ─── 04 · LISTVIEW (A, B, C) ────────────────────────────────────────────────
  Widget _buildListViewSection() {
    // Karena di dalam CustomScrollView, gunakan shrinkWrap + NeverScrollable
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: _channels.map((ch) {
        return _ChannelTile(
          tag: ch['tag'] as String,
          title: ch['title'] as String,
          sub: ch['sub'] as String,
          accent: ch['color'] as Color,
        );
      }).toList(),
    );
  }

  // ─── 05 · LISTVIEW.BUILDER ──────────────────────────────────────────────────
  Widget _buildListViewBuilderSection() {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final skill = _skills[index];
            return _SkillRow(
              icon: skill['icon'] as IconData,
              label: skill['label'] as String,
              level: skill['level'] as double,
            );
          },
          childCount: _skills.length,
        ),
      ),
    );
  }

  // ─── 06 · LISTVIEW.SEPARATED ────────────────────────────────────────────────
  Widget _buildListViewSeparatedSection() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _logs.length,
      separatorBuilder: (_, __) => Container(
        height: 1,
        color: const Color(0xFF00F5A0).withOpacity(0.08),
        margin: const EdgeInsets.symmetric(horizontal: 16),
      ),
      itemBuilder: (context, index) {
        final log = _logs[index];
        return _LogTile(
          time: log['time'] as String,
          msg: log['msg'] as String,
          ok: log['ok'] as bool,
        );
      },
    );
  }

  // ─── Helper: SliverToBoxAdapter wrapper ─────────────────────────────────────
  SliverToBoxAdapter _sliverPad(Widget child) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: child,
      ),
    );
  }
}

// ─────────────────────────────────────────
//  REUSABLE WIDGETS
// ─────────────────────────────────────────

/// Grid card untuk GridView
class _GridCard extends StatelessWidget {
  const _GridCard({required this.label, required this.icon, required this.accent});
  final String label;
  final IconData icon;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xFFFEFAF5),
        border: Border.all(color: accent.withOpacity(0.3), width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(shape: BoxShape.circle, color: accent.withOpacity(0.12)),
            child: Icon(icon, color: accent, size: 22),
          ),
          const SizedBox(height: 8),
          Text(label, style: TextStyle(fontFamily: 'monospace', fontSize: 11, fontWeight: FontWeight.bold, color: accent, letterSpacing: 0.5)),
        ],
      ),
    );
  }
}

class _ChannelTile extends StatelessWidget {
  const _ChannelTile({required this.tag, required this.title, required this.sub, required this.accent});
  final String tag, title, sub;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xFFFEFAF5),
        border: Border.all(color: accent.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Container(
            width: 36, height: 36,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: accent.withOpacity(0.15)),
            child: Center(child: Text(tag, style: TextStyle(fontFamily: 'monospace', fontSize: 16, fontWeight: FontWeight.w900, color: accent))),
          ),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF4A2F22))),
              const SizedBox(height: 2),
              Text(sub, style: const TextStyle(fontSize: 11, color: Color(0xFF8B6F5E))),
            ],
          ),
          const Spacer(),
          Icon(Icons.arrow_forward_ios, size: 12, color: accent.withOpacity(0.6)),
        ],
      ),
    );
  }
}

class _SkillRow extends StatelessWidget {
  const _SkillRow({required this.icon, required this.label, required this.level});
  final IconData icon;
  final String label;
  final double level;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFFC96A3A), size: 18),
          const SizedBox(width: 12),
          SizedBox(width: 80, child: Text(label, style: const TextStyle(fontFamily: 'monospace', fontSize: 12, color: Color(0xFF4A2F22)))),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: level,
                backgroundColor: const Color(0xFFEDE0D4),
                valueColor: const AlwaysStoppedAnimation(Color(0xFFC96A3A)),
                minHeight: 6,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Text('${(level * 100).toInt()}%', style: const TextStyle(fontFamily: 'monospace', fontSize: 11, color: Color(0xFFC96A3A))),
        ],
      ),
    );
  }
}

class _LogTile extends StatelessWidget {
  const _LogTile({required this.time, required this.msg, required this.ok});
  final String time, msg;
  final bool ok;

  @override
  Widget build(BuildContext context) {
    final color = ok ? const Color(0xFF7A9E7E) : const Color(0xFFD4A85A);
    final textColor = ok ? const Color(0xFF27500A) : const Color(0xFF633806);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Text(time, style: const TextStyle(fontFamily: 'monospace', fontSize: 11, color: Color(0xFF8B6F5E))),
          const SizedBox(width: 14),
          Container(width: 6, height: 6, decoration: BoxDecoration(shape: BoxShape.circle, color: color)),
          const SizedBox(width: 12),
          Expanded(child: Text(msg, style: const TextStyle(fontSize: 13, color: Color(0xFF4A2F22)))),
          Text(ok ? 'OK' : 'WARN', style: TextStyle(fontFamily: 'monospace', fontSize: 10, color: textColor, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────
//  CUSTOM PAINTER – GRID LINES (App Bar bg)
// ─────────────────────────────────────────
class _GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFC96A3A).withOpacity(0.07)
      ..strokeWidth = 0.5;
    const step = 28.0;
    for (double x = 0; x < size.width; x += step) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y < size.height; y += step) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(_GridPainter old) => false;
}
