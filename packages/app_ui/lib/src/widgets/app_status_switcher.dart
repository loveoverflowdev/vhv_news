import 'package:flutter/material.dart';
import 'package:get/get.dart' show RxStatus;

class AppStatusSwitcher extends StatelessWidget {
  const AppStatusSwitcher({
    super.key, 
    required this.status, 
    required this.child,
  });

  final RxStatus status;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (status.isEmpty) {
      return const Center(child: Text('No Data'));
    }
    if (status.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (status.isError) {
      return Center(child: Text('Error: ${status.errorMessage ?? ''}'));
    }
    return child;
  }
}