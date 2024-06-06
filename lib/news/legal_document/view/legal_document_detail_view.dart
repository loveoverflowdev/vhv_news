
import 'dart:ffi';

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_repository/news_repository.dart' show LegalDocumentResponse;

import '../controller/controller.dart' show LegalDocumentDetailController;

class LegalDocumentDetailView extends StatefulWidget {
  final LegalDocumentResponse legalDocument;

  const LegalDocumentDetailView({
    super.key, 
    required this.legalDocument,
  });

  @override
  State<LegalDocumentDetailView> createState() => _LegalDocumentDetailViewState();
}

class _LegalDocumentDetailViewState extends State<LegalDocumentDetailView> {

  late final LegalDocumentDetailController _legalDocumentDetailController;

  @override
  void initState() {

    super.initState();
    _legalDocumentDetailController = LegalDocumentDetailController(legalDocumentRepository: Get.find())
      ..getLegalDetailDocument(id: widget.legalDocument.id);
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: Localize this
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.md),
      children: [
        _buildLabel(
          context,
          title: 'Description: ', 
          content: widget.legalDocument.brief ?? '',
        ),
        _buildLabel(
          context,
          title: 'Creator: ', 
          content: widget.legalDocument.creator ?? '',
        ),
        _buildLabel(
          context,
          title: 'Code: ', 
          content: widget.legalDocument.code ?? '',
        ),
        _buildLabel(
          context,
          title: 'Publish time: ',
          content: AppDateTimeLabel(
            dateTime: widget.legalDocument.publishTime,
            textStyle: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        Obx(
          () => _buildLabel(
            context,
            title: 'Last update time: ',
            content: AppDateTimeLabel(
              textStyle: Theme.of(context).textTheme.bodyMedium,
              dateTime: _legalDocumentDetailController.legalDocumentDetail.value?.lastUpdateTime,
            ),
          ),
        ),        
        const Divider(),
        _buildFileDowloadTileList(context),
      ],
    );
  }

  Widget _buildLabel(BuildContext context, {
    required String title,
    required dynamic content,
  }) {
    if (content == null || (content is String && content.isEmpty)) {
      return const SizedBox.shrink();
    }

    final textStyle =  Theme.of(context).textTheme.bodyMedium?.copyWith(
      fontWeight: FontWeight.w600,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xxs, horizontal: AppSpacing.lg),
      child: Row(
        children: [
          Text(title, style: textStyle,),
          const SizedBox(width: AppSpacing.lg),
          if (content is Widget) 
            content
          else 
            Text(content.toString()),
        ],
      ),
    );
  }

  Widget _buildFileDowloadTileList(BuildContext context) {
    // final keyTheme =  Theme.of(context).textTheme.titleMedium?.copyWith(
    //   fontWeight: FontWeight.w600,
    // );
    final fileResponses = widget.legalDocument.attachedFiles;
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: fileResponses.length,
      itemBuilder: (context, index) {
        final fileResponse = fileResponses[index];
        return TextButton(
          onPressed: () {
            
          },
          child: Row(
            children: [
              const Icon(Icons.file_download),
              const SizedBox(width: AppSpacing.lg),
              Text(fileResponse.title ?? ''),
            ],
          ),
        );
      },
    );
  }
}
