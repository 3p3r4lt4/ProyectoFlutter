import 'package:flutter/material.dart';
import 'package:flxtech/presentation/widgets/scaffold_container.dart';

class SignInPage extends StatelessWidget {
  const SignInPage();

  @override
  Widget build(BuildContext context) {
    return ScaffoldContainer(
      'sign in page',
      isWavefooter: true,
      body: Center(
        child: Text('SignIn Page'),
      ),
    );
  }
}