import 'package:flutter/material.dart';
import '/widget/ContainerWidget.dart';
import '/widget/GridviewWidget.dart';
import '/widget/ListViewWidget.dart';
import '/widget/ListviewBuilderWidget.dart';
import '/widget/ListViewSeparatedWidget.dart';
import '/widget/StackWidget.dart';

//Color Palette
class AppColors {
  static const brightSnow = Color(0xFFF8F9FA);
  static const paleSlate = Color(0xFFCED4DA);
  static const slateGrey = Color(0xFF6C757D);
  static const gunmetal = Color(0xFF343A40);
  static const carbonBlack = Color(0xFF212529);
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.carbonBlack,
      appBar: AppBar(
        backgroundColor: AppColors.gunmetal,
        elevation: 0,
        title: const Text(
          'Flutter UI Widgets',
          style: TextStyle(
            color: AppColors.brightSnow,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            letterSpacing: 0.5,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child:
              Container(color: AppColors.slateGrey.withOpacity(0.4), height: 1),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SectionTitle(label: 'Container'),
            const SizedBox(height: 10),
            const ContainerWidget(),
            const SizedBox(height: 28),
            _SectionTitle(label: 'GridView'),
            const SizedBox(height: 10),
            const GridViewWidget(),
            const SizedBox(height: 28),
            _SectionTitle(label: 'ListView'),
            const SizedBox(height: 10),
            const ListViewWidget(),
            const SizedBox(height: 28),
            _SectionTitle(label: 'ListView.builder'),
            const SizedBox(height: 10),
            const ListViewBuilderWidget(),
            const SizedBox(height: 28),
            _SectionTitle(label: 'ListView.separated'),
            const SizedBox(height: 10),
            const ListViewSeparatedWidget(),
            const SizedBox(height: 28),
            _SectionTitle(label: 'Stack'),
            const SizedBox(height: 10),
            const StackWidget(),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

// Reusable Section Title
class _SectionTitle extends StatelessWidget {
  final String label;
  const _SectionTitle({required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 20,
          decoration: BoxDecoration(
            color: AppColors.slateGrey,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          label,
          style: const TextStyle(
            color: AppColors.paleSlate,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.3,
          ),
        ),
      ],
    );
  }
}
