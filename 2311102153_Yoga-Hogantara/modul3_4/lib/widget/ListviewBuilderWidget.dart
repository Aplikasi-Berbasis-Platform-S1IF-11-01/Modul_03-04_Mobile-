import 'package:flutter/material.dart';
import '/screen/homepage.dart';

class ListViewBuilderWidget extends StatelessWidget {
  const ListViewBuilderWidget({super.key});

  static const List<String> _fruits = [
    'Apple',
    'Banana',
    'Orange',
    'Mango',
    'Grape',
  ];

  static const List<IconData> _icons = [
    Icons.energy_savings_leaf_rounded,
    Icons.star_rounded,
    Icons.brightness_5_rounded,
    Icons.wb_sunny_rounded,
    Icons.scatter_plot_rounded,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.gunmetal,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: AppColors.slateGrey.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: ListView.builder(
        itemCount: _fruits.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final isLast = index == _fruits.length - 1;
          return Column(
            children: [
              ListTile(
                leading: Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: AppColors.slateGrey.withOpacity(0.25),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    _icons[index],
                    color: AppColors.paleSlate,
                    size: 20,
                  ),
                ),
                title: Text(
                  _fruits[index],
                  style: const TextStyle(
                    color: AppColors.brightSnow,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text(
                  'Index: $index',
                  style: TextStyle(
                    color: AppColors.paleSlate.withOpacity(0.6),
                    fontSize: 12,
                  ),
                ),
                trailing: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.slateGrey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '#${index + 1}',
                    style: const TextStyle(
                      color: AppColors.paleSlate,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              if (!isLast)
                Divider(
                  color: AppColors.slateGrey.withOpacity(0.2),
                  height: 1,
                  indent: 16,
                  endIndent: 16,
                ),
            ],
          );
        },
      ),
    );
  }
}