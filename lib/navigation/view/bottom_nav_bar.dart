import 'package:flutter/material.dart';
import 'package:vhv_news/feed/feed.dart';
import 'package:vhv_news/search/search.dart';
import 'package:vhv_news/search/view/search_view.dart';

enum BottomNavTab {
  feed(0),
  search(1);

  final int tabIndex;
  const BottomNavTab(this.tabIndex);

  factory BottomNavTab.from({
    required int tabIndex,
  }) {
    return BottomNavTab.values.firstWhere((element) => element.tabIndex == tabIndex);
  }

  String getLabel() {
    switch (this) {
      case BottomNavTab.feed:
        return 'Top Tin';
      case BottomNavTab.search:
        return 'Tìm kiếm';
    }
  }

  IconData getIcon() {
    switch (this) {
      case BottomNavTab.feed:
        return Icons.home_outlined;
      case BottomNavTab.search:
        return Icons.search;
    }
  }

  static final List<Widget> widgets = [
    const FeedView(),
    const SearchView(),
  ];

  Widget getWidget() {
    switch (this) {
      case BottomNavTab.feed:
        return const FeedView();
      case BottomNavTab.search:
        return const SearchView();
    }
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    required this.currentTab,
    required this.onTap,
    super.key,
  });

  final BottomNavTab currentTab;
  final ValueSetter<BottomNavTab> onTap;

  @override
  Widget build(BuildContext context) {
    // TODO: Localize it
    return BottomNavigationBar(
      items: [
        for (final tab in BottomNavTab.values)
          BottomNavigationBarItem(
            icon: Icon(tab.getIcon()),
            label: tab.getLabel(),
          ),
      ],
      currentIndex: currentTab.tabIndex,
      onTap: (index) => onTap(BottomNavTab.from(tabIndex: index)),
    );
  }
}
