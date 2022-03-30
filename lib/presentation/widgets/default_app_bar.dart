import 'package:flutter/material.dart';

AppBar defaultAppBar() => AppBar(
      title: const Text('Todos'),
      bottom: const PreferredSize(
        preferredSize: Size(double.maxFinite, 50),
        child: SizedBox.shrink(),
      ),
    );
