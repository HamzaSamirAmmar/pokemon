import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemon/features/home/presentation/pages/home_page.dart';

import '../../features/splash/presentation/pages/splash_page.dart';

class GeneratePage {
  static Route<dynamic> onGenerate(RouteSettings value) {
    String name = value.name ?? '';

    debugPrint("The name is: $name");
    switch (name) {
      /*** splashPage **/
      case PageName.splashPage:
        {
          return MaterialPageRoute(
            builder: (context) => const SplashPage(),
          );
        }

      /*** homePage **/
      case PageName.homePage:
        {
          return MaterialPageRoute(
            builder: (context) => const HomePage(),
          );
        }

      /*** default **/
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (context) {
        return Scaffold(
          body: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Page not found",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w800,
                      fontSize: 33.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 30.h,
                      left: 50.w,
                      right: 50.w,
                    ),
                    child: Text(
                      "We couldn't find the page",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 22.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "GO BACK",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class PageName {
  static const String splashPage = "/";
  static const String homePage = "/home";
}
