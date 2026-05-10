import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme/app_theme.dart';
import '../widgets/section_header.dart';
import '../widgets/container_section.dart';
import '../widgets/gridview_section.dart';
import '../widgets/listview_sections.dart';
import '../widgets/stack_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Force dark status bar icons
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
      ),
    );

    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // ── App Bar ──────────────────────────────────────
          SliverAppBar(
            expandedHeight: 140,
            floating: false,
            pinned: true,
            backgroundColor: AppColors.background,
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              background: _buildHeroHeader(),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: Container(
                height: 1,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      AppColors.border.withOpacity(0.5),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
          ),

          // ── Body ─────────────────────────────────────────
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ─── CONTAINER ───────────────────────────
                const SectionHeader(
                  title: 'Container',
                  subtitle: 'Kotak berwarna dengan berbagai dekorasi',
                  badgeLabel: 'WIDGET #1',
                  badgeColor: AppColors.primary,
                ),
                const ContainerSection(),

                // ─── GRIDVIEW ────────────────────────────
                const SectionHeader(
                  title: 'GridView',
                  subtitle: '6 item dalam layout grid 3 kolom',
                  badgeLabel: 'WIDGET #2',
                  badgeColor: AppColors.accent,
                ),
                const GridViewSection(),

                // ─── LISTVIEW ────────────────────────────
                const SectionHeader(
                  title: 'ListView',
                  subtitle: 'Static: Item A, B, C (shrinkWrap)',
                  badgeLabel: 'WIDGET #3',
                  badgeColor: AppColors.accentWarm,
                ),
                const ListViewSection(),

                // ─── LISTVIEW.BUILDER ────────────────────
                const SectionHeader(
                  title: 'ListView.builder',
                  subtitle: 'Dibangun dari array data produk',
                  badgeLabel: 'WIDGET #4',
                  badgeColor: AppColors.accentPurple,
                ),
                const ListViewBuilderSection(),

                // ─── LISTVIEW.SEPARATED ──────────────────
                const SectionHeader(
                  title: 'ListView.separated',
                  subtitle: 'Riwayat transaksi + garis pembatas',
                  badgeLabel: 'WIDGET #5',
                  badgeColor: AppColors.accentYellow,
                ),
                const ListViewSeparatedSection(),

                // ─── STACK ───────────────────────────────
                const SectionHeader(
                  title: 'Stack',
                  subtitle: 'Tampilan bertumpuk dengan Positioned',
                  badgeLabel: 'WIDGET #6',
                  badgeColor: AppColors.danger,
                ),
                const StackSection(),

                // Bottom padding
                const SizedBox(height: 48),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroHeader() {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.background,
      ),
      child: Stack(
        children: [
          // Background glow
          Positioned(
            right: -60,
            top: -30,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.primary.withOpacity(0.12),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          // Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '2311102146',
                            style: TextStyle(
                              color: AppColors.textMuted,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.5,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Danendra Arden Shaduq',
                            style: TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: 26,
                              fontWeight: FontWeight.w900,
                              letterSpacing: -1,
                              height: 1,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppColors.surface,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: AppColors.border),
                        ),
                        child: const Text(
                          '🧩',
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  // Widget pills
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildPill('Container', AppColors.primary),
                        _buildPill('GridView', AppColors.accent),
                        _buildPill('ListView', AppColors.accentWarm),
                        _buildPill('Builder', AppColors.accentPurple),
                        _buildPill('Separated', AppColors.accentYellow),
                        _buildPill('Stack', AppColors.danger),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPill(String label, Color color) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 11,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.2,
        ),
      ),
    );
  }
}