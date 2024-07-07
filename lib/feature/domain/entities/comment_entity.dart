import 'package:equatable/equatable.dart';

class CommentsEntity extends Equatable {
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;
  const CommentsEntity({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [postId, id, name, email,body];
}