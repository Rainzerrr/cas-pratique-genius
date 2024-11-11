import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProfileStatsCard extends StatelessWidget {
  final String? iconUrl;
  final String title;
  final String? titleIcon;

  final String description;

  const ProfileStatsCard({
    super.key,
    this.iconUrl,
    required this.title,
    required this.description,
    this.titleIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.5),
      child: Card(
          color: Colors.white,
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (iconUrl != null)
                  SvgPicture.asset(
                    iconUrl!,
                    width: 36,
                    height: 36,
                  ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF364F6B),
                      ),
                    ),
                    if (titleIcon != null) const SizedBox(width: 8),
                    if (titleIcon != null)
                      SvgPicture.asset(
                        titleIcon!,
                        width: 24,
                        height: 24,
                      ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 7.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromARGB(255, 72, 100, 134),
                    height: 1.0,
                  ),
                ),
                if (titleIcon != null) const SizedBox(height: 10),
              ],
            ),
          )),
    );
  }
}
