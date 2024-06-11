// ignore_for_file: public_member_api_docs

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' show RxStatus;

class AppStatusSwitcher extends StatelessWidget {
  const AppStatusSwitcher({
    super.key, 
    required this.status, 
    required this.builder,
  });

  final RxStatus status;
  final Widget Function(BuildContext) builder;

  @override
  Widget build(BuildContext context) {
    if (status.isEmpty) {
      return const AppEmptyWidget();
    }
    if (status.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (status.isError) {
      return Center(child: Text('Error: ${status.errorMessage ?? ''}'));
    }
    return builder(context);
  }
}
