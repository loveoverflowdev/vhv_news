import 'package:app_ui/app_ui.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vhv_news/search/search.dart';

import '../controller/controller.dart';
import 'search_result_view.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {

  late final TextEditingController _textEditingController;
  late final NewsSearchController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = NewsSearchController(searchRepository: Get.find());

    _textEditingController = TextEditingController()..addListener(() {
      EasyDebounce.debounce(
        'search_news',
        const Duration(milliseconds: 400),
        () => _searchController.search(_textEditingController.text),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
      child: Column(
        children: [
          SearchTextField(
            controller: _textEditingController,
          ),
          Flexible(
            child: Obx(
              () => AppStatusSwitcher(
                status: _searchController.status.value,
                builder: (_) => SearchResultView(
                  searchResult: _searchController.searchResult.value!,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
