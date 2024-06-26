
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:news_repository/news_repository.dart';
import 'package:vhv_news/app/app.dart';

import '../view/emagazine_detail/emagazine_detail_page.dart';

class EmagazineTile extends StatelessWidget {
  final void Function(EmagazineResponse)? onTap;  
  final EmagazineResponse emagazine;

  const EmagazineTile({
    super.key,
    required this.emagazine,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          PageRouteName.emagazineDetail.routeLink,
          arguments: EmagazineDetailArgs(emagazine: emagazine),
        );
      },
      child: SizedBox(
        height: 108,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
          child: Row(
            children: [
              const SizedBox(width: AppSpacing.lg),
              AspectRatio(
                aspectRatio: 12 / 9,
                child: AppCachedNetworkImage(
                  uri: emagazine.imageUrl ?? '',
                ),
              ),
              const SizedBox(width: AppSpacing.lg),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      emagazine.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Flexible(
                      child: AppHtmlWidget(
                        emagazine.brief ?? '',
                        textStyle: Theme.of(context).textTheme.bodySmall,
                        customWidgetBuilder: (element) {
                          return Text(
                            element.text,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
