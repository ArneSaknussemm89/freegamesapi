import 'package:flutter/material.dart';

// coverage:ignore-file

class Spacing {
  static double get one => 5;
  static double get two => one * 2.0;
  static double get three => one * 3.0;
  static double get four => two * 2.0;
  static double get five => one * 5.0;
  static double get six => two * 3.0;
  static double get ten => two * 5.0;
  static double get bottomSpacing => ten + kBottomNavigationBarHeight;
}
