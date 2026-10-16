import 'package:flutter/material.dart';

/// Palet NEXVORA: krem, hitam, aksen teal.
class NX {
  static const teal = Color(0xFF2A8C86);
  static const ink = Color(0xFF111111);
  static const gold = Color(0xFFF5A623);
  static const cream = Color(0xFFF4EFE6);
  static const darkBg = Color(0xFF0E0E10);
  static const darkCard = Color(0xFF17171B);
  static const darkLine = Color(0xFF3A3A44);

  static bool isDark(BuildContext c) => Theme.of(c).brightness == Brightness.dark;
  static Color line(BuildContext c) => isDark(c) ? darkLine : ink;
  static Color card(BuildContext c) => isDark(c) ? darkCard : Colors.white;
}

class _NoAnim extends PageTransitionsBuilder {
  const _NoAnim();
  @override
  Widget buildTransitions<T>(PageRoute<T> route, BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) => child;
}

ThemeData nexvoraTheme(Brightness b, Color seed, bool anim) {
  final dark = b == Brightness.dark;
  final bg = dark ? NX.darkBg : NX.cream;
  final line = dark ? NX.darkLine : NX.ink;
  final surface = dark ? NX.darkCard : Colors.white;
  final cs = ColorScheme.fromSeed(seedColor: seed, brightness: b).copyWith(
    primary: seed,
    onPrimary: Colors.white,
    surface: surface,
    onSurface: dark ? Colors.white : NX.ink,
    outline: line,
  );
  OutlineInputBorder ob(Color c, double w) => OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: c, width: w));
  final shape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(14), side: BorderSide(color: line, width: 2));
  return ThemeData(
    useMaterial3: true,
    brightness: b,
    colorScheme: cs,
    scaffoldBackgroundColor: bg,
    canvasColor: bg,
    appBarTheme: AppBarTheme(
      backgroundColor: bg,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,
      foregroundColor: dark ? Colors.white : NX.ink,
      titleTextStyle: TextStyle(fontWeight: FontWeight.w900, fontSize: 15, letterSpacing: 1.5, color: dark ? Colors.white : NX.ink),
    ),
    cardTheme: CardThemeData(color: surface, surfaceTintColor: Colors.transparent, elevation: 0, margin: const EdgeInsets.symmetric(vertical: 4), shape: shape),
    dialogTheme: DialogThemeData(backgroundColor: surface, surfaceTintColor: Colors.transparent, shape: shape),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: surface,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: const BorderRadius.vertical(top: Radius.circular(20)), side: BorderSide(color: line, width: 2)),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: surface,
      border: ob(line, 2),
      enabledBorder: ob(line, 2),
      focusedBorder: ob(seed, 2.5),
      errorBorder: ob(Colors.redAccent, 2),
      focusedErrorBorder: ob(Colors.redAccent, 2.5),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: seed,
        foregroundColor: Colors.white,
        textStyle: const TextStyle(fontWeight: FontWeight.w900, letterSpacing: 1),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12), side: BorderSide(color: line, width: 2)),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: seed,
        foregroundColor: Colors.white,
        elevation: 0,
        textStyle: const TextStyle(fontWeight: FontWeight.w900),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12), side: BorderSide(color: line, width: 2)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: dark ? Colors.white : NX.ink,
        side: BorderSide(color: line, width: 2),
        textStyle: const TextStyle(fontWeight: FontWeight.w800),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(foregroundColor: seed, textStyle: const TextStyle(fontWeight: FontWeight.w800))),
    segmentedButtonTheme: SegmentedButtonThemeData(
      style: ButtonStyle(
        side: WidgetStatePropertyAll(BorderSide(color: line, width: 2)),
        backgroundColor: WidgetStateProperty.resolveWith((s) => s.contains(WidgetState.selected) ? seed : surface),
        foregroundColor: WidgetStateProperty.resolveWith((s) => s.contains(WidgetState.selected) ? Colors.white : (dark ? Colors.white : NX.ink)),
        textStyle: const WidgetStatePropertyAll(TextStyle(fontWeight: FontWeight.w800)),
      ),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: surface,
      side: BorderSide(color: line, width: 1.5),
      labelStyle: const TextStyle(fontWeight: FontWeight.w700),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((s) => s.contains(WidgetState.selected) ? Colors.white : line),
      trackColor: WidgetStateProperty.resolveWith((s) => s.contains(WidgetState.selected) ? seed : surface),
      trackOutlineColor: WidgetStatePropertyAll(line),
    ),
    listTileTheme: ListTileThemeData(iconColor: seed, titleTextStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 15, color: dark ? Colors.white : NX.ink)),
    dividerTheme: DividerThemeData(color: line.withOpacity(0.25)),
    progressIndicatorTheme: ProgressIndicatorThemeData(color: seed),
    snackBarTheme: SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      backgroundColor: NX.ink,
      contentTextStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12), side: const BorderSide(color: NX.teal, width: 2)),
    ),
    pageTransitionsTheme: anim
        ? const PageTransitionsTheme()
        : const PageTransitionsTheme(builders: {TargetPlatform.android: _NoAnim(), TargetPlatform.iOS: _NoAnim()}),
  );
}
