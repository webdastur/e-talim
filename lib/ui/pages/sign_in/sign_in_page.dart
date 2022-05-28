import 'package:e_talim/core/routes/module_init_guard.dart';
import 'package:e_talim/core/services/store_service.dart';
import 'package:e_talim/gen/assets.gen.dart';
import 'package:e_talim/gen/colors.gen.dart';
import 'package:e_talim/ui/pages/course_list/course_list_page.dart';
import 'package:e_talim/ui/pages/sign_in/bloc/sign_in/sign_in_bloc.dart';
import 'package:e_talim/ui/styles/text_styles.dart';
import 'package:e_talim/ui/widgets/app_button.dart';
import 'package:e_talim/ui/widgets/app_widgets.dart';
import 'package:e_talim/ui/widgets/loading_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SignInModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          SignInPage.routeName,
          child: (context, args) => SignInPage(),
          guards: [ModuleInitGuard()],
        ),
      ];

  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton<SignInBloc>(
          (i) => SignInBloc(),
          onDispose: (i) => i.close(),
        ),
      ];
}

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  static const String routeName = "/sign-in";

  @override
  Widget build(BuildContext context) {
    var signInBloc = Modular.get<SignInBloc>();
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<SignInBloc, SignInState>(
          bloc: signInBloc,
          listener: (context, state) {
            if (Modular.get<StoreService>().isLoggedIn) {
              Modular.to.navigate(CourseListPage.routeName);
            }
            if (state.hasError) {
              showToast("Xatolik sodir bo'ldi!");
            }
          },
          builder: (context, state) {
            return LoadingOverlay(
              isLoading: state.isLoading,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          "Hello dear ;-)\nSign in to learn more!",
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
                      TextField(
                        onChanged: (value) =>
                            signInBloc.add(SignInUsernameChanged(value: value)),
                        decoration: InputDecoration(
                          hintText: "username",
                        ),
                      ),
                      TextField(
                        onChanged: (value) =>
                            signInBloc.add(SignInPasswordChanged(value: value)),
                        decoration: InputDecoration(
                          hintText: "password",
                          suffixIcon: InkWell(
                            onTap: () {
                              signInBloc.add(SignInPasswordVisibilityChanged(
                                value: !state.showPassword,
                              ));
                            },
                            child: Icon(
                              state.showPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                        ),
                        obscureText: !state.showPassword,
                      ),
                      verticalDivider(64),
                      AppButton(
                        child: Text(
                          "Log in",
                          style: regularSemiBoldTextStyle(
                            color: ColorName.white,
                          ),
                        ),
                        onPressed: () {
                          signInBloc.add(SignInLoggedIn());
                        },
                        color: ColorName.buttonColor,
                      ),
                      verticalDivider(16),
                      AppButton(
                        child: Text(
                          "Forgot password",
                          style: regularSemiBoldTextStyle(
                            color: ColorName.buttonColor,
                          ),
                        ),
                        onPressed: () {},
                        color: ColorName.white,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
