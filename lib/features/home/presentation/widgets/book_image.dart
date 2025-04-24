import 'package:bookly_app/core/widgets/loading_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BookImage extends StatelessWidget {
  final double radius;
  final String imageURL;
  const BookImage({
    super.key,
    required this.radius,
    required this.imageURL,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 2.6 / 4,
        child: imageURL.isNotEmpty
            ? CachedNetworkImage(
                imageUrl: imageURL,
                fit: BoxFit.fill,
                placeholder: (context, url) => const CustomLoadingIndicator(),
                errorWidget: (context, url, error) =>
                    const Icon(Icons.error_outline),
              )
            : const SizedBox(
                child: Placeholder(),
              ),
      ),
    );
  }
}
