import 'package:flutter/material.dart';
import 'package:mobile_programming_ca224/models/moment.dart';
import 'package:mobile_programming_ca224/widgets/post_item_search.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key, required this.moments});
  final List<Moment> moments;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredMoments = widget.moments
        .where((moment) => moment.caption.contains(_searchQuery))
        .toList();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Cari moment...',
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.grey.shade200,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 4 / 3,
                ),
                itemCount: filteredMoments.length,
                itemBuilder: (context, index) {
                  return PostItemSearch(moment: filteredMoments[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
