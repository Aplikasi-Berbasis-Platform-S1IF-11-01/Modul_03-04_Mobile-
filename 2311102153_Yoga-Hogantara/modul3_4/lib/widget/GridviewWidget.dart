import 'package:flutter/material.dart';
import '/screen/homepage.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({super.key});

  
  static const List<Color> _gridColors = [
    Color(0xFF495057), 
    Color(0xFF6C757D), 
    Color(0xFF343A40), 
    Color(0xFF52606B),
    Color(0xFF3D4550), 
    Color(0xFF5A6370), 
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(6, (index) {
        return Container(
          decoration: BoxDecoration(
            color: _gridColors[index],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.paleSlate.withOpacity(0.15),
              width: 1,
            ),
          ),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.grid_view_rounded,
                color: AppColors.brightSnow.withOpacity(0.7),
                size: 28,
              ),
              const SizedBox(height: 8),
              Text(
                'Grid ${index + 1}',
                style: const TextStyle(
                  color: AppColors.brightSnow,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
