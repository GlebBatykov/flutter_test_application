import 'package:flutter/material.dart';

import '../../../model/album_page_image_data.dart';

class AlbumPageCarouselItem extends StatelessWidget {
  final AlbumPageImageData data;

  final double width;

  final EdgeInsets margin;

  const AlbumPageCarouselItem(
      {Key? key, required this.margin, required this.data, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: margin,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 2.5),
                color: Colors.black.withOpacity(0.5),
                blurRadius: 5)
          ]),
      child: Column(
        children: [
          Text(data.title, style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 20),
          Image.network(data.url, height: 150, width: 150)
        ],
      ),
    );
  }
}
