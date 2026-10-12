import 'package:flutter/material.dart';

/// Network image with a loading spinner and an error placeholder,
/// so a missing image never breaks the layout.
class AppImage extends StatelessWidget {
  final String url;
  final BoxFit fit;

  const AppImage({super.key, required this.url, this.fit = BoxFit.cover});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      fit: fit,
      loadingBuilder: (context, child, progress) {
        if (progress == null) return child;
        return Container(
          color: Colors.grey.shade200,
          child: const Center(
            child: SizedBox(
              width: 22,
              height: 22,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) => Container(
        color: Colors.grey.shade200,
        child: const Center(
          child: Icon(Icons.image_not_supported_outlined, color: Colors.grey),
        ),
      ),
    );
  }
}