import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:news_repository/news_repository.dart';
import 'package:vhv_news/app/app.dart';

import '../../controller/controller.dart';
import '../../widgets/widgets.dart';
import '../emagazine_detail/emagazine_detail.dart';

class EmagazinesListView extends StatefulWidget {
  final Widget? header;
  final ScrollPhysics? physics;
  final CategoryResponse category;
  
  const EmagazinesListView({super.key, required this.category, this.physics, this.header,});

  @override
  State<EmagazinesListView> createState() => _EmagazinesListViewState();
}

class _EmagazinesListViewState extends State<EmagazinesListView> with AutomaticKeepAliveClientMixin {
  late final EmagazinesController _emagazinesController;

  @override
  void initState() {
    super.initState();
    _emagazinesController = EmagazinesController(
      emagazineRepository: Get.find(),
    )..getEmagazines(categoryId: widget.category.id);
  }

  @override
  void dispose() {
    _emagazinesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Obx(() {
      final emagazines = _emagazinesController.emagazines.value;
      final length = emagazines.length;
      return Visibility(
        visible: emagazines.isNotEmpty,
        replacement: const AppEmptyWidget(),
        child: ListView.builder(
          physics: widget.physics,
          itemCount: length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return widget.header ?? const SizedBox.shrink();
            }
            return EmagazineTile(
              emagazine: emagazines[index - 1],
            );
          },
        ),
      );
    });
  }
  
  @override
  bool get wantKeepAlive => true;
}
