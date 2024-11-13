import 'package:flutter/material.dart';
import 'package:mobile_programming_ca224/models/moment.dart';

class PostItemSearch extends StatelessWidget {
  const PostItemSearch({super.key, required this.moment});

  final Moment moment;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(moment.imageUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
