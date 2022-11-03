import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvelphazero/characters/screens/characters_list_screen.dart';

import 'helpers/check_connectivity.dart';
import 'no_internet_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      _firstLoad();
    });
  }

  _firstLoad() async {
    // Delay 2 seconds to show the splash screen
    await Future.delayed(const Duration(seconds: 2));
    // Check if the internet is active on mobile
    checkConnectivityAvailability().then((available) {
      if (available) {
        // if internet is available continue to app
        Get.offAll(() => const CharactersListScreen());
      } else {
        // if internet is not available go to no internet screen
        // with a retry function to retest internet availability
        Get.offAll(() => NoInternetScreen(
              onRetry: () {
                Get.offAll(() => const SplashScreen());
              },
            ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'assets/images/splash.jpeg',
          width: double.infinity,
        ),
      ),
    );
  }
}
