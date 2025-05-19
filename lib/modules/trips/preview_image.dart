import 'package:flutter/material.dart';

class PreviewImage extends StatelessWidget {
  final String imageUrl;

  const PreviewImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.network(
          imageUrl,
          fit: BoxFit.contain,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const CircularProgressIndicator();
          },
          errorBuilder:
              (context, error, stackTrace) =>
                  const Text("Failed to load image"),
        ),
      ),
    );
  }
}
