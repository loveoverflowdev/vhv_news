import 'package:app_ui/app_ui.dart' show AppColors, AppSpacing;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

import '../../category/category.dart';

class NavDrawerSections extends StatelessWidget {
  const NavDrawerSections({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.find<CategoryController>();
    return Obx(
      () => Column(
        children: [
          const NavDrawerSectionsTitle(),
          ...[
            for (final category in categoryController.categories)
              NavDrawerSectionItem(
                key: ValueKey(category),
                title: toBeginningOfSentenceCase(category.title) ?? '',
                selected: category == categoryController.selectedCategory.value,
                onTap: () {
                  categoryController.selectCategory(category);
                  Scaffold.of(context).closeDrawer();
                },
              ),
          ],
        ],
      ),
    );
  }
}

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
          'Danh mục'.toUpperCase(),
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
