import 'package:flutter/material.dart';
import '/screen/homepage.dart';

class ListViewSeparatedWidget extends StatelessWidget {
  const ListViewSeparatedWidget({super.key});

  static const List<Map<String, String>> _items = [
    {'title': 'Design System', 'subtitle': 'Colors, typography & components'},
    {'title': 'State Management', 'subtitle': 'Provider, Riverpod, Bloc'},
    {'title': 'Navigation', 'subtitle': 'Routes & deep linking'},
    {'title': 'Animations', 'subtitle': 'Implicit & explicit animations'},
    {'title': 'Networking', 'subtitle': 'HTTP, Dio & REST APIs'},
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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _items.length,
          separatorBuilder: (_, __) => Divider(
            color: AppColors.slateGrey.withOpacity(0.25),
            height: 1,
            indent: 58,
            endIndent: 16,
          ),
          itemBuilder: (context, index) {
            return ListTile(
              leading: Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: AppColors.carbonBlack.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    '${index + 1}',
                    style: const TextStyle(
                      color: AppColors.paleSlate,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              title: Text(
                _items[index]['title']!,
                style: const TextStyle(
                  color: AppColors.brightSnow,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                _items[index]['subtitle']!,
                style: TextStyle(
                  color: AppColors.paleSlate.withOpacity(0.65),
                  fontSize: 12,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
