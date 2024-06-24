
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({required this.controller, super.key});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
      child: AppTextField(
        controller: controller,
        prefix: const Icon(Icons.search),
        suffix: IconButton(
          onPressed: controller.clear,
          icon: const Icon(Icons.clear),
        ),
        // Localize it
        hintText: 'Nhập từ khóa ...',
        keyboardType: TextInputType.text,
      ),
    );
  }
}

