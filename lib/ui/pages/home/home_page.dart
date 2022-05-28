import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_talim/core/routes/module_init_guard.dart';
import 'package:e_talim/gen/assets.gen.dart';
import 'package:e_talim/gen/colors.gen.dart';
import 'package:e_talim/ui/pages/home/bloc/slider/slider_cubit.dart';
import 'package:e_talim/ui/pages/login/login_page.dart';
import 'package:e_talim/ui/pages/sign_in/sign_in_page.dart';
import 'package:e_talim/ui/styles/text_styles.dart';
import 'package:e_talim/ui/widgets/app_button.dart';
import 'package:e_talim/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          HomePage.routeName,
          child: (context, args) => HomePage(),
          guards: [
            ModuleInitGuard(),
          ],
        ),
      ];
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton<SliderCubit>(
          (i) => SliderCubit(),
          onDispose: (i) => i.close(),
        ),
      ];
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorName.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(23),
            child: Column(
              children: [
                CarouselSlider(
                  items: [
                    Assets.images.human.svg(),
                    Assets.images.human.svg(),
                    Assets.images.human.svg(),
                  ],
                  options: CarouselOptions(
                    autoPlay: true,
                    onPageChanged: (index, reason) {
                      Modular.get<SliderCubit>().onChanged(index);
                    },
                  ),
                ),
                verticalDivider(32),
                Text(
                  "This isn’t just an edu platform like any other!",
                  style: headingTextStyle(
                    color: ColorName.bodyColor,
                  ),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
                verticalDivider(16),
                Text(
                  "We installed Purex dispensers throughout the prison to combat diseases…and it was a Roaring Success (as in Roaring Drunk) I mean we had Long lines of prisoners fist fighting to use them.",
                  style: smallTextStyle(
                    color: ColorName.mutedColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                verticalDivider(24),
                BlocBuilder<SliderCubit, int>(
                  bloc: Modular.get<SliderCubit>(),
                  builder: (context, state) {
                    return AnimatedSmoothIndicator(
                      activeIndex: state,
                      count: 3,
                      effect: const SlideEffect(
                        dotWidth: 6,
                        dotHeight: 6,
                      ),
                    );
                  },
                ),
                verticalDivider(49),
                AppButton(
                  child: Text(
                    "Register",
                    style: regularSemiBoldTextStyle(
                      color: ColorName.white,
                    ),
                  ),
                  onPressed: () {
                    Modular.to.pushNamed(LoginPage.routeName);
                  },
                ),
                verticalDivider(16),
                AppButton(
                  child: Text(
                    "Log in",
                    style: regularSemiBoldTextStyle(
                      color: ColorName.buttonColor,
                    ),
                  ),
                  onPressed: () {
                    Modular.to.pushNamed(SignInPage.routeName);
                  },
                  color: ColorName.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
