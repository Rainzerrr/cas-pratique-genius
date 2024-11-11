import 'package:caspratique/utils/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProgressBar extends StatelessWidget {
  final int currentValue;
  final int minValue;
  final int maxValue;

  const ProgressBar({
    super.key,
    required this.currentValue,
    this.minValue = 1000,
    this.maxValue = 2000,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 9.0),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 30,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 45, 47, 58),
                border: Border.all(
                  color: const Color(0xFFE9CD32),
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    offset: const Offset(2, 2),
                    blurRadius: 6,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(1),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    double parentWidth = constraints.maxWidth;
                    double widthPercentage =
                        (currentValue - minValue) / (maxValue - minValue);
                    double dynamicWidth = parentWidth * widthPercentage;

                    return Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFECF1FF),
                        border: Border.all(
                          color: Colors.black,
                          width: 0.2,
                        ),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: dynamicWidth,
                            height: 33,
                            decoration: BoxDecoration(
                              color: const Color(0xFF626DC5),
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            Positioned(
              top: 7,
              left: 28,
              child: Text(
                formatNumberWithSpaces(currentValue),
                style: TextStyle(
                  color: currentValue < 100
                      ? Colors.black
                      : const Color.fromARGB(255, 217, 226, 255),
                  fontWeight: FontWeight.w900,
                  fontSize: 11.sp,
                  height: 1.0,
                ),
              ),
            ),
            Positioned(
              top: 7,
              right: 32,
              child: Text(
                formatNumberWithSpaces(maxValue),
                style: TextStyle(
                  color: currentValue > 1760
                      ? Colors.black
                      : const Color(0xFF7584FF),
                  fontWeight: FontWeight.w900,
                  fontSize: 11.sp,
                  height: 1.0,
                ),
              ),
            ),
            Positioned(
              top: -18,
              left: -30,
              child: Image.asset(
                'assets/images/trophy_progress_bar.png',
                width: 64,
                height: 64,
                scale: 0.95,
              ),
            ),
            Positioned(
              top: -18,
              right: -26,
              child: Image.asset(
                'assets/images/shield_progress_bar.png',
                width: 64,
                height: 64,
                scale: 0.9,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
