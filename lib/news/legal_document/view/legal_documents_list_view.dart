import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:news_repository/news_repository.dart' show CategoryResponse;

import '../controller/controller.dart';
import '../widgets/widgets.dart';

class LegalDocumentsListView extends StatefulWidget {
  final Widget? header;
  final ScrollPhysics? physics;
  final CategoryResponse category;

  const LegalDocumentsListView({super.key, required this.category, this.physics, this.header,});
  
  @override
  State<LegalDocumentsListView> createState() => _LegalDocumentsListViewState();
}

class _LegalDocumentsListViewState extends State<LegalDocumentsListView> with AutomaticKeepAliveClientMixin {
  late final LegalDocumentsController _legalDocumentsController;

  @override
  void initState() {
    super.initState();
    _legalDocumentsController = LegalDocumentsController(legalDocumentRepository: Get.find())
      ..getLegalDocuments(categoryId: widget.category.id);
  }

  @override
  void dispose() {
    _legalDocumentsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Obx(
        () => Visibility(
          visible: _legalDocumentsController.legalDocuments.isNotEmpty,
          replacement: const AppEmptyWidget(),
          child: ListView.builder(
            physics: widget.physics,
            itemCount: _legalDocumentsController.legalDocuments.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return widget.header ?? const SizedBox();
              }
              final legalDoc = _legalDocumentsController.legalDocuments[index - 1];
              return LegalDocumentTile(legalDoc: legalDoc);
            },
          ),
        ),
      ),
    );
  }
  
  @override
  bool get wantKeepAlive => true;
}
