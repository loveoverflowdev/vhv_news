import 'package:flutter/material.dart';

import 'feed_view.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feed'),
      ),
      body: const FeedView(),
    );
  }
}
