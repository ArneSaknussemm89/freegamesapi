import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import 'package:freegamesexample/presentation/constants.dart';

class ErrorViewWidget extends StatelessWidget {
  const ErrorViewWidget({Key? key, this.error, this.trace}) : super(key: key);

  final Object? error;
  final StackTrace? trace;

  // Builder function to pass to a builder function.
  factory ErrorViewWidget.builder(Object? error, StackTrace? trace) => ErrorViewWidget(error: error, trace: trace);

  @override
  Widget build(BuildContext context) {
    print(error);
    print(trace.toString());
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Error: ${error.toString()}', style: Theme.of(context).textTheme.bodyLarge),
        Text('Stack trace: ${trace.toString()}').padding(top: Spacing.two),
      ],
    );
  }
}
