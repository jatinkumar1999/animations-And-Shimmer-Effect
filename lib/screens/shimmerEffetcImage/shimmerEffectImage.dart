import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomImage extends StatelessWidget {
  final String? imagePath;
  final double height;
  final double width;
  const CustomImage({
    Key? key,
     this.imagePath,
    this.height = 100,
    this.width = 100,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      height: height,
      fadeInCurve: Curves.elasticInOut,
      fadeInDuration: Duration(milliseconds: 300),
      fit: BoxFit.contain,
      fadeOutCurve: Curves.easeOutQuart,
      imageUrl: imagePath.toString(),
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
        ),
      ),
      placeholder: (context, url) => Shimmer.fromColors(
          baseColor: Colors.grey.withOpacity(0.2),
          highlightColor: Colors.black.withOpacity(0.2),
          period: Duration(milliseconds: 900),
          enabled: true,
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
          )),
      errorWidget: (context, url, error) => Image.asset(
        'assets/noImage.jpg',
        width: width,
        height: height,
        fit: BoxFit.contain,
      ),
    );
  }
}
