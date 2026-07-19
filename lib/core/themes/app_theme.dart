import 'package:flutter/material.dart';
import 'app_text_theme.dart';

ThemeData appTheme(BuildContext context) {
  final radius = BorderRadius.circular(10);

  final primaryColor = Colors.blue;
  final primaryContainerColor = Colors.blue.shade100;
  final errorColor = Colors.redAccent;

  final colorScheme = ColorScheme.fromSeed(
    brightness: Brightness.light,
    seedColor: primaryColor,
    primary: primaryColor,
    primaryContainer: primaryContainerColor,
    error: errorColor,
  );

  final textTheme = appTextTheme(context);

  return ThemeData(
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      scrolledUnderElevation: 0,
      backgroundColor: colorScheme.onPrimary,
      surfaceTintColor: colorScheme.onSurface,
      foregroundColor: colorScheme.onSurface,
      centerTitle: false,
      elevation: 0,
      titleTextStyle: textTheme.titleMedium?.copyWith(
        color: colorScheme.onSurface,
      ),
      iconTheme: IconThemeData(color: colorScheme.primary),
      shape: Border(bottom: BorderSide(color: colorScheme.surfaceContainer)),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: colorScheme.onPrimary,
      selectedLabelStyle: textTheme.labelSmall,
      unselectedLabelStyle: textTheme.labelSmall,
      selectedItemColor: colorScheme.primary,
      unselectedItemColor: colorScheme.outlineVariant,
      elevation: 0,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: colorScheme.surface,
      modalBackgroundColor: colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: radius.topLeft),
      ),
    ),
    cardTheme: CardThemeData(
      color: colorScheme.onPrimary,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: radius),
    ),
    chipTheme: ChipThemeData(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: radius,
        side: const BorderSide(color: Colors.transparent),
      ),
      labelStyle: textTheme.labelLarge?.copyWith(
        color: WidgetStateColor.resolveWith((states) {
          return states.contains(WidgetState.selected)
              ? colorScheme.onPrimary
              : colorScheme.onSurface;
        }),
      ),
      color: WidgetStateProperty.resolveWith((state) {
        return state.contains(WidgetState.selected)
            ? primaryColor
            : colorScheme.onPrimary;
      }),
      showCheckmark: false,
    ),
    colorScheme: colorScheme,
    dialogTheme: DialogThemeData(
      backgroundColor: colorScheme.surface,
      shape: RoundedRectangleBorder(borderRadius: radius),
    ),
    disabledColor: colorScheme.surfaceContainer,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: WidgetStateProperty.all(0),
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          return states.contains(WidgetState.disabled)
              ? colorScheme.surfaceContainer
              : primaryColor;
        }),
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          return states.contains(WidgetState.disabled)
              ? colorScheme.outlineVariant
              : Colors.white;
        }),
        padding: WidgetStateProperty.all(const EdgeInsets.all(12)),
        textStyle: WidgetStateProperty.all(
          textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: radius),
        ),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          return states.contains(WidgetState.disabled)
              ? colorScheme.surfaceContainer
              : primaryColor;
        }),
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          return states.contains(WidgetState.disabled)
              ? colorScheme.outlineVariant
              : Colors.white;
        }),
        padding: WidgetStateProperty.all(const EdgeInsets.all(12)),
        textStyle: WidgetStateProperty.all(
          textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: radius),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        elevation: WidgetStateProperty.all(0),
        foregroundColor: WidgetStateProperty.all(colorScheme.primary),
        padding: WidgetStateProperty.all(const EdgeInsets.all(12)),
        textStyle: WidgetStateProperty.all(
          textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        side: WidgetStateProperty.all(BorderSide(color: colorScheme.primary)),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: radius),
        ),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: radius),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: colorScheme.onPrimary,
      floatingLabelStyle: TextStyle(color: colorScheme.primary),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: radius,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: colorScheme.outline),
        borderRadius: radius,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: colorScheme.primary),
        borderRadius: radius,
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: colorScheme.error),
        borderRadius: radius,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: colorScheme.error),
        borderRadius: radius,
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      hintStyle: textTheme.bodyLarge?.copyWith(
        color: colorScheme.outlineVariant,
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      elevation: 0,
      height: 58,
      backgroundColor: colorScheme.onPrimary,
      indicatorShape: null,
      indicatorColor: Colors.transparent,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      labelTextStyle: WidgetStateProperty.resolveWith(
        (states) => textTheme.labelSmall?.copyWith(
          color: states.contains(WidgetState.selected)
              ? primaryColor
              : colorScheme.outlineVariant,
        ),
      ),
      iconTheme: WidgetStateProperty.resolveWith(
        (states) => IconThemeData(
          color: states.contains(WidgetState.selected)
              ? primaryColor
              : colorScheme.outlineVariant,
        ),
      ),
    ),
    switchTheme: SwitchThemeData(
      trackColor: WidgetStateProperty.resolveWith(
        (states) => states.contains(WidgetState.selected)
            ? primaryColor
            : colorScheme.outlineVariant,
      ),
      thumbColor: WidgetStateProperty.all(Colors.white),
      trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
      thumbIcon: WidgetStateProperty.all(
        Icon(Icons.check, color: Colors.transparent),
      ),
    ),
    sliderTheme: SliderThemeData(
      activeTrackColor: primaryColor,
      thumbColor: Colors.white,
      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12),
      trackShape: RoundedRectSliderTrackShape(),
      trackHeight: 12,
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          return states.contains(WidgetState.disabled)
              ? colorScheme.outlineVariant
              : primaryColor;
        }),
        padding: WidgetStateProperty.all(const EdgeInsets.all(12)),
        textStyle: WidgetStateProperty.all(textTheme.titleMedium),
      ),
    ),
    textTheme: textTheme,
  );
}
