import 'package:data_config/data_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:preferences/preferences.dart';
import 'package:tekction/locator.dart';

const Color primaryColor = StaticColors.appColor;
const Color disabledTextColor = Color(0xFF718096);

const Color secondaryColor = StaticColors.appColor;
const Color disabledColor = Color(0xFFCBD5E0);
const Color textColor = Color(0xFFFFFFFF);
const Color errorColor = Color(0xFFED7662);
const Color backgroundColor = StaticColors.appColor;
const Color secondaryBackgroundColor = Color(0xFFFFFFFF);
const Color dividerColor = StaticColors.black5;
const Color inputBackgroundColor = Color(0xFF354570);
const Color checkboxColor = StaticColors.activeIcon;
const Color inputBorderColor = StaticColors.gray5;

const Color cardColor = Color(0xFF32353c);
const Color bottomNavColor = Color(0xFF1e1f23);
const Color appBarColor = Color(0xFF1e1f23);
const Color bottomSheetColor = Color(0xFF1e1f23);
const Color canvasColor = Color(0xFF1e1f23);
const Color actionColor = Color(0xFFFFFFFF);

ThemeData getApplicationTheme(context) {
  final SizeConfig sizeConfig = locator<SizeConfig>();
  sizeConfig.init(context);

  return ThemeData(
    //fontFamily: GoogleFonts.manrope().fontFamily,
    brightness: Brightness.light,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: backgroundColor,
    disabledColor: disabledColor,
    //textTheme:  GoogleFonts.manropeTextTheme( text),
    cardTheme: card,
    appBarTheme: appBar,
    errorColor: errorColor,
    dividerColor: StaticColors.black5,
    buttonTheme: button,
    chipTheme: chipTheme,
    inputDecorationTheme: inputDecoration,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    outlinedButtonTheme: outlineButton,
    elevatedButtonTheme: elevatedButton,
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateColor.resolveWith((states) {
        return checkboxColor;
      }),
    ),

    //  colorScheme: scheme.copyWith(secondary: secondaryColor),
    bottomNavigationBarTheme: bottomNav,
  );
}

ChipThemeData chipTheme = ChipThemeData(
    backgroundColor: Colors.white,
    disabledColor: Colors.white..withAlpha(10),
    selectedColor: Colors.white,
    padding: const EdgeInsets.all(12),
    labelPadding: const EdgeInsets.symmetric(horizontal: 18),
    secondaryLabelStyle: TextStyle(
      color: disabledTextColor,
      fontWeight: FontWeight.w700,
      fontSize: Dimens.sp14,
    ),
    labelStyle: TextStyle(
      color: disabledTextColor.withOpacity(0.64),
      fontWeight: FontWeight.w400,
      fontSize: Dimens.sp14,
    ));

BottomNavigationBarThemeData bottomNav = BottomNavigationBarThemeData(
    backgroundColor: backgroundColor,
    selectedItemColor: Colors.white,
    elevation: 4,
    showSelectedLabels: false,
    unselectedLabelStyle: TextStyle(
      color: textColor,
      fontWeight: FontWeight.w500,
      fontSize: Dimens.sp12,
    ),
    selectedLabelStyle: TextStyle(
      color: textColor,
      fontWeight: FontWeight.w500,
      fontSize: Dimens.sp12,
    ),
    showUnselectedLabels: false,
    type: BottomNavigationBarType.fixed,
    unselectedItemColor: Colors.black);

ColorScheme scheme = const ColorScheme.light(
  onPrimary: Colors.white,
  primary: primaryColor,
  secondary: secondaryColor,
);

ButtonThemeData button = ButtonThemeData(
  buttonColor: primaryColor,
  disabledColor: disabledTextColor,
  padding: const EdgeInsets.symmetric(
    vertical: 10,
    horizontal: 18,
  ),
  shape: RoundedRectangleBorder(
    side: BorderSide.none,
    borderRadius: BorderRadius.circular(Dimens.circularRadiusBottom),
  ),
);

OutlinedButtonThemeData outlineButton = OutlinedButtonThemeData(
  style: OutlinedButton.styleFrom(
    side: const BorderSide(
      color: primaryColor,
      width: 1,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(Dimens.circularRadiusBottom),
    ),
    padding: const EdgeInsets.symmetric(
      vertical: 10,
      horizontal: 18,
    ),
    textStyle: text.button!.copyWith(
      color: primaryColor,
    ),
  ),
);

ElevatedButtonThemeData elevatedButton = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    onSurface: secondaryColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(Dimens.circularRadiusBottom),
    ),
    shadowColor: Colors.transparent,
    padding: const EdgeInsets.symmetric(
      vertical: 10,
      horizontal: 18,
    ),
    textStyle: text.button!.copyWith(
      color: Colors.white,
    ),
    elevation: 0,
  ),
);

CardTheme card = CardTheme(
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(Dimens.circularRadiusCard),
      side: BorderSide.none,
    ));

AppBarTheme appBar = AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle.light,
    color: backgroundColor,
    toolbarTextStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: Dimens.sp16),
    titleTextStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: Dimens.sp16),
    elevation: 0,
    shadowColor: disabledColor.withOpacity(0.1),
    actionsIconTheme: const IconThemeData(
      size: Dimens.dp24,
      color: Colors.white,
    ),
    iconTheme: const IconThemeData(
      size: Dimens.dp24,
      color: primaryColor,
    ));

InputDecorationTheme inputDecoration = InputDecorationTheme(
  filled: true,
  fillColor: inputBackgroundColor,
  contentPadding: const EdgeInsets.symmetric(
    vertical: Dimens.dp16,
    horizontal: Dimens.dp18,
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.circular(Dimens.circularInputDecoration),
  ),
  disabledBorder: OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.circular(Dimens.circularInputDecoration),
  ),
  border: OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.circular(Dimens.circularInputDecoration),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(
      width: 1,
      color: inputBorderColor,
    ),
    borderRadius: BorderRadius.circular(Dimens.circularInputDecoration),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: const BorderSide(
      width: 1,
      color: errorColor,
    ),
    borderRadius: BorderRadius.circular(Dimens.circularInputDecoration),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: const BorderSide(
      width: 1,
      color: errorColor,
    ),
    borderRadius: BorderRadius.circular(Dimens.circularInputDecoration),
  ),
  labelStyle: text.subtitle1!.copyWith(fontSize: Dimens.sp15),
  hintStyle: text.subtitle1!.copyWith(fontSize: Dimens.sp15),
  errorStyle:
      text.subtitle1!.copyWith(fontSize: Dimens.sp12, color: errorColor),
);

/// Creates a theme that can be used for [ThemeData.TextTheme] .
TextTheme text = TextTheme(
  // Use for body text
  bodyText1: TextStyle(
    color: textColor,
    fontSize: Dimens.sp12,
    fontWeight: FontWeight.normal,
  ),
  bodyText2: TextStyle(
    color: disabledTextColor,
    fontSize: Dimens.sp12,
    fontWeight: FontWeight.normal,
  ),
  headline1: TextStyle(
    color: textColor,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.5,
    fontSize: Dimens.sp50,
  ),
  headline2: TextStyle(
    color: textColor,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.3,
    fontSize: Dimens.sp26,
  ),
  headline3: TextStyle(
    color: textColor,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.2,
    fontSize: Dimens.sp22,
  ),
  // Use for heading text
  headline5: TextStyle(
    color: textColor,
    fontWeight: FontWeight.w600,
    fontSize: Dimens.sp18,
  ),
  // Use for title text, AppBar
  headline6: TextStyle(
    color: textColor,
    fontWeight: FontWeight.w600,
    fontSize: Dimens.sp16,
  ),
  // Use for sub title text
  subtitle1: TextStyle(
    color: textColor,
    fontWeight: FontWeight.w400,
    fontSize: Dimens.sp16,
  ),
  subtitle2: TextStyle(
    color: textColor,
    fontWeight: FontWeight.w400,
    fontSize: Dimens.sp14,
  ),
  button: TextStyle(
    fontSize: Dimens.sp14,
    fontWeight: FontWeight.w600,
  ),
  caption: TextStyle(
    fontSize: Dimens.sp18,
    fontWeight: FontWeight.w200,
  ),
);
