import 'package:flutter/material.dart';
import 'package:marvelphazero/them/colors.dart';
import 'package:marvelphazero/widgets/rounded_button.dart';

class ErrorOccuredWidget extends StatelessWidget {
  final Function? onRetry;
  final bool showAppbar;

  const ErrorOccuredWidget({
    Key? key,
    this.onRetry,
    this.showAppbar = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppbar ? AppBar() : null,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                // color: MyColors.red235,
              ),
              child: Icon(
                Icons.error,
                color: AppColors.red235,
                size: 40,
              ),
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
          const Text("An error occurred",
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
            content: const Text(
              'Retry',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
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
