import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  final dynamic data;

  PostWidget({
    required this.data
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(data.imageUrl),
          SizedBox(height: 8),
          Text(
            data.title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            data.content,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}