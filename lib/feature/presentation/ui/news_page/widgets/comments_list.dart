import 'package:flutter/material.dart';
import 'package:test_task/feature/datasource/_dto/comment.dart';

class CommentsList extends StatelessWidget {
  const CommentsList({super.key, required this.comments});
  final List<Comment> comments;

 @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: comments.length,
        itemBuilder: (context, index) {
          final comment = comments[index];
          return Card(
            margin: EdgeInsets.all(8.0),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    comment.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    comment.email,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    comment.body,
                    style: const TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}