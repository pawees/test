import 'package:json_annotation/json_annotation.dart';

part 'comment.g.dart';


@JsonSerializable()
class Comment {
  @JsonKey(name:'postId')
  final int postId;
  @JsonKey(name:'id')
  final int id;
  @JsonKey(name:'name')
  final String name;
  @JsonKey(name:'email')
  final String email;
  @JsonKey(name:'body')
  final String body;

  Comment({required this.postId, required this.id, required this.name, required this.body,required this.email});

  factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);
}
