import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:news_repository/news_repository.dart';

import '../view/legal_document_detail_view.dart';

class LegalDocumentTile extends StatelessWidget {
  const LegalDocumentTile({
    super.key,
    required this.legalDoc,
  });

  final LegalDocumentResponse legalDoc;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        showAppModal(
          builder: (context) {
            return SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  title: Text(legalDoc.title ?? ''),
                ),
                body: LegalDocumentDetailView(
                  legalDocument: legalDoc,
                ),
              ),
            );
          }, 
          context: context,
        );
      },
      child: Row(
        children: [
          const Icon(Icons.file_present),
          const SizedBox(width: AppSpacing.lg),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                legalDoc.title ?? '', 
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.start,
              ),
              AppDateTimeLabel(
                 // TODO: Localize it
                title: 'Publish time',
                dateTime: legalDoc.publishTime,
              ),
            ],
          ),
         
        ],
      ),
    );
  }
}
