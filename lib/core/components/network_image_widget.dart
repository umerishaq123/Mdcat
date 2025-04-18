import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mdcat_kawiish/config/constants/api_links.dart';
import 'loading_widget.dart';

// Custom network image widget, used to show images and handle exceptions.
// This widget is generic and can be changed across the app.
class NetworkImageWidget extends StatelessWidget {
  final String? imageUrl;
  final double width, height, borderRadius, iconSize;
  final BoxFit boxFit;

  const NetworkImageWidget({
    super.key,
    required this.imageUrl,
    this.width = 40,
    this.height = 40,
    this.borderRadius = 18,
    this.iconSize = 20,
    this.boxFit = BoxFit.cover,
  });

  bool _isValidUrl(String? url) {
    if (url == null || url.isEmpty) return false;
    return url.startsWith('http') || url.startsWith('https');
  }

  @override
  Widget build(BuildContext context) {
    useThisImageUrl(String imageUrl) => '${Applinks.baseUrl}$imageUrl';

    debugPrint("Loading image URL: ${useThisImageUrl(imageUrl!)}");

    bool isValidUrl = _isValidUrl(useThisImageUrl(imageUrl!));

    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: !isValidUrl
          ? Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              child: Icon(Icons.person_outline, size: iconSize),
            )
          : CachedNetworkImage(
              imageUrl: useThisImageUrl(imageUrl!),
              width: width,
              height: height,
              imageBuilder: (context, imageProvider) => Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: boxFit,
                  ),
                ),
              ),
              placeholder: (context, url) => Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: LoadingWidget(),
                ),
              ),
              errorWidget: (context, url, error) => Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              child: Icon(Icons.person_outline, size: iconSize),
            )
            ),
    );
  }
}
