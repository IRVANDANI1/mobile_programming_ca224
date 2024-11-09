import 'package:flutter/material.dart';
import 'package:mobile_programming_ca224/models/moment.dart';
import 'package:mobile_programming_ca224/widgets/post_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.moments});
  final List<Moment> moments;

  @override
  Widget build(BuildContext context) {
    final listPostItems = moments
        .map(
          (momentItem) => PostItem(
            moment: momentItem,
          ),
        )
        .toList();

    return SingleChildScrollView(
      child: Column(
        children: listPostItems,
      ),
    );
  }
}
