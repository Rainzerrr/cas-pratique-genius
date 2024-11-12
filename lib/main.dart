import 'package:caspratique/firebase_options.dart';
import 'package:caspratique/pages/profile.dart';
import 'package:caspratique/pages/ranking.dart';
import 'package:caspratique/widgets/custom_appbar.dart';
import 'package:caspratique/widgets/custom_bottom_nav_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Verouiller l'orientation du smartphone pour bloquer le mode paysage.
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(300, 700),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: "Poppins",
            ),
            home: const Scaffold(
              appBar: CustomAppBar(),
              body: RankingPage(),
              bottomNavigationBar: CustomBottomNavigationBar(),
            ),
            routes: {
              '/profile': (context) => const ProfilePage(),
            },
          );
        });
  }
}
