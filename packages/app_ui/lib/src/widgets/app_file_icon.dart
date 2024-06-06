// ignore_for_file: public_member_api_docs

import 'package:file_icon/file_icon.dart';
import 'package:flutter/material.dart';

class AppFileIcon extends StatelessWidget {
  const AppFileIcon({
    required this.uri, 
    super.key,
  });

  final String? uri;

  @override
  Widget build(BuildContext context) {
    if (uri == null) return const SizedBox.shrink();
    return FileIcon(
      uri!.split('/').last,
      size: 24,
    );
  }
}
