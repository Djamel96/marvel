import 'package:flutter/material.dart';
import 'package:marvelphazero/them/colors.dart';

import 'widgets/rounded_button.dart';

class NoInternetScreen extends StatelessWidget {
  final Function? onRetry;
  const NoInternetScreen({Key? key, this.onRetry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              "assets/images/no_internet.png",
              width: 136,
            ),
          ),
          const SizedBox(height: 20),
          const Text("Ooops!",
              style: TextStyle(
                color: AppColors.defaultTextColor,
                fontSize: 24,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
              )),
          const SizedBox(height: 20),
          const Text(
              "Internet is slow or nonexistent.\nPlease check your internet settings.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff95959a),
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              )),
          const SizedBox(height: 40),
          RoundedButton(
            width: 248,
            content: const Text("Try again",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  letterSpacing: -0.3,
                )),
            onPressed: () {
              if (onRetry != null) {
                onRetry!();
              }
            },
          ),
        ],
      ),
    );
  }
}
