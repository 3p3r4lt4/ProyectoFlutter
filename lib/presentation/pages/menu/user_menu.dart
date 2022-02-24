import 'package:flutter/material.dart';

import 'package:flxtech/data/datasource/memory/dictionaries.dart';
import 'package:flxtech/presentation/pages/menu/menu.dart';
import 'package:flxtech/presentation/pages/menu/pages_nav.dart';

class UserMenu extends StatelessWidget {
  const UserMenu();

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> _barItemsMap = pagesItemBarMap;

    return Menu(
      PagesNav.listBottomNavBar(),
      List<BottomNavigationBarItem>.generate(_barItemsMap.length, (index) {
        final String key = _barItemsMap.keys.elementAt(index);
        return PagesNav.userBarItem(
          _barItemsMap[key]['icon'],
          _barItemsMap[key]['title']
        );
      }),
    );
  }
}