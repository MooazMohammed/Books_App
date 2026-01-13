import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: AspectRatio(
        aspectRatio: 2.6 / 4,
        child: ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(16),
          child: _imagePlaceHolder(),
        ),
      ),
    );
  }

  Widget _imagePlaceHolder() {
    if (imageUrl.isNotEmpty && imageUrl != null) {
      return CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.fill,

        placeholder: (context, url) => const Center(child:  CircularProgressIndicator()),
        errorWidget: (context, url, error) => _placeHolder(),
      );
    } else {
      return _placeHolder();
    }
  }

  Widget _placeHolder() {
    return Image.asset(
      "assets/images/notinvalid_cover_book.png",
      fit: BoxFit.fill,
    );
  }
}
