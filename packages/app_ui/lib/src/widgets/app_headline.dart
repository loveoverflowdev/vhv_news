// ignore_for_file: public_member_api_docs
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class AppHeadline extends StatelessWidget {
  const AppHeadline({
    required this.title, 
    super.key,
    this.trailing,
    this.onTap,
  });

  final Widget? trailing;
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppSpacing.lg, 
          horizontal: AppSpacing.lg,
        ),
        child: Row(
          children: [
            Text(title, 
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Spacer(),
            trailing ?? const Icon(Icons.arrow_forward, size: 24),
          ],
        ),
      ),
    );
  }
}
