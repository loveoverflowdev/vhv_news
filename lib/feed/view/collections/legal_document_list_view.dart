
import 'package:flutter/material.dart';
import 'package:news_repository/news_repository.dart';

class LegalDocumentListView extends StatelessWidget {
  final List<LegalDocumentResponse> legalDocuments;

  const LegalDocumentListView({
    super.key,
    required this.legalDocuments,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: legalDocuments.length,
      itemBuilder: (context, index) {
        final legalDocument = legalDocuments[index];
        return ListTile(
          title: Text(legalDocument.title ?? ''),
          subtitle: Text(legalDocument.brief ?? ''),
        );
      }
    );
  }
}
