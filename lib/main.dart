import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:marvelphazero/characters/models/character_provider.dart';
import 'package:marvelphazero/splash_screen.dart';
import 'package:marvelphazero/them/them.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    // DeviceOrientation.landscapeLeft,
    // DeviceOrientation.landscapeRight
  ]).then((_) {
    SharedPreferences.getInstance().then((prefs) async {
      runApp(MultiProvider(providers: [
        ChangeNotifierProvider(
          create: (_) => CharacterProvider(),
        ),
      ], child: const App()));
    });
  });
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: GetMaterialApp(
        navigatorKey: Get.key,
        defaultTransition: Transition.native,
        opaqueRoute: Get.isOpaqueRouteDefault,
        popGesture: Get.isPopGestureEnable,
        locale: const Locale('en'),
        home: const SplashScreen(),
        theme: lightTheme,
      ),
    );
  }
}
