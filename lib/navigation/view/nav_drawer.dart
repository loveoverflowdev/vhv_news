import 'package:app_ui/app_ui.dart' show AppColors, AppLogo, AppSpacing;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widgets/widgets.dart';


class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  static const _contentPadding = AppSpacing.lg;

  @override
  Widget build(BuildContext context) {

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(AppSpacing.lg),
        bottomRight: Radius.circular(AppSpacing.lg),
      ),
      child: Drawer(
        backgroundColor: AppColors.darkBackground,
        child: ListView(
          physics: const ClampingScrollPhysics(),
          padding: const EdgeInsets.only(
            top: kToolbarHeight,
            left: AppSpacing.lg,
            right: AppSpacing.lg,
            bottom: AppSpacing.xlg,
          ),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: _contentPadding + AppSpacing.xxs,
                horizontal: _contentPadding,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    SizedBox(width: 60, child:  AppLogo.light()),
                    const SizedBox(width: AppSpacing.lg),
                    Expanded(
                      child: Text('Cổng thông tin Lạng Sơn', 
                        style: Theme.of(context).textTheme.titleLarge
                        ?.copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const _NavDrawerDivider(),
            const NavDrawerSections(),
            ],
        ),
      ),
    );
  }
}

class _NavDrawerDivider extends StatelessWidget {
  const _NavDrawerDivider();

  @override
  Widget build(BuildContext context) {
    return const Divider(color: AppColors.outlineOnDark);
  }
}
