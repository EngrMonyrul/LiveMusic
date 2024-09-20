import 'package:flutter/material.dart';
import 'package:live_score/utils/constants/assets_const.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({super.key, this.imageUrl});

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl ?? "",
      alignment: Alignment.center,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Image.asset(
          AssetsConsts.noImage,
          fit: BoxFit.cover,
        );
      },
      loadingBuilder: (context, child, loadingProgress) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
