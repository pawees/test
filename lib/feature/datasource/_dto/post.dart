import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable()
class Post {
  @JsonKey(name:'id')
  final int id;
  @JsonKey(name:'userId')
  final int userId;
  @JsonKey(name:'title')
  final String title;
  @JsonKey(name:'body')
  final String body;

  factory Post.empty() {
    return  Post(
      id: 0,
      userId: 0,
      title: '',
      body: '',
    );
  }

  Post({required this.id, required this.title, required this.body, required this.userId});

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}




