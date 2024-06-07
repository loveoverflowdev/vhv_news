import 'dart:math';

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:news_repository/news_repository.dart';

import '../controller/controller.dart';
import '../widgets/widgets.dart';

class EmagazineHeadlines extends StatefulWidget {
  final CategoryResponse category;
  
  const EmagazineHeadlines({super.key, required this.category,});

  @override
  State<EmagazineHeadlines> createState() => _EmagazineHeadlinesState();
}

class _EmagazineHeadlinesState extends State<EmagazineHeadlines> {
  late final EmagazinesController _emagazinesController;

  @override
  void initState() {
    super.initState();

    _emagazinesController = EmagazinesController(
      emagazineRepository: Get.find(),
    )..getEmagazines(categoryId: widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppHeadline(title: widget.category.title),
        Flexible(
          child: Obx(() {
            final emagazines = _emagazinesController.emagazines.value;
            final length = min(3, emagazines.length);
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [      
                for (int i = 0; i < length; i++) 
                  EmagazineTile(emagazine: emagazines[i])
              ],
            );
          }),
        ),
      ],
    );
  }
}
