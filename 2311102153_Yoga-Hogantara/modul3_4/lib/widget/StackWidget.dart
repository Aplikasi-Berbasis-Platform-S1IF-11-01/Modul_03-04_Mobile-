import 'package:flutter/material.dart';
import '/screen/homepage.dart';

class StackWidget extends StatelessWidget {
  const StackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: SizedBox(
        height: 180,
        width: double.infinity,
        child: Stack(
          children: [
            //Layer 1: Background
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.carbonBlack, AppColors.gunmetal],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),

            // Layer 2: Decorative circle (top-right)
            Positioned(
              top: -30,
              right: -30,
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.slateGrey.withOpacity(0.2),
                ),
              ),
            ),

            // Layer 3: Decorative circle (bottom-left)
            Positioned(
              bottom: -20,
              left: -20,
              child: Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.slateGrey.withOpacity(0.15),
                ),
              ),
            ),

            // Layer 4: Small accent card
            Positioned(
              top: 16,
              right: 16,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.slateGrey.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: AppColors.paleSlate.withOpacity(0.2),
                    width: 1,
                  ),
                ),
                child: const Text(
                  'Positioned',
                  style: TextStyle(
                    color: AppColors.paleSlate,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),

            // Layer 5: Centre text content
            const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.layers_rounded,
                    color: AppColors.paleSlate,
                    size: 32,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Stack Widget',
                    style: TextStyle(
                      color: AppColors.brightSnow,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Widgets bertumpuk satu sama lain',
                    style: TextStyle(
                      color: AppColors.paleSlate,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),

            // Layer 6: Bottom tag
            Positioned(
              bottom: 12,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                  decoration: BoxDecoration(
                    color: AppColors.carbonBlack.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: AppColors.slateGrey.withOpacity(0.3),
                      width: 1,
                    ),
                  ),
                  child: const Text(
                    'Layer 6 of 6',
                    style: TextStyle(
                      color: AppColors.paleSlate,
                      fontSize: 11,
                      letterSpacing: 0.4,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
