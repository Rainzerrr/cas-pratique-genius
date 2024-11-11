import 'package:caspratique/services/firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({
    super.key,
  });

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  UserService userService = UserService();

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            backgroundColor: Colors.transparent,
            items: [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: SvgPicture.asset(
                    'assets/icons/podium_primary.svg',
                    width: 32,
                    height: 32,
                  ),
                ),
                label: 'Classements',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: SvgPicture.asset('assets/icons/trophy.svg',
                      width: 32, height: 32, color: const Color(0xFF364F6B)),
                ),
                label: 'Tournois',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: SvgPicture.asset('assets/icons/stadium.svg',
                      width: 32, height: 32, color: const Color(0xFF364F6B)),
                ),
                label: 'Accueil',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: SvgPicture.asset('assets/icons/field.svg',
                      width: 32, height: 32, color: const Color(0xFF364F6B)),
                ),
                label: 'Matchs',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: SvgPicture.asset('assets/icons/ticket.svg',
                      width: 32, height: 32, color: const Color(0xFF364F6B)),
                ),
                label: 'Mes Pronos',
              ),
            ],
            selectedItemColor: const Color(0xFF7584FF),
            unselectedItemColor: const Color(0xFF364F6B),
            selectedLabelStyle: TextStyle(
              fontSize: 8.sp,
              fontWeight: FontWeight.w700,
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 8.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ));
  }
}
