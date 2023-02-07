//
// Copyright (c) 2021 OXOS Medical, Inc. All rights reserved.
//
import 'package:deprem_destek/theme/color/yaf_color.dart';
import 'package:deprem_destek/theme/constants/theme_constants.dart';
import 'package:flutter/material.dart';

extension AppTextThemeEx on BuildContext {
  DLSTextStyle get appTextTheme => DLSTextStyle(this);
}

extension TextStyleX on TextStyle {
  TextStyle textStyleInterceptor() => copyWith(
        fontFamily: YafConstants.fontFamily,
        color: YafColor.grey500,
        package: YafConstants.dlsPackageName,
      );
}

class DLSTextStyle {
  DLSTextStyle(this.context);

  final BuildContext context;

  TextTheme get _textTheme => Theme.of(context).textTheme;

  TextStyle? get hero => _textTheme.displayLarge
      ?.copyWith(
        fontSize: 32,
        fontWeight: FontWeight.w600,
        height: 1.3,
      )
      .textStyleInterceptor();

  TextStyle? get h1 => _textTheme.displayLarge
      ?.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        height: 1.2,
      )
      .textStyleInterceptor();

  TextStyle? get h3 => _textTheme.displaySmall
      ?.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        height: 2.4,
      )
      .textStyleInterceptor();

  TextStyle? get bodyText => _textTheme.bodyLarge
      ?.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.7,
        color: YafColor.grey400,
      )
      .textStyleInterceptor();

  TextStyle? get bodyS => _textTheme.bodySmall
      ?.copyWith(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        height: 1.6,
        color: YafColor.grey400,
      )
      .textStyleInterceptor();

  TextStyle? get body => _textTheme.bodyMedium
      ?.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.w300,
        height: 1.8,
      )
      .textStyleInterceptor();

  TextStyle? get bodyL => _textTheme.bodyLarge
      ?.copyWith(
        fontSize: 17,
        fontWeight: FontWeight.w400,
        height: 1.7,
        color: YafColor.grey500,
      )
      .textStyleInterceptor();

  TextStyle? get title => _textTheme.titleMedium
      ?.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1,
        color: YafColor.grey500,
      )
      .textStyleInterceptor();
}
