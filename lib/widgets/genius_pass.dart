import 'package:caspratique/widgets/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GeniusPass extends StatelessWidget {
  final int geniusPassXp;
  const GeniusPass({super.key, required this.geniusPassXp});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
        child: Stack(clipBehavior: Clip.none, children: [
          Container(
              decoration: BoxDecoration(
                color: const Color(0xFFCAD6FF),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.white,
                  width: 3,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 3,
                  ),
                ],
              ),
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 10),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Stack(
                            children: [
                              Text(
                                'Genius',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 14.5.sp,
                                    fontWeight: FontWeight.w700,
                                    foreground: Paint()
                                      ..style = PaintingStyle.stroke
                                      ..strokeWidth = 5.5
                                      ..color = Colors.white,
                                    height: 0.8),
                              ),
                              Text(
                                'Genius',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 14.5.sp,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xFF7584FF),
                                    height: 0.8),
                              ),
                            ],
                          ),
                          const SizedBox(width: 3.5),
                          Stack(
                            children: [
                              Text(
                                'Pass',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 14.5.sp,
                                    fontWeight: FontWeight.w700,
                                    foreground: Paint()
                                      ..style = PaintingStyle.stroke
                                      ..strokeWidth = 5.5
                                      ..color = Colors.white,
                                    height: 0.8),
                              ),
                              Text(
                                'Pass',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 14.5.sp,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xFF7584FF),
                                    height: 0.8),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      ProgressBar(
                        currentValue: geniusPassXp.toDouble(),
                      ),
                      const SizedBox(height: 28),
                    ],
                  ))),
          Positioned.fill(
            bottom: -20,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(0, 30),
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xFF7584FF),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14.0,
                    vertical: 1.0,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  side: const BorderSide(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Voir plus',
                      style: TextStyle(
                        fontSize: 8.5.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '+',
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                          height: 0.0),
                    ),
                  ],
                ),
              ),
            ),
          )
        ]));
  }
}
