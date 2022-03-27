import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'application/services/alice.dart';
import 'data/constants.dart';
import 'features/app/data/router.dart';

final router = RootRouter();

// If we need to do anything before bootstrapping the app
// it belongs here.
Future main() async {
  await dotenv.load(fileName: 'env/.env');
  await Hive.initFlutter();

  runApp(
    const ProviderScope(
      child: AppEntry(),
    ),
  );
}

///
/// The main entry widget for the application.
///
class AppEntry extends ConsumerWidget {
  const AppEntry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final alice = ref.watch(aliceProvider);
    var client = Dio(
      BaseOptions(
        baseUrl: dotenv.env['API_URL'] ?? '',
        contentType: 'application/json',
        connectTimeout: 20000,
        headers: {
          'accept': 'application/json',
        },
      ),
    );

    var isDev = dotenv.env['ENVIRONMENT'] == 'development';
    GlobalKey<NavigatorState>? key = navigatorKey;
    if (isDev) {
      // If we are working with dev environment then we set up Alice.
      key = alice.getNavigatorKey();
      final dioInterceptor = alice.getDioInterceptor();
      if (!client.interceptors.contains(dioInterceptor)) {
        client.interceptors.add(dioInterceptor);
      }
    }

    /// This node is used for removing focus from anything else in the app.
    final mainFocus = FocusNode();

    final textTheme = Theme.of(context).textTheme;
    final sliderTheme = SliderThemeData.fromPrimaryColors(
      primaryColor: Colors.deepOrange,
      primaryColorDark: Colors.deepOrange[700]!,
      primaryColorLight: Colors.deepOrange[100]!,
      valueIndicatorTextStyle: GoogleFonts.roboto(textStyle: textTheme.overline),
    );

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
          FocusScope.of(context).requestFocus(mainFocus);
        }
      },
      child: MaterialApp.router(
        key: key,
        routerDelegate: router.delegate(),
        routeInformationParser: router.defaultRouteParser(),
        debugShowCheckedModeBanner: false,
        title: 'Todo Application',
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          child: child!,
        ),
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          sliderTheme: sliderTheme.copyWith(
            trackHeight: 5,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 20),
          ),
          chipTheme: ChipThemeData(
            brightness: Brightness.light,
            backgroundColor: Colors.grey[300]!,
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            labelStyle: GoogleFonts.neuton(
              textStyle: textTheme.caption?.copyWith(color: Colors.black87),
            ),
            secondaryLabelStyle: GoogleFonts.neuton(
              textStyle: textTheme.caption?.copyWith(color: Colors.white),
            ),
            secondarySelectedColor: Colors.deepOrange,
            selectedColor: Colors.deepOrange,
            disabledColor: Colors.grey[300]!,
          ),
          textTheme: GoogleFonts.ralewayTextTheme(textTheme).copyWith(
            caption: GoogleFonts.neuton(textStyle: textTheme.caption),
            bodyText1: GoogleFonts.neuton(textStyle: textTheme.bodyText1),
            bodyText2: GoogleFonts.neuton(textStyle: textTheme.bodyText2),
            headline1: GoogleFonts.roboto(textStyle: textTheme.headline1),
            headline2: GoogleFonts.roboto(textStyle: textTheme.headline2),
            headline3: GoogleFonts.roboto(textStyle: textTheme.headline3),
            headline4: GoogleFonts.roboto(textStyle: textTheme.headline4),
            headline5: GoogleFonts.roboto(
              textStyle: textTheme.headline5?.copyWith(fontSize: 24),
            ),
            headline6: GoogleFonts.roboto(
              textStyle: textTheme.headline6?.copyWith(
                fontSize: 18,
                letterSpacing: 0.5,
                fontWeight: FontWeight.w400,
              ),
            ),
            subtitle1: GoogleFonts.raleway(
              textStyle: textTheme.subtitle1?.copyWith(fontSize: 14, letterSpacing: 0.5),
            ),
          ),
        ),
      ),
    );
  }
}