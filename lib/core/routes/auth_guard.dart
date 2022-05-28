import 'dart:async';

import 'package:e_talim/core/services/store_service.dart';
import 'package:e_talim/ui/pages/home/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthGuard extends RouteGuard {
  AuthGuard() : super(redirectTo: HomePage.routeName);
  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) async {
    return Modular.get<StoreService>().isLoggedIn;
  }
}
