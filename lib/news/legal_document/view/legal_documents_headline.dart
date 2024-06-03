
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_repository/news_repository.dart' show CategoryResponse;
import 'package:vhv_news/news/legal_document/controller/legal_documents_controller.dart';

class LegalDocumentsHeadline extends StatefulWidget {
  final CategoryResponse category;
  
  const LegalDocumentsHeadline({
    super.key, 
    required this.category,
  });

  @override
  State<LegalDocumentsHeadline> createState() => _LegalDocumentsHeadlineState();
}

class _LegalDocumentsHeadlineState extends State<LegalDocumentsHeadline> {
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
              child: GetBuilder<LegalDocumentsController>(
                init: _legalDocumentsController,
                builder: (controller) {
                  final legalDocuments = controller.legalDocuments;
                  final length = min(legalDocuments.length, 3);
                  
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.grey.withOpacity(0.1),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        for (int index = 0; index < length; index++)
                          TextButton(
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
                                  legalDocuments[index].title ?? '', 
                                  style: Theme.of(context).textTheme.bodyLarge,
                                  textAlign: TextAlign.start,
                                ),
                                const Spacer(),
                                Text(
                                  'Chi tiết', 
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        
                      ],
                    ),
                  );
                }
              ),
            ),
          )
        ],
      ),
    );
  }
}
