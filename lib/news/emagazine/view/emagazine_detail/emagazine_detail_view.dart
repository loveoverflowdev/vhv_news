import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_repository/news_repository.dart';
import 'package:vhv_news/news/emagazine/controller/controller.dart';

class EmagazineDetailView extends StatefulWidget {
  final EmagazineResponse emagazine;
  const EmagazineDetailView({super.key, required this.emagazine,});

  @override
  State<EmagazineDetailView> createState() => _EmagazineDetailViewState();
}

class _EmagazineDetailViewState extends State<EmagazineDetailView> {

  late final EmagazineDetailController _emagazineDetailController;

  @override
  void initState() {
    super.initState();
    _emagazineDetailController = EmagazineDetailController(
      emagazineRepository: Get.find(),
    )..getEmagazineDetail(id: widget.emagazine.id);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final htmlContents = _emagazineDetailController.emagazineDetail.value?.htmlContents ?? [];
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Column(
            children: [
              for (final html in htmlContents)
                AppHtmlWidget(
                  html,
                )            
            ],
          ),
        ),
      );
    });
  }
}

