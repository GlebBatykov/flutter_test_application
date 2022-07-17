import 'package:mapper_box/mapper_box.dart';

import '../../domain/model/album.dart';
import '../../domain/model/comment.dart';
import '../../domain/model/company.dart';
import '../../domain/model/image.dart';
import '../../domain/model/post.dart';
import '../../domain/model/user.dart';
import '../local/database/hive/model/hive_album.dart';
import '../local/database/hive/model/hive_comment.dart';
import '../local/database/hive/model/hive_company.dart';
import '../local/database/hive/model/hive_image.dart';
import '../local/database/hive/model/hive_post.dart';
import '../local/database/hive/model/hive_user.dart';
import '../remote/http/api/model/response/get_albums/api_album.dart';
import '../remote/http/api/model/response/get_comments/api_comment.dart';
import '../remote/http/api/model/response/get_images/api_image.dart';
import '../remote/http/api/model/response/get_posts/api_post.dart';
import '../remote/http/api/model/response/get_users/api_company.dart';
import '../remote/http/api/model/response/get_users/api_user.dart';

class MapperConfiguration {
  void initialize() {
    var mapperBox = MapperBox.instanse;

    mapperBox.register<ApiUser, User>((object) => User(
        object.id,
        object.username,
        object.name,
        object.email,
        object.phone,
        object.website,
        object.working
            .map((e) => MapperBox.instanse.map<ApiCompany, Company>(e))
            .toList(),
        object.address));
    mapperBox.register<ApiPost, Post>(
        (object) => Post(object.id, object.userId, object.title, object.body));
    mapperBox.register<ApiComment, Comment>((object) => Comment(
        object.id, object.postId, object.name, object.email, object.text));
    mapperBox.register<ApiCompany, Company>(
        (object) => Company(object.name, object.address, object.catchPhrase));
    mapperBox.register<ApiAlbum, Album>(
        (object) => Album(object.id, object.userId, object.title));
    mapperBox.register<ApiImage, Image>(
        (object) => Image(object.id, object.albumId, object.title, object.url));

    mapperBox.register<HiveUser, User>((object) => User(
        object.id,
        object.username,
        object.name,
        object.email,
        object.phone,
        object.website,
        object.working
            .map((e) => MapperBox.instanse.map<HiveCompany, Company>(e))
            .toList(),
        object.address));
    mapperBox.register<HivePost, Post>(
        (object) => Post(object.id, object.userId, object.title, object.body));
    mapperBox.register<HiveComment, Comment>((object) => Comment(
        object.id, object.postId, object.name, object.email, object.text));
    mapperBox.register<HiveCompany, Company>(
        (object) => Company(object.name, object.address, object.catchPhrase));
    mapperBox.register<HiveAlbum, Album>(
        (object) => Album(object.id, object.userId, object.title));
    mapperBox.register<HiveImage, Image>(
        (object) => Image(object.id, object.albumId, object.title, object.url));

    mapperBox.register<User, HiveUser>((object) => HiveUser(
        object.id,
        object.username,
        object.name,
        object.email,
        object.phone,
        object.website,
        object.working
            .map((e) => MapperBox.instanse.map<Company, HiveCompany>(e))
            .toList(),
        object.address));
    mapperBox.register<Post, HivePost>((object) =>
        HivePost(object.id, object.userId, object.title, object.body));
    mapperBox.register<Comment, HiveComment>((object) => HiveComment(
        object.id, object.postId, object.name, object.email, object.text));
    mapperBox.register<Company, HiveCompany>((object) =>
        HiveCompany(object.name, object.address, object.catchPhrase));
    mapperBox.register<Album, HiveAlbum>(
        (object) => HiveAlbum(object.id, object.userId, object.title));
    mapperBox.register<Image, HiveImage>((object) =>
        HiveImage(object.id, object.albumId, object.title, object.url));
  }
}
