import 'package:flutter/widgets.dart';
import 'package:productivity/core/authentication/bloc/app_bloc.dart';
import 'package:productivity/features/home/home_page.dart';
import 'package:productivity/features/login/view/login_page.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  AppStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomePage.page()];
    case AppStatus.unauthenticated:
      return [LoginPage.page()];
  }
}
