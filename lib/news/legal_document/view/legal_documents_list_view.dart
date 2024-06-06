import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:news_repository/news_repository.dart' show CategoryResponse;

import '../controller/controller.dart';

class LegalDocumentsListView extends StatefulWidget {
    final CategoryResponse category;
    const LegalDocumentsListView({super.key, required this.category,});
    
    @override
    State<LegalDocumentsListView> createState() => _LegalDocumentsListViewState();
}

class _LegalDocumentsListViewState extends State<LegalDocumentsListView> {
  late final LegalDocumentsController _legalDocumentsController;

  @override
  void initState() {
    super.initState();
    _legalDocumentsController = LegalDocumentsController(legalDocumentRepository: Get.find())
      ..getLegalDocuments(categoryId: widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            onTap: () {
              
            },
            title: Row(
              children: [
                Text(widget.category.title, 
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const Spacer(),
                const Icon(Icons.arrow_forward, size: 24),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Obx(
                () => ListView.builder(
                  itemCount: _legalDocumentsController.legalDocuments.length,
                  itemBuilder: (context, index) {
                      return TextButton(
                        onPressed: () {
                            // showAppModal(
                            //   builder: (context) {
                            //     return 
                            //   },
                            // );
                        },
                        child: Row(
                          children: [
                          Text(
                            _legalDocumentsController.legalDocuments[index].title ?? '', 
                            style: Theme.of(context).textTheme.bodyLarge,
                            textAlign: TextAlign.start,
                          ),
                          const Spacer(),
                          Text(
                            'Chi tiết', 
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.blueDress,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
