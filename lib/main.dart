import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:freegamesexample/routing/router.dart';
import 'package:freegamesexample/firebase_options.dart';

final router = AppRouter();

// If we need to do anything before bootstrapping the app
// it belongs here.
Future main() async {
  await dotenv.load(fileName: 'env/.env');
  await Hive.initFlutter();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final authed = FirebaseAuth.instance.currentUser != null;

  runApp(
    ProviderScope(
      child: AppEntry(authed: authed),
    ),
  );
}

///
/// The main entry widget for the application.
///
class AppEntry extends ConsumerWidget {
  const AppEntry({Key? key, this.authed = false}) : super(key: key);

  final bool authed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        routerDelegate: router.delegate(
          initialRoutes: [
            if (authed) const GamesRootRoute(),
            if (!authed) const LoginRoute(),
          ],
        ),
        routeInformationParser: router.defaultRouteParser(),
        debugShowCheckedModeBanner: false,
        title: 'Todo Application',
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
            headline5: GoogleFonts.roboto(textStyle: textTheme.headline5),
            headline6: GoogleFonts.roboto(textStyle: textTheme.headline6),
            subtitle1: GoogleFonts.neuton(textStyle: textTheme.subtitle1),
          ),
        ),
      ),
    );
  }
}
