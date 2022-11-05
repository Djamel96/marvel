import 'package:flutter/material.dart';
import 'package:marvelphazero/them/colors.dart';

class RoundedButton extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget content;
  final Color backgroundColor;
  final Color? splashColor;
  final GestureTapCallback? onPressed;
  final Border? border;
  final List<BoxShadow>? shadow;
  final EdgeInsets? contentPadding;
  final bool active;
  RoundedButton({
    Key? key,
    this.width,
    this.height,
    required this.content,
    this.onPressed,
    this.backgroundColor = AppColors.appMain100,
    this.splashColor,
    this.shadow,
    this.border,
    this.contentPadding,
    this.active = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: active ? (backgroundColor) : AppColors.appMain50,
            border: border,
            borderRadius: BorderRadius.circular(32),
            boxShadow: !active
                ? null
                : shadow ??
                    [
                      const BoxShadow(
                          color: AppColors.buttonShadow1,
                          offset: Offset(0, 6),
                          blurRadius: 6,
                          spreadRadius: -1),
                      const BoxShadow(
                          color: AppColors.buttonShadow2,
                          offset: Offset(0, 0),
                          blurRadius: 1,
                          spreadRadius: 0)
                    ],
          ),
          child: Material(
            color: Colors.transparent,
            child: Ink(
              //  height: REGULAR_BUTTON_HEIGHT,
              width: width ?? double.infinity,
              child: InkWell(
                splashColor: splashColor ?? AppColors.buttonSplash,
                customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Container(
                  height: height ?? 60,
                  alignment: Alignment.center,
                  child: content,
                ),
                onTap: onPressed,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
