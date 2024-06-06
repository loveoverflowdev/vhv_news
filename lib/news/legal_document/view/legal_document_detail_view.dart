import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_repository/news_repository.dart' show FileResponse, LegalDocumentResponse;
import 'package:open_file_plus/open_file_plus.dart';

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
            textStyle: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        Obx(
          () {
            final legalDocument = _legalDocumentDetailController.legalDocumentDetail.value;
            return _buildLabel(
              context,
              title: 'Last update time: ',
              content: legalDocument == null ? null : AppDateTimeLabel(
                textStyle: Theme.of(context).textTheme.bodyLarge,
                dateTime: legalDocument.lastUpdateTime,
              ),
            );
          }
        ),        
        const Divider(),
        _FileTileListView(
          fileResponses: widget.legalDocument.attachedFiles,
          legalDocumentDetailController: _legalDocumentDetailController,
        ),
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

    final boldTextStyle =  Theme.of(context).textTheme.bodyLarge?.copyWith(
      fontWeight: FontWeight.w600,
    );
    final textStyle = Theme.of(context).textTheme.bodyLarge;
    
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xxs, horizontal: AppSpacing.lg),
      child: Row(
        children: [
          Text(title, style: boldTextStyle,),
          const SizedBox(width: AppSpacing.lg),
          if (content is Widget) 
            content
          else 
            Text(content.toString(), style: textStyle,),
        ],
      ),
    );
  }
}

class _FileTileListView extends StatefulWidget {
  final LegalDocumentDetailController legalDocumentDetailController;
  final List<FileResponse> fileResponses;

  const _FileTileListView({
    required this.fileResponses,
    required this.legalDocumentDetailController,
  });

  @override
  State<_FileTileListView> createState() => _FileTileListViewState();
}

class _FileTileListViewState extends State<_FileTileListView> {
  late List<ValueNotifier<double?>> _valueNotifiers;

  @override
  void initState() {
    super.initState();
    _valueNotifiers = [];
    for (int i = 0; i < widget.fileResponses.length; i++) {
      _valueNotifiers.add(ValueNotifier(null));
    }
  }

  @override
  void dispose() {
    for (final notifier in _valueNotifiers) { notifier.dispose(); }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.fileResponses.length,
      itemBuilder: (context, index) {
        final fileResponse = widget.fileResponses[index];
        final valueNotifier = _valueNotifiers[index];

        return TextButton(
          onPressed: () {
            widget.legalDocumentDetailController.downloadFile(
              fileResponse.fileUrl,
              onReceiveProgress: (receivedProgress, total) {
                valueNotifier.value = receivedProgress / total;
              },
            )
            .then((savedPath) {
              valueNotifier.value = null;
              OpenFile.open(savedPath);
            })
            .catchError(
              (error) {
                valueNotifier.value = null;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(error.toString()),
                  ),
                );
              }
            );
          },
          child: Row(
            children: [
              AppFileIcon(uri: fileResponse.fileUrl),
              const SizedBox(width: AppSpacing.lg),
              Text(fileResponse.title ?? ''),
              const Spacer(),
              ValueListenableBuilder(
                key: ValueKey(fileResponse.fileUrl),
                valueListenable: valueNotifier,
                builder: (context, percent, _) {
                  if (percent == null) {
                    return const Icon(Icons.file_download_outlined);
                  }
                  return AppCircularPercentIndicator(percent: percent);
                }
              ),
            ],
          ),
        );
      },
    );
  }
}
