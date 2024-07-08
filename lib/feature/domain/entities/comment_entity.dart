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
  
    static const empty = CommentsEntity(
      postId: 0,
      id: 0,
      name: '',
      email: '',
      body: '',
  );

  factory CommentsEntity.fromMap(map) {
    return CommentsEntity(
      postId: map.postId as int,
      id: map.id as int,
      name: map.name as String,
      email: map.email as String,
      body: map.body as String,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [postId, id, name, email, body];
}
