
import 'package:flutter/material.dart';
import 'package:vhv_news/search/search.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {

  late final TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SearchTextField(
          controller: _textEditingController,
        )
      ],
    );
  }
}
