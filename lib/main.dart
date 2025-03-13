import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:freegamesexample/routing/router.dart';
import 'package:freegamesexample/firebase_options.dart';

// Most of this is just bootstrapping the app basics. Testing here provides little value.
// coverage:ignore-file

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
      valueIndicatorTextStyle:
          GoogleFonts.roboto(textStyle: textTheme.bodySmall),
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
        routerConfig: router.config(),
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
              textStyle: textTheme.labelSmall?.copyWith(color: Colors.black87),
            ),
            secondaryLabelStyle: GoogleFonts.neuton(
              textStyle: textTheme.labelSmall?.copyWith(color: Colors.white),
            ),
            secondarySelectedColor: Colors.deepOrange,
            selectedColor: Colors.deepOrange,
            disabledColor: Colors.grey[300]!,
          ),
          textTheme: GoogleFonts.ralewayTextTheme(textTheme).copyWith(
            bodySmall: GoogleFonts.neuton(textStyle: textTheme.bodySmall),
            bodyMedium: GoogleFonts.neuton(textStyle: textTheme.bodyMedium),
            bodyLarge: GoogleFonts.roboto(textStyle: textTheme.bodyLarge),
            headlineSmall: GoogleFonts.roboto(textStyle: textTheme.headlineSmall),
            headlineMedium: GoogleFonts.roboto(textStyle: textTheme.headlineMedium),
            headlineLarge: GoogleFonts.roboto(textStyle: textTheme.headlineLarge),
          ),
        ),
      ),
    );
  }
}
