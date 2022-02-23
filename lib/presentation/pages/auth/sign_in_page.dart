import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'package:flxtech/core/theme/colors_app.dart';
import 'package:flxtech/core/values/dimensions.dart';
import 'package:flxtech/generated/l10n.dart';
import 'package:flxtech/presentation/controllers/auth/auth_controller.dart';
import 'package:flxtech/presentation/widgets/buttons/custom_text_button.dart';
import 'package:flxtech/presentation/widgets/buttons/theme_button.dart';
import 'package:flxtech/presentation/widgets/custom_text_formfield.dart';
import 'package:flxtech/presentation/widgets/scaffold_container.dart';

class SignInPage extends StatelessWidget {
  const SignInPage();

  @override
  Widget build(BuildContext context) {
    final S l10n = S.current;
    return ScaffoldContainer(
      l10n.signIn,
      isWaveFooter: true,
      body: Container(
        height: MediaQuery.of(context).size.height * 0.7,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(MARGIN_SIZE_LARGE),
              child: Image.asset(
                'assets/brand.png',
                color: purpleColor,
              ),
            ),
            Expanded(child: const SizedBox()),
            CustomTextFormField(
              hint: l10n.email,
              rightIcon: Icons.alternate_email_outlined,
            ),
            CustomTextFormField(
              hint: l10n.password,
              rightIcon: Icons.remove_red_eye_outlined,
            ),
            Expanded(child: const SizedBox()),
            Consumer<AuthController>(
              builder: (context, controller, _) => ThemeButton(
                  onPress: () => controller.handleSignIn(context),
                  title: l10n.signIn,
                ),
            ),
            Expanded(child: const SizedBox()),
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              child: Column(
                children: [
                  CustomTextButton(
                    l10n.needAnAccount,
                    color: orangeColor,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  // const Divider(color: whiteColor, height: 1.2),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 3,
                      addAutomaticKeepAlives: true,
                      shrinkWrap: true,
                      itemExtent: MediaQuery.of(context).size.width/5,
                      padding: const EdgeInsets.all(0),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Container(
                        margin: const EdgeInsets.only(
                          right: MARGIN_SIZE_SMALL,
                          left: MARGIN_SIZE_SMALL,
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/fb.svg',
                          color: whiteColor,
                        ),
                      ),
                    ),
                  ),
                  ThemeButton(
                    title: l10n.signUp,
                    onPress: () => null,
                    buttonColor: whiteColor,
                    textColor: purpleColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
