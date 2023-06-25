import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/util/over_scroll.dart';
import 'core/util/generate_screen.dart';
import 'features/splash/presentation/pages/splash_page.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    // For portrait use only
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    // Set the status bar color to transparent
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    super.initState();
  }

  @override
  void dispose() async {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: WidgetsBinding.instance.window.physicalSize.width > 500
          ? true
          : false,
      builder: (context, child) {
        return MaterialApp(
          initialRoute: '/',
          onUnknownRoute: (_) => MaterialPageRoute(
            builder: (context) => const SplashPage(),
          ),
          debugShowCheckedModeBanner: false,
          builder: (context, child) {
            return ScrollConfiguration(
              behavior: MyBehavior(),
              child: child!,
            );
          },
          home: const SplashPage(),
          locale: const Locale('en', ''),
          onGenerateRoute: GeneratePage.onGenerate,
          supportedLocales: const [Locale('en', '')],
          theme: ThemeData(
            // iconTheme: const IconThemeData(color: Color(0xFF97D5C8)),
            // appBarTheme: const AppBarTheme(
            //   iconTheme: IconThemeData(color: Color(0xFFFFFFFF)),
            //   backgroundColor: Color(0xFFFE5A01),
            // ),
            // textTheme: const TextTheme(
            //   headline1: TextStyle(
            //     color: Color(0xFF4A4B4D),
            //   ),
            //   headline2: TextStyle(
            //     color: Color(0xFF7C7D7E),
            //   ),
            //   bodyText1: TextStyle(
            //     color: Color(0xFF171717),
            //   ),
            //   bodyText2: TextStyle(
            //     color: Color(0xFF231D25),
            //   ),
            //   subtitle1: TextStyle(
            //     color: Color(0xFFBABABA),
            //   ),
            //   subtitle2: TextStyle(
            //     color: Color(0xFF999594),
            //   ),
            // ),
            colorScheme: ColorScheme.fromSwatch().copyWith(
              brightness: Brightness.light,
              shadow: const Color(0xFF000000),
              primary: const Color(0xFF63b2f2),
              background: const Color(0xFFFBFAFC),
              secondary: const Color(0xFF0d47a1),
              tertiary: const Color(0xFF40484E),
            ),
            fontFamily: "Metropolis",
          ),
        );
      },
    );
  }
}
