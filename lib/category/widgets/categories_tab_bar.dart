import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class CategoriesTabBar extends StatelessWidget implements PreferredSizeWidget {
  const CategoriesTabBar({
    required this.tabs,
    this.controller,
    this.bottom,
    super.key,
  });

  final TabController? controller;
  final List<Widget> tabs;
  final Widget? bottom;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: TabBar(
            indicatorPadding: const EdgeInsets.symmetric(horizontal: AppSpacing.xxs),
            unselectedLabelStyle: Theme.of(context).textTheme.titleMedium,
            labelStyle: Theme.of(context).textTheme.titleMedium,
            controller: controller,
            isScrollable: true,
            tabs: tabs,
          ),
        ),
        bottom ?? const SizedBox.shrink(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 48);
}

class CategoryTab extends StatelessWidget {
  const CategoryTab({
    required this.categoryName,
    this.onDoubleTap,
    super.key,
  });

  final String categoryName;
  final VoidCallback? onDoubleTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: onDoubleTap,
      child: Text(categoryName.toUpperCase()),
    );
  }
}
