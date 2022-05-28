import 'package:e_talim/core/services/http_service.dart';
import 'package:e_talim/core/services/store_service.dart';
import 'package:e_talim/ui/pages/course_list/course_list_page.dart';
import 'package:e_talim/ui/pages/home/home_page.dart';
import 'package:e_talim/ui/pages/login/login_page.dart';
import 'package:e_talim/ui/pages/sign_in/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute(
      CourseListPage.routeName,
    );
    return MaterialApp.router(
      title: 'E Talim',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        AsyncBind<StoreService>((i) => StoreService.init()),
        Bind.singleton<HttpService>((i) => HttpService()),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: HomeModule()),
        ModuleRoute('/', module: LoginModule()),
        ModuleRoute('/', module: SignInModule()),
        ModuleRoute('/', module: CourseListModule()),
      ];
}
