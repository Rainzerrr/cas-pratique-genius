import 'package:caspratique/utils/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class RankingCard extends StatelessWidget {
  final String userId;
  final int rank;
  final String username;
  final String imageUrl;
  final int score;

  const RankingCard({
    super.key,
    required this.userId,
    required this.rank,
    required this.username,
    required this.imageUrl,
    required this.score,
  });

  _isActiveProfile(String profileName) {
    return userId ==
        currentUserId; // Il convient biensur de passer par la session utilisateur, mais on se contentera de cela pour ce cas pratique
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            '/profile',
            arguments: {
              'userId': userId,
              'userRank': rank,
            },
          );
        },
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: _isActiveProfile(username)
                  ? const BorderSide(color: Colors.white, width: 3)
                  : BorderSide.none),
          color: _isActiveProfile(username)
              ? const Color(0xFF7584FF)
              : Colors.white,
          child: Container(
            height: 54,
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                  Text('$rank',
                      style: TextStyle(
                          color: _isActiveProfile(username)
                              ? Colors.white
                              : const Color(0xFF7584FF),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w800)),
                  const SizedBox(width: 12),
                  Text('/',
                      style: TextStyle(
                          color: _isActiveProfile(username)
                              ? Colors.white
                              : const Color(0xFF7584FF),
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w300,
                          height: 0.8)),
                  const SizedBox(width: 6),
                  Container(
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2.5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 2,
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage(imageUrl),
                        backgroundColor: const Color(0xFF7584FF),
                      )),
                  const SizedBox(width: 8),
                  Text(username,
                      style: TextStyle(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w800,
                          color: _isActiveProfile(username)
                              ? Colors.white
                              : const Color(0xFF364F6B))),
                ]),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(formatNumberWithSpaces(score),
                        style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w800,
                            color: _isActiveProfile(username)
                                ? Colors.white
                                : const Color(0xFF364F6B))),
                    const SizedBox(width: 4),
                    SvgPicture.asset(
                      'assets/icons/coins.svg',
                      height: 20,
                      width: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
