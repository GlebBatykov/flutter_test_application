import '../../domain/model/image.dart';

class UserPageAlbumPreviewData {
  final String title;

  final Image? image;

  final void Function() onTap;

  UserPageAlbumPreviewData(this.title, this.image, this.onTap);
}
