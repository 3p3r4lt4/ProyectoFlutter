import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flxtech/core/theme/colors_app.dart';
import 'package:flxtech/presentation/controllers/menu/menu_controller.dart';

class Menu extends StatelessWidget {
  const Menu(this.pages, this.barItems);
  final List<Widget> pages;
  final List<BottomNavigationBarItem> barItems;

  @override
  Widget build(BuildContext context) {
    final menuController = Provider.of<MenuController>(context, listen: true);
    return Scaffold(
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          BottomNavigationBar(
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
            selectedItemColor: purpleColor,
            unselectedItemColor: grayColor,
            selectedFontSize: 12,
            type: BottomNavigationBarType.fixed,
            onTap: menuController.onChangeCurrentIndexBottom,
            currentIndex: menuController.currentIndexBottom,
            items: barItems,
            backgroundColor: whiteColor,
          )
        ],
      ),
      body: IndexedStack(
        index: menuController.currentIndexBottom,
        children: pages,
      ),
    );
  }
}
