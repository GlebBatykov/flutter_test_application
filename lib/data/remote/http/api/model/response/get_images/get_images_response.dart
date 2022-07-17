import 'package:flutter_test_application/data/remote/http/api/model/response/get_images/api_image.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_images_response.g.dart';

@JsonSerializable(createToJson: false)
class GetImagesResponse {
  final List<ApiImage> images;

  GetImagesResponse(this.images);

  factory GetImagesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetImagesResponseFromJson(json);
}
