import 'package:e_talim/gen/assets.gen.dart';
import 'package:e_talim/gen/colors.gen.dart';
import 'package:e_talim/ui/styles/text_styles.dart';
import 'package:e_talim/ui/widgets/app_button.dart';
import 'package:e_talim/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          LoginPage.routeName,
          child: (context, args) => LoginPage(),
        ),
      ];

  @override
  List<Bind<Object>> get binds => [];
}

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const String routeName = "/login";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Center(
                child: Text(
                  "Welcome! \nSign up to continue...",
                  style: headingTextStyle(
                    color: ColorName.bodyColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              verticalDivider(64),
              socialLoginBtn(
                image: Assets.images.icGoogle.image(),
                text: "Login with Google",
                onPressed: () {},
              ),
              verticalDivider(16),
              socialLoginBtn(
                image: Assets.images.icFacebook.svg(),
                text: "Login with Facebook",
                onPressed: () {},
              ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  "or",
                  style: regularTextStyle(
                    color: ColorName.mutedColor,
                  ),
                ),
              ),
              AppButton(
                child: Text(
                  "Sign up with email",
                  style: regularSemiBoldTextStyle(
                    color: ColorName.bodyColor,
                  ),
                ),
                onPressed: () {},
                color: ColorName.greyColor,
                hasBorder: false,
              ),
              verticalDivider(24),
              Text(
                "By signing up, you’re afree with Privacy and Disclaimer information",
                style: smallTextStyle(
                  color: ColorName.mutedColor,
                ),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 64,
                  bottom: 16,
                ),
                child: Text(
                  "Don’t have account yet?",
                  style: regularTextStyle(
                    color: ColorName.mutedColor,
                  ),
                ),
              ),
              AppButton(
                child: Text(
                  "Register",
                  style: regularSemiBoldTextStyle(
                    color: ColorName.white,
                  ),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
