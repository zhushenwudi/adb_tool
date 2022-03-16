// ignore_for_file: constant_identifier_names

import 'package:adb_tool/app/controller/config_controller.dart';
import 'package:adb_tool/themes/app_colors.dart';
import 'package:flutter/cupertino.dart' show CupertinoThemeData;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_repository/global_repository.dart';

import 'lib_color_schemes.g.dart';

class DefaultThemeData {
  DefaultThemeData._();
  static const Color _primary = AppColors.accent;

  static ThemeData dark() {
    final darkThemeData = ThemeData.dark();
    // ThemeData
    return darkThemeData.copyWith(
      colorScheme: darkColorScheme,
      primaryColor: darkColorScheme.onPrimary,
      scaffoldBackgroundColor: darkColorScheme.background,
      cupertinoOverrideTheme: const CupertinoThemeData(
        brightness: Brightness.dark,
      ),
      primaryIconTheme: darkThemeData.iconTheme.copyWith(
        color: darkColorScheme.onSurface,
      ),
      iconTheme: darkThemeData.iconTheme.copyWith(
        color: darkColorScheme.onSurface,
      ),
      appBarTheme: darkThemeData.appBarTheme.copyWith(
        centerTitle: true,
        color: darkColorScheme.surface,
        elevation: 0,
        iconTheme: darkThemeData.iconTheme.copyWith(
          color: const Color(0xFFA8A8A8),
        ),
        actionsIconTheme: darkThemeData.iconTheme.copyWith(
          color: const Color(0xFF8C8C8C),
        ),
        toolbarTextStyle: darkThemeData.textTheme.headline6.copyWith(
          fontSize: Dimens.font_sp20,
          fontWeight: FontWeight.w500,
          color: const Color(0xFFA8A8A8),
        ),
      ),
      tabBarTheme: darkThemeData.tabBarTheme.copyWith(
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(
            width: Dimens.gap_dp2,
            color: darkColorScheme.onPrimary,
          ),
        ),
        indicatorSize: TabBarIndicatorSize.label,
        labelColor: darkColorScheme.onPrimary,
        labelStyle: TextStyle(
          fontSize: Dimens.font_sp16,
        ),
        labelPadding:
            EdgeInsets.only(top: Dimens.gap_dp8, bottom: Dimens.gap_dp10),
        unselectedLabelColor: darkColorScheme.onSurface,
        unselectedLabelStyle: TextStyle(
          fontSize: Dimens.font_sp16,
        ),
      ),
      unselectedWidgetColor: const Color(0xFF696969),
      toggleableActiveColor: _primary,
      dividerColor: darkColorScheme.outline,
      dividerTheme: DividerThemeData(
        color: darkColorScheme.outline,
        space: Dimens.gap_dp1,
      ),
      popupMenuTheme: PopupMenuThemeData(
        color: darkColorScheme.surface,
      ),
      textTheme: darkThemeData.textTheme.copyWith(
        headline5: darkThemeData.textTheme.headline5.copyWith(
          fontSize: Dimens.font_sp24,
          fontWeight: FontWeight.w600,
          color: const Color(0xFFE7E7E7),
        ),
        headline6: darkThemeData.textTheme.headline6.copyWith(
          fontSize: Dimens.font_sp20,
          fontWeight: FontWeight.w500,
          color: const Color(0xFFE7E7E7),
        ),
        subtitle1: darkThemeData.textTheme.subtitle1.copyWith(
          fontSize: Dimens.font_sp16,
          fontWeight: FontWeight.w500,
          color: const Color(0xFFE7E7E7),
        ),
        subtitle2: darkThemeData.textTheme.subtitle2.copyWith(
          fontSize: Dimens.font_sp16,
          fontWeight: FontWeight.w400,
          color: const Color(0xFFE7E7E7),
        ),
        bodyText1: darkThemeData.textTheme.bodyText1.copyWith(
          fontSize: Dimens.font_sp16,
          fontWeight: FontWeight.w400,
          color: const Color(0xFFE7E7E7),
        ),
        bodyText2: darkThemeData.textTheme.bodyText1.copyWith(
          fontSize: Dimens.font_sp14,
          fontWeight: FontWeight.w400,
          color: const Color(0xFFE7E7E7),
        ),
        button: darkThemeData.textTheme.button.copyWith(
          fontSize: Dimens.font_sp16,
          fontWeight: FontWeight.w400,
          color: const Color(0xFFFFFFFF),
        ),
        caption: darkThemeData.textTheme.caption.copyWith(
          fontSize: Dimens.font_sp12,
          fontWeight: FontWeight.w400,
          color: const Color(0xFF8C8C8C),
        ),
      ),
    );
  }

  static ThemeData light({
    Color primary,
  }) {
    ConfigController controller = Get.find();
    final lightThemeData = ThemeData.light();
    ColorScheme colorScheme = lightColorScheme;
    return lightThemeData.copyWith(
      primaryColor: colorScheme.primary,
      colorScheme: colorScheme,
      // Desktop有高斯模糊背景
      scaffoldBackgroundColor: Colors.transparent,
      cupertinoOverrideTheme: const CupertinoThemeData(
        brightness: Brightness.light,
      ),
      primaryIconTheme: lightThemeData.primaryIconTheme.copyWith(
        color: colorScheme.onSurface,
      ),
      iconTheme: lightThemeData.iconTheme.copyWith(
        color: colorScheme.onSurface,
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: colorScheme.primary.withOpacity(0.08),
        isDense: true,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: 12.w,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.w),
          gapPadding: 0,
          borderSide: const BorderSide(
            width: 0,
            color: Colors.transparent,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.w),
          gapPadding: 0,
          borderSide: const BorderSide(
            width: 0,
            color: Colors.transparent,
          ),
        ),
        filled: true,
      ),
      appBarTheme: lightThemeData.appBarTheme.copyWith(
        systemOverlayStyle:
            controller.isDarkTheme ? OverlayStyle.light : OverlayStyle.dark,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: lightThemeData.iconTheme.copyWith(
          color: const Color(0xFF595959),
        ),
        actionsIconTheme: lightThemeData.iconTheme.copyWith(
          color: colorScheme.primary,
        ),
        titleTextStyle: lightThemeData.textTheme.headline6.copyWith(
          fontSize: 18.w,
          fontWeight: FontWeight.bold,
          color: controller.theme.fontColor,
        ),
      ),
      tabBarTheme: lightThemeData.tabBarTheme.copyWith(
        indicator: UnderlineTabIndicator(
          borderSide:
              BorderSide(width: Dimens.gap_dp2, color: colorScheme.primary),
        ),
        indicatorSize: TabBarIndicatorSize.label,
        labelColor: colorScheme.primary,
        labelStyle: TextStyle(
          fontSize: Dimens.font_sp16,
        ),
        labelPadding:
            EdgeInsets.only(top: Dimens.gap_dp8, bottom: Dimens.gap_dp10),
        unselectedLabelColor: colorScheme.onSurface,
        unselectedLabelStyle: TextStyle(
          fontSize: Dimens.font_sp16,
        ),
      ),
      backgroundColor: colorScheme.background,
      unselectedWidgetColor: const Color(0xFFBFBFBF),
      toggleableActiveColor: colorScheme.primary,
      dividerColor: colorScheme.outline,
      dividerTheme: DividerThemeData(
        color: colorScheme.outline,
        space: Dimens.gap_dp1,
      ),
      cardColor: controller.theme.cardColor,
      popupMenuTheme: PopupMenuThemeData(
        color: colorScheme.surface,
      ),
      textTheme: lightThemeData.textTheme.copyWith(
        bodyText2: lightThemeData.textTheme.bodyText2.copyWith(
          fontSize: Dimens.font_sp14,
          fontWeight: FontWeight.w500,
          color: controller.theme.fontColor,
        ),
      ),
    );
  }
}
