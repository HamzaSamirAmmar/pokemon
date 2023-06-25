import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/util/constants.dart';
import '../../../../core/util/generate_screen.dart';

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
    return const Scaffold(
      body: FlutterLogo(),
    );
  }
}
