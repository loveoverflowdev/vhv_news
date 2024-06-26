
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class FeedCarouselCell extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final void Function()? onTap;

  const FeedCarouselCell({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap?.call();
      },
      child: Container(
        margin: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: const [
            BoxShadow(
              color: AppColors.brightGrey,
              blurRadius: 4.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          child: Stack(
            children: <Widget>[
              Image.network(imageUrl, fit: BoxFit.cover, width: double.infinity, height: double.infinity),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color.fromARGB(200, 0, 0, 0), Color.fromARGB(0, 0, 0, 0)],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        title,
                        maxLines: 3,
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: AppSpacing.lg),
                      SizedBox(
                        height: 60,
                        child: AppHtmlWidget(
                          description,
                          textStyle: const TextStyle(
                            color: AppColors.white,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                      // Text(
                      //   description,
                      //   maxLines: 4,
                      //   style: const TextStyle(
                      //     color: Colors.white,
                      //     fontSize: 14.0,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
