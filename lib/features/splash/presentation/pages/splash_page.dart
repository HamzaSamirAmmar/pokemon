import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokemon/core/util/generate_screen.dart';

import '../../../../core/util/constants.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _pushAfterDuration = const Duration(seconds: 3);

  @override
  void initState() {
    Future.delayed(_pushAfterDuration).whenComplete(
      () => Navigator.of(context).pushReplacementNamed(PageName.homePage),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          IconsAssets.flutterLogo,
          height: 250.h,
        ),
      ),
    );
  }
}
