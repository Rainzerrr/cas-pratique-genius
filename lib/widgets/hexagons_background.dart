import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HexagonsBackground extends StatelessWidget {
  const HexagonsBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(40),
        bottomRight: Radius.circular(40),
      ),
      child: Container(
        height: 350,
        decoration: const BoxDecoration(),
        child: Stack(
          children: [
            // Hexagons en haut à gauche dans de lecture horizontal : 3 1 2
            Positioned(
              top: -14,
              left: 68,
              child: Transform.rotate(
                angle: 88 * 3.14159 / 180,
                child: SvgPicture.asset(
                  'assets/icons/hexagon.svg',
                  width: 70,
                  height: 70,
                  color: const Color(0xFF22265A),
                ),
              ),
            ),
            Positioned(
              top: -22,
              left: -20,
              child: Transform.rotate(
                angle: 0 * 3.14159 / 180,
                child: SvgPicture.asset(
                  'assets/icons/hexagon.svg',
                  width: 120,
                  height: 120,
                  color: const Color(0xFF252D6E),
                ),
              ),
            ),
            Positioned(
              top: 38,
              left: 54,
              child: Transform.rotate(
                angle: 98 * 3.14159 / 180,
                child: SvgPicture.asset(
                  'assets/icons/hexagon.svg',
                  width: 60,
                  height: 60,
                  color: const Color.fromARGB(255, 39, 45, 102),
                ),
              ),
            ),
            // Hexagons au milieu à gauche dans de lecture horizontal : 1 3 2
            Positioned(
              top: 112,
              left: -10,
              child: Transform.rotate(
                angle: 10 * 3.14159 / 180,
                child: SvgPicture.asset(
                  'assets/icons/hexagon.svg',
                  width: 80,
                  height: 80,
                  color: const Color(0xFF22265A),
                ),
              ),
            ),
            Positioned(
              top: 134,
              left: 76,
              child: Transform.rotate(
                angle: 130 * 3.14159 / 180,
                child: SvgPicture.asset(
                  'assets/icons/hexagon.svg',
                  width: 50,
                  height: 50,
                  color: const Color(0xFF22265A),
                ),
              ),
            ),
            Positioned(
              top: 118,
              left: 46,
              child: Transform.rotate(
                angle: 110 * 3.14159 / 180,
                child: SvgPicture.asset(
                  'assets/icons/hexagon.svg',
                  width: 48,
                  height: 48,
                  color: const Color(0xFF222A68),
                ),
              ),
            ),
            // Hexagon au milieu à gauche, en dessous du trophé
            Positioned(
              top: 206,
              left: 36,
              child: Transform.rotate(
                angle: 10 * 3.14159 / 180,
                child: SvgPicture.asset(
                  'assets/icons/hexagon.svg',
                  width: 30,
                  height: 30,
                  color: const Color(0xFF22265A),
                ),
              ),
            ),
            // Hexagon en bas à gauche
            Positioned(
              bottom: -8,
              left: 12,
              child: Transform.rotate(
                angle: 10 * 3.14159 / 180,
                child: SvgPicture.asset(
                  'assets/icons/hexagon.svg',
                  width: 50,
                  height: 50,
                  color: const Color(0xFF22265A),
                ),
              ),
            ),
            // Hexagon en bas à gauche du nombre de coins de l'utilisateur
            Positioned(
              bottom: 38,
              left: 70,
              child: Transform.rotate(
                angle: 0 * 3.14159 / 180,
                child: SvgPicture.asset(
                  'assets/icons/hexagon.svg',
                  width: 78,
                  height: 78,
                  color: const Color(0xFF252D6E),
                ),
              ),
            ),
            // Hexagon en haut à droite
            Positioned(
              top: -20,
              right: -50,
              child: Transform.rotate(
                angle: 10 * 3.14159 / 180,
                child: SvgPicture.asset(
                  'assets/icons/hexagon.svg',
                  width: 100,
                  height: 100,
                  color: const Color(0xFF252D6E),
                ),
              ),
            ),
            // Hexagon en haut au milieu ordre: 1,2
            Positioned(
              top: -26,
              right: 100,
              child: Transform.rotate(
                angle: 10 * 3.14159 / 180,
                child: SvgPicture.asset(
                  'assets/icons/hexagon.svg',
                  width: 80,
                  height: 80,
                  color: const Color(0xFF22265A),
                ),
              ),
            ),
            Positioned(
              top: 40,
              right: 115,
              child: Transform.rotate(
                angle: 10 * 3.14159 / 180,
                child: SvgPicture.asset(
                  'assets/icons/hexagon.svg',
                  width: 30,
                  height: 30,
                  color: const Color(0xFF252D6E),
                ),
              ),
            ),
            // Hexagon en haut à droite, à côté du bouton paramètres
            Positioned(
              top: 84,
              right: 52,
              child: Transform.rotate(
                angle: 10 * 3.14159 / 180,
                child: SvgPicture.asset(
                  'assets/icons/hexagon.svg',
                  width: 38,
                  height: 38,
                  color: const Color(0xFF22265A),
                ),
              ),
            ),
            // Hexagon en milieu à droite, à côté du bouton card
            Positioned(
              bottom: 146,
              right: 52,
              child: Transform.rotate(
                angle: 86 * 3.14159 / 180,
                child: SvgPicture.asset(
                  'assets/icons/hexagon.svg',
                  width: 38,
                  height: 38,
                  color: const Color(0xFF22265A),
                ),
              ),
            ),
            // Hexagons en bas dans l'extremité droite, vers les boutons card et parametres. ordre: 1,2
            Positioned(
              bottom: 102,
              right: -20,
              child: Transform.rotate(
                angle: 0 * 3.14159 / 180,
                child: SvgPicture.asset(
                  'assets/icons/hexagon.svg',
                  width: 70,
                  height: 70,
                  color: const Color(0xFF252D6E),
                ),
              ),
            ),
            Positioned(
              bottom: 44,
              right: -39,
              child: Transform.rotate(
                angle: 90 * 3.14159 / 180,
                child: SvgPicture.asset(
                  'assets/icons/hexagon.svg',
                  width: 90,
                  height: 90,
                  color: const Color(0xFF22265A),
                ),
              ),
            ),
            // Hexagons en bas dans l'extremité droite, vers les boutons card et parametres. ordre: 1,2
            Positioned(
              bottom: -5,
              right: 24,
              child: Transform.rotate(
                angle: 10 * 3.14159 / 180,
                child: SvgPicture.asset(
                  'assets/icons/hexagon.svg',
                  width: 30,
                  height: 30,
                  color: const Color(0xFF252D6E),
                ),
              ),
            ),
            // Hexagons en bas entre le total de coins et le genius pass
            Positioned(
              bottom: 5,
              right: 102,
              child: Transform.rotate(
                angle: 120 * 3.14159 / 180,
                child: SvgPicture.asset(
                  'assets/icons/hexagon.svg',
                  width: 92,
                  height: 92,
                  color: const Color(0xFF252D6E),
                ),
              ),
            ),
            Positioned(
              bottom: 54,
              right: 94,
              child: Transform.rotate(
                angle: 10 * 3.14159 / 180,
                child: SvgPicture.asset(
                  'assets/icons/hexagon.svg',
                  width: 46,
                  height: 46,
                  color: const Color(0xFF22265A),
                ),
              ),
            ),
            // Hexagons en haut a gauche du circle avatar
            Positioned(
              top: 66,
              left: 160,
              child: Transform.rotate(
                angle: 10 * 3.14159 / 180,
                child: SvgPicture.asset(
                  'assets/icons/hexagon.svg',
                  width: 30,
                  height: 30,
                  color: const Color(0xFF22265A),
                ),
              ),
            ),
            // Hexagons en haut a gauche du circle avatar, ordre: 2, 1
            Positioned(
              top: 121,
              right: 122,
              child: Transform.rotate(
                angle: 74 * 3.14159 / 180,
                child: SvgPicture.asset(
                  'assets/icons/hexagon.svg',
                  width: 30,
                  height: 30,
                  color: const Color(0xFF22265A),
                ),
              ),
            ),
            Positioned(
              top: 114,
              right: 140,
              child: Transform.rotate(
                angle: 112 * 3.14159 / 180,
                child: SvgPicture.asset(
                  'assets/icons/hexagon.svg',
                  width: 30,
                  height: 30,
                  color: const Color(0xFF252D6E),
                ),
              ),
            ),
            // Hexagons au milieu, en bas du circle avatar, ordre: 2, 1
            Positioned(
              top: 120,
              left: 156,
              child: Transform.rotate(
                angle: 80 * 3.14159 / 180,
                child: SvgPicture.asset(
                  'assets/icons/hexagon.svg',
                  width: 100,
                  height: 100,
                  color: const Color(0xFF252D6E),
                ),
              ),
            ),
            Positioned(
              top: 180,
              left: 156,
              child: Transform.rotate(
                angle: 90 * 3.14159 / 180,
                child: SvgPicture.asset(
                  'assets/icons/hexagon.svg',
                  width: 50,
                  height: 50,
                  color: const Color(0xFF252D6E),
                ),
              ),
            ),
            Positioned(
              top: 194,
              left: 228,
              child: Transform.rotate(
                angle: 90 * 3.14159 / 180,
                child: SvgPicture.asset(
                  'assets/icons/hexagon.svg',
                  width: 30,
                  height: 30,
                  color: const Color(0xFF252D6E),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// Color(0xFF252D6E)
// Color(0xFF262A63)