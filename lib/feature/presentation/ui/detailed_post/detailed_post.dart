import 'package:flutter/material.dart';

class PostDetailedWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String content;
  final List<String> comments;

  PostDetailedWidget({
    required this.imageUrl,
    required this.title,
    required this.content,
    required this.comments,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(imageUrl),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            content,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 16),
          Text(
            'Comments',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          ...comments.map((comment) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  child: Text('comment.author[0]'),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'comment.author',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('comment.content'),
                    ],
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}