import 'package:json_annotation/json_annotation.dart';

import 'api_album.dart';

part 'get_albums_response.g.dart';

@JsonSerializable(createToJson: false)
class GetAlbumsResponse {
  final List<ApiAlbum> albums;

  GetAlbumsResponse(this.albums);

  factory GetAlbumsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAlbumsResponseFromJson(json);
}
