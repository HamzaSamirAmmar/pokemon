import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/util/constants.dart';

class FlutterLogo extends StatelessWidget {
  const FlutterLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        IconsAssets.flutterLogo,
        height: 250.h,
      ),
    );
  }
}
