import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:marvelphazero/them/colors.dart';
import 'package:marvelphazero/widgets/default_loading.dart';

class CustomCachedImage extends StatelessWidget {
  final String? url;
  final double width;
  final double height;
  final double radius;
  final GestureTapCallback? onTap;
  final BoxFit boxFit;
  final Color? color;
  final BoxShape shape;
  final Alignment alignment;

  const CustomCachedImage({
    Key? key,
    this.url,
    required this.width,
    this.radius = 0,
    required this.height,
    this.onTap,
    this.boxFit = BoxFit.cover,
    this.color,
    this.shape = BoxShape.rectangle,
    this.alignment = Alignment.center,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return (url?.isEmpty ?? true)
        ? _placeHolder()
        : Container(
            color: color,
            alignment: alignment,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(radius),
              child: CachedNetworkImage(
                imageUrl: url!,
                width: width,
                fit: boxFit,
                imageBuilder: (context, imageProvider) => Container(
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: boxFit,
                    ),
                  ),
                ),
                placeholder: (context, url) => _placeHolder(),
                errorWidget: (context, url, error) => _placeHolder(),
              ),
            ),
          );
  }

  _placeHolder() {
    return Container(
      alignment: alignment,
      width: width,
      height: height,
      child: Loading(
        color: Colors.grey.shade300,
      ),
      decoration: BoxDecoration(
          color: AppColors.gery236,
          shape: shape,
          borderRadius: BorderRadius.circular(radius)),
    );
  }
}
