import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvelphazero/characters/screens/characters_list_screen.dart';

import 'helpers/check_connectivity.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _conectivityActive = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      _firstLoad();
    });
  }

  _firstLoad() {
    checkConnectivityAvailability().then((available) async {
      if (!available) await Future.delayed(const Duration(seconds: 2));
      setState(() {
        _conectivityActive = available;
      });
      if (available) {
        Get.offAll(() => const CharactersListScreen());
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
