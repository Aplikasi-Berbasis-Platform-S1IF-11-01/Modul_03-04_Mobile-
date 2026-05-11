import 'package:flutter/material.dart';
import '../widget/ContainerWidget.dart';
import '../widget/StackWidget.dart';
import '../widget/GridviewWidget.dart';
import '../widget/ListviewWidget.dart';
import '../widget/ListviewBuilderWidget.dart';
import '../widget/ListviewSeparatedWidget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50], // Background modern (off-white)
      appBar: AppBar(
        title: const Text("Flutter UI Lab", style: TextStyle(fontWeight: FontWeight.w800)),
        backgroundColor: Colors.indigoAccent,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle("1. Container & Styling"),
            const ContainerWidget(),
            
            _buildSectionTitle("2. Stack Overlapping"),
            const StackWidget(),
            
            _buildSectionTitle("3. Grid Menu"),
            const GridviewWidget(),
            
            _buildSectionTitle("4. ListView Static"),
            const ListviewWidget(),
            
            _buildSectionTitle("5. ListView Builder (Dynamic)"),
            const ListviewBuilderWidget(),
            
            _buildSectionTitle("6. ListView Separated"),
            const ListviewSeparatedWidget(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, bottom: 12),
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: Colors.indigo[900],
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}