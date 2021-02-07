import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageNetWorkCached extends StatelessWidget {
  final String url;

  ImageNetWorkCached(this.url);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: this.url,
      imageBuilder: (context, imageProvider) => Container(
        child: Image.network(imageProvider.toString()),
      ),
        placeholder: (context, url) {
          return Container(
            child: Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.red,
              ),
            ),
          );
        },
        errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }


}
