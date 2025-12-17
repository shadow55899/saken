import 'package:flutter/material.dart';
import '../service/api_service.dart'; 

class Photo extends StatelessWidget {
  final String imageUrl;
  final double? size;

  const Photo({
    super.key,
    required this.imageUrl,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    final double boxSize = size ?? 120.0;

    
    final origin = Uri.parse(ApiService.baseUrl).origin; // e.g. http://192.168.0.104:8000
    String finalUrl;
    if (imageUrl.isEmpty) {
      finalUrl = '';
    } else if (imageUrl.startsWith('http')) {
      finalUrl = imageUrl;
    } else {
      finalUrl = '$origin/storage/$imageUrl';
    }

  
    print('Photo widget final URL -> $finalUrl');

    if (finalUrl.isEmpty) {
      return SizedBox(
        width: boxSize,
        height: boxSize,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.shade300,
          ),
          child: const Icon(Icons.person, size: 40, color: Colors.grey),
        ),
      );
    }

    return SizedBox(
      width: boxSize,
      height: boxSize,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          finalUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) =>
          const Center(child: Icon(Icons.broken_image, color: Colors.red, size: 36)),
          loadingBuilder: (context, child, progress) {
            if (progress == null) return child;
            return Center(
              child: SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  value: progress.expectedTotalBytes != null
                      ? progress.cumulativeBytesLoaded / progress.expectedTotalBytes!
                      : null,
                ),
              ),
            );
          },
        ),
      ),
    );
  } 
} 