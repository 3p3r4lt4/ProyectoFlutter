import 'package:flutter/material.dart';

import 'package:flxtech/presentation/pages/auth/signin_page.dart';

void main() {
  runApp(const FLXTech());
}

class FLXTech extends StatelessWidget {
  const FLXTech();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignInPage(),
    );
  }
}