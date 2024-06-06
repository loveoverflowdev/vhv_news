// ignore_for_file: public_member_api_docs
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppDateTimeLabel extends StatelessWidget {

  const AppDateTimeLabel({
    super.key,
    this.dateTime,
    this.title,
    this.textStyle,
  });

  final TextStyle? textStyle;
  final String? title;
  final DateTime? dateTime;

  @override
  Widget build(BuildContext context) {
    return dateTime == null 
      ? const SizedBox.shrink() 
      : Row(
        children: [
          Text(
            _dateTimeDisplay(title: title, dateTime: dateTime!),
            style: textStyle ?? Theme.of(context)
              .textTheme.bodySmall
              ?.copyWith(
                color: AppColors.grey
              ),
          ),
        ],
      );  
  }

  String _dateTimeDisplay({
    required DateTime dateTime, 
    String? title,
  }) {
    final dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
    final formattedDateTime = dateFormat.format(dateTime);
    return (title != null ? '$title: ' : '') + formattedDateTime;
  }
}
