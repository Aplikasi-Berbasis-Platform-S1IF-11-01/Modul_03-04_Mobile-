import 'package:flutter/material.dart';
import '/screen/homepage.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({super.key});

  static const List<Map<String, dynamic>> _items = [
    {'label': 'A', 'icon': Icons.looks_one_rounded},
    {'label': 'B', 'icon': Icons.looks_two_rounded},
    {'label': 'C', 'icon': Icons.looks_3_rounded},
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
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: _items.asMap().entries.map((entry) {
          final isLast = entry.key == _items.length - 1;
          final item = entry.value;
          return Column(
            children: [
              ListTile(
                leading: Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: AppColors.slateGrey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    item['icon'] as IconData,
                    color: AppColors.paleSlate,
                    size: 20,
                  ),
                ),
                title: Text(
                  'Item ${item['label']}',
                  style: const TextStyle(
                    color: AppColors.brightSnow,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text(
                  'ListView item ${item['label']}',
                  style: TextStyle(
                    color: AppColors.paleSlate.withOpacity(0.7),
                    fontSize: 12,
                  ),
                ),
                trailing: Icon(
                  Icons.chevron_right_rounded,
                  color: AppColors.slateGrey,
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
        }).toList(),
      ),
    );
  }
}
