import 'package:flutter/material.dart';

class AsyncImage extends StatelessWidget {
  final String? imageUrl;
  final String placeholderLabel;
  final IconData placeholderIcon;

  const AsyncImage({
    super.key,
    this.imageUrl,
    this.placeholderLabel = 'Фото',
    this.placeholderIcon = Icons.image,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null || imageUrl!.isEmpty) {
      return Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade400, width: 2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(placeholderIcon, size: 64, color: Colors.grey.shade600),
            const SizedBox(height: 8),
            Text(
              placeholderLabel,
              style: TextStyle(fontSize: 20, color: Colors.grey.shade700),
            ),
          ],
        ),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.network(
        imageUrl!,
        width: double.infinity,
        height: 300,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            width: double.infinity,
            height: 350,
            color: Colors.grey.shade200,
            child: Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                    : null,
                strokeWidth: 4,
              ),
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) => Container(
          width: double.infinity,
          height: 350,
          color: Colors.grey.shade300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.broken_image, size: 64, color: Colors.grey.shade600),
              const SizedBox(height: 8),
              Text('Ошибка загрузки', style: TextStyle(fontSize: 16, color: Colors.grey.shade700)),
            ],
          ),
        ),
      ),
    );
  }
}