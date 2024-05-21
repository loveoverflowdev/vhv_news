import 'package:app_ui/app_ui.dart' show AppColors, AppSpacing;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vhv_news/home/controller/home_controller.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

class CategoryModel {
  final String name;

  const CategoryModel({
    required this.name,
  });

}

class NavDrawerSections extends StatelessWidget {
  const NavDrawerSections({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = <CategoryModel>[
      const CategoryModel(name: 'Feed'),
      const CategoryModel(name: 'Search'),
    ];
    final homeController = Get.find<HomeController>();

    return Column(
      children: [
        const NavDrawerSectionsTitle(),
        ...[
          for (int index = 0; index < categories.length; index++)
            NavDrawerSectionItem(
              key: ValueKey(categories[index]),
              title: toBeginningOfSentenceCase(categories[index].name) ?? '',
              selected: index == homeController.tabIndex.value,
              onTap: () {
                Scaffold.of(context).closeDrawer();
                homeController.changeTab(index);
              },
            ),
            
        ],
      ],
    );
  }
}

@visibleForTesting
class NavDrawerSectionsTitle extends StatelessWidget {
  const NavDrawerSectionsTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.lg + AppSpacing.xxs,
        ),
        child: Text(
          'Danh mục',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColors.primaryContainer,
              ),
        ),
      ),
    );
  }
}

class NavDrawerSectionItem extends StatelessWidget {
  const NavDrawerSectionItem({
    required this.title,
    this.onTap,
    this.leading,
    this.selected = false,
    super.key,
  });

  static const _borderRadius = 100.0;

  final String title;
  final Widget? leading;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      leading: leading,
      visualDensity: const VisualDensity(
        vertical: VisualDensity.minimumDensity,
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: selected ? AppSpacing.xlg : AppSpacing.lg,
        vertical: AppSpacing.lg + AppSpacing.xxs,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(_borderRadius),
        ),
      ),
      horizontalTitleGap: AppSpacing.md,
      minLeadingWidth: AppSpacing.xlg,
      selectedTileColor: AppColors.white.withOpacity(0.08),
      selected: selected,
      onTap: onTap,
      title: Text(
        title,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: selected
                  ? AppColors.highEmphasisPrimary
                  : AppColors.mediumEmphasisPrimary,
            ),
      ),
    );
  }
}
