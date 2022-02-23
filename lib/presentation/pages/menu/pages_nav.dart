import 'package:flutter/widgets.dart';

import 'package:flxtech/core/theme/colors_app.dart';
import 'package:flxtech/core/values/dimensions.dart';
import 'package:flxtech/presentation/pages/clients/clients_page.dart';
import 'package:flxtech/presentation/pages/contact/contact_page.dart';
import 'package:flxtech/presentation/pages/quote/quoter_page.dart';
import 'package:flxtech/presentation/pages/servers/servers_page.dart';

class PagesNav {
  static List<Widget> listBottomNavBar() {
    return [
      const QuoterPage(),
      const ClientsPage(),
      const ServersPage(),
      const ContactPage()
    ];
  }
  static BottomNavigationBarItem userBarItem(IconData icon, String title) {
    return BottomNavigationBarItem(
        label: title,
        icon: Icon(icon, size: ICON_SIZE_DEFAULT, color: darkColor),
        activeIcon: Icon(icon, size: ICON_SIZE_DEFAULT),
      );
  }
}
