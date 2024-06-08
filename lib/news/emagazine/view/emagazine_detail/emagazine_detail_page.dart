import 'package:flutter/material.dart';
import 'package:news_repository/news_repository.dart' show EmagazineResponse;
import 'package:vhv_news/news/emagazine/view/emagazine_detail/emagazine_detail_view.dart';

class EmagazineDetailArgs {
  final EmagazineResponse emagazine;

  EmagazineDetailArgs({
    required this.emagazine,
  });
}

class EmagazineDetailPage extends StatelessWidget {
  static Route route({
    required EmagazineDetailArgs args,
  }) => MaterialPageRoute(builder: (_) => EmagazineDetailPage(args: args));

  final EmagazineDetailArgs args;

  const EmagazineDetailPage({
    super.key,
    required this.args,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(args.emagazine.title),
      ),
      body: EmagazineDetailView(
        emagazine: args.emagazine,
      ),
    );
  }
}
