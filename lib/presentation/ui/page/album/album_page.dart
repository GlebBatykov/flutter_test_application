import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/page/album/album_page_cubit.dart';
import '../../../model/album_page_image_data.dart';
import 'album_page_carousel_item.dart';

class AlbumPage extends StatelessWidget {
  const AlbumPage({Key? key}) : super(key: key);

  CarouselSlider _buildSlider(
      List<AlbumPageImageData> data, BoxConstraints constraints) {
    var width = constraints.maxWidth;

    var length = data.length;

    return CarouselSlider.builder(
        itemCount: length,
        itemBuilder: (context, itemIndex, pageViewIndex) {
          return AlbumPageCarouselItem(
            data: data[itemIndex],
            width: width,
            margin: _getMargin(itemIndex, length),
          );
        },
        options: CarouselOptions(
            height: constraints.maxHeight * 0.5, enableInfiniteScroll: false));
  }

  EdgeInsets _getMargin(int index, int length) {
    if (index == 0 && length == 1) {
      return const EdgeInsets.only(top: 10, bottom: 10);
    } else if (index == 0) {
      return const EdgeInsets.only(top: 10, bottom: 10, right: 10);
    } else if (index < length - 1) {
      return const EdgeInsets.only(top: 10, bottom: 10, right: 10, left: 10);
    } else {
      return const EdgeInsets.only(top: 10, bottom: 10, left: 10);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Album')),
      body: LayoutBuilder(builder: ((context, constraints) {
        return BlocBuilder<AlbumPageCubit, AlbumPageState>(
            builder: (context, state) {
          const textStyle = TextStyle(fontSize: 16);

          if (state is AlbumPageLoad) {
            return const Center(
                child: Text('Images load...', style: textStyle));
          } else if (state is AlbumPageNoImages) {
            return const Center(child: Text('No images', style: textStyle));
          } else if (state is AlbumPageShowImages) {
            return Center(
                child: Container(
                    margin: const EdgeInsets.only(left: 15, right: 15),
                    child: _buildSlider(state.data, constraints)));
          } else {
            return Container();
          }
        });
      })),
    );
  }
}
