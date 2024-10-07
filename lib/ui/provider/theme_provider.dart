import 'package:exo_vr/ui/theme/exo_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider = AsyncNotifierProvider<ThemeController, ThemeData>(ThemeController.new);

class ThemeController extends AsyncNotifier<ThemeData> {
  @override
  Future<ThemeData> build() async {
    return ExoTheme.lightTheme;
  }
}
