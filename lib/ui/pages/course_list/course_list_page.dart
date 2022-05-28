import 'package:e_talim/core/routes/auth_guard.dart';
import 'package:e_talim/core/routes/module_init_guard.dart';
import 'package:e_talim/gen/assets.gen.dart';
import 'package:e_talim/gen/colors.gen.dart';
import 'package:e_talim/ui/pages/course_list/bloc/category/category_bloc.dart';
import 'package:e_talim/ui/pages/course_list/bloc/course/course_bloc.dart';
import 'package:e_talim/ui/styles/text_styles.dart';
import 'package:e_talim/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CourseListModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          CourseListPage.routeName,
          child: (context, args) => CourseListPage(),
          guards: [
            ModuleInitGuard(),
            AuthGuard(),
          ],
        ),
      ];

  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton<CategoryBloc>(
          (i) => CategoryBloc()..add(CategoryLoaded()),
          onDispose: (value) => value.close(),
        ),
        Bind.singleton<CourseBloc>(
          (i) => CourseBloc()..add(CourseLoaded()),
          onDispose: (value) => value.close(),
        ),
      ];
}

class CourseListPage extends StatelessWidget {
  const CourseListPage({Key? key}) : super(key: key);

  static const String routeName = "/course-list";

  @override
  Widget build(BuildContext context) {
    var categoryBloc = Modular.get<CategoryBloc>();
    var courseBloc = Modular.get<CourseBloc>();
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header(),
                verticalDivider(32),
                SearchField(),
                sectionTitle(
                  title: "Popular categories",
                ),
                BlocBuilder<CategoryBloc, CategoryState>(
                  bloc: categoryBloc,
                  builder: (context, state) {
                    if (state.isLoading) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state.category == null) {
                      return Center(
                        child: Icon(Icons.error),
                      );
                    }
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          state.category!.items!.length,
                          (index) => categoryItem(
                            context: context,
                            title: state.category!.items![index].title!,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                sectionTitle(
                  title: "Most watched",
                ),
                BlocBuilder<CourseBloc, CourseState>(
                  bloc: courseBloc,
                  builder: (context, state) {
                    if (state.isLoading) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state.course == null) {
                      return Center(
                        child: Icon(Icons.error),
                      );
                    }
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          state.course!.items!.length,
                          (index) => courseItem(
                            context: context,
                            title: state.course!.items![index].title!,
                            description:
                                state.course!.items![index].description!,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget courseItem({
    required BuildContext context,
    required String title,
    required String description,
  }) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      margin: const EdgeInsets.only(right: 17),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: MediaQuery.of(context).size.width * 0.5,
            width: MediaQuery.of(context).size.width * 0.7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            margin: EdgeInsets.only(bottom: 17),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.width * 0.5,
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: networkImage(
                      "https://picsum.photos/id/278/536/354",
                    ),
                  ),
                ),
                Positioned(
                  left: 5,
                  right: 5,
                  bottom: 19,
                  child: Text(
                    title,
                    style: regularSemiBoldTextStyle(
                      color: ColorName.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              iconWithTitle(
                title: "5.0 (120)",
                icon: Assets.images.icStar.svg(),
              ),
              iconWithTitle(
                title: "12.580",
                icon: Assets.images.icEye.svg(),
              ),
              iconWithTitle(
                title: "26 ls",
                icon: Assets.images.icPlay.svg(),
              ),
            ],
          ),
          verticalDivider(18),
          Divider(
            thickness: 1,
          ),
          Text(
            description,
            style: regularSemiBoldTextStyle(
              color: ColorName.mutedColor,
            ),
          ),
          verticalDivider(18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Assets.images.profile.image(),
                  horizontalDivider(8),
                  Text(
                    "Alex Johnson",
                    style: smallMediumTextStyle(
                      color: ColorName.mutedColor,
                    ),
                  ),
                ],
              ),
              Text(
                "\$19.99",
                style: smallMediumTextStyle(
                  color: ColorName.accentColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget iconWithTitle({
    required String title,
    required Widget icon,
  }) {
    return Row(
      children: [
        icon,
        horizontalDivider(4),
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w300,
            color: ColorName.mutedColor,
          ),
        )
      ],
    );
  }

  Widget categoryItem({
    required BuildContext context,
    required String title,
  }) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.5,
      width: MediaQuery.of(context).size.width * 0.7,
      margin: EdgeInsets.only(right: 17),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              height: MediaQuery.of(context).size.width * 0.5,
              width: MediaQuery.of(context).size.width * 0.7,
              child: networkImage(
                "https://picsum.photos/id/277/536/354",
              ),
            ),
          ),
          Positioned(
            left: 5,
            right: 5,
            bottom: 19,
            child: Text(
              title,
              style: regularSemiBoldTextStyle(
                color: ColorName.white,
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }

  Widget sectionTitle({
    required String title,
  }) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 44,
        bottom: 32,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: smallHeadingStyle(
              color: ColorName.mutedColor,
            ),
          ),
          Text(
            "See all",
            style: smallLinkTextStyle(
              color: ColorName.buttonColor,
            ),
          )
        ],
      ),
    );
  }

  Row header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hey, Alisher!",
              style: smallHeadingStyle(
                color: ColorName.mutedColor,
              ),
            ),
            verticalDivider(8),
            Text(
              "What you want to learn today?",
              style: regularTextStyle(
                color: ColorName.mutedColor,
              ),
            ),
          ],
        ),
        Assets.images.profile.image(),
      ],
    );
  }
}

class SearchField extends StatelessWidget {
  SearchField({
    Key? key,
  }) : super(key: key);

  var outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(
      color: ColorName.greyColor,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        border: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        fillColor: ColorName.greyColor,
        filled: true,
        suffixIcon: Icon(Icons.search),
        hintStyle: smallTextStyle(
          color: ColorName.mutedColor,
        ),
        hintText: "Courese name...",
      ),
    );
  }
}
