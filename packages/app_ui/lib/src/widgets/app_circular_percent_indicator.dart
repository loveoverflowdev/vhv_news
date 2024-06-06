// ignore_for_file: public_member_api_docs
import 'package:app_ui/src/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart' show CircularPercentIndicator;

class AppCircularPercentIndicator extends StatelessWidget {
  const AppCircularPercentIndicator({
    required this.percent, 
    super.key,
  });

  final double percent;

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 16,
      animation: true,
      lineWidth: 2,
      percent: percent,
      center: Text(
        '${(percent * 100).toStringAsFixed(0)} %', 
        style: const TextStyle(fontSize: 11),
      ),
      backgroundColor: AppColors.grey.shade200,
      progressColor: AppColors.blueDress,
    );
  }
}
