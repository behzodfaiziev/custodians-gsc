import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  Color get randomColor => Colors.primaries[Random().nextInt(17)];

  Container get randomColorContainer =>
      Container(height: 20, width: double.infinity, color: randomColor);
}

extension NavigationExtension on BuildContext {
  NavigatorState get navigator => Navigator.of(this);

  Future<void> pop() async {
    return navigator.pop();
  }

  bool canPop() {
    return navigator.canPop();
  }

  Future<Object?> push(Widget view) async {
    return navigator.push(MaterialPageRoute(builder: (ctx) => view));
  }

  Future<Object?> pushReplaceAll(Widget view) async {
    return navigator.pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) => view), (route) => false);
  }
}

extension MediQueryExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  double get height => mediaQuery.size.height;

  double get width => mediaQuery.size.width;

  double get lowValueHeight => height * 0.01;

  double get normalValueHeight => height * 0.02;

  double get mediumValueHeight => height * 0.04;

  double get highValueHeight => height * 0.1;

  double get lowValueWidth => width * 0.01;

  double get normalValueWidth => width * 0.02;

  double get mediumValueWidth => width * 0.06;

  double get highValueWidth => width * 0.1;

  double get highestValueWidth => width * 0.18;

  double get safeHeight =>
      height -
      MediaQuery.paddingOf(this).bottom -
      MediaQuery.paddingOf(this).top;

  double dynamicWidth(double val) => width * val;

  double dynamicHeight(double val) => height * val;
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  TextTheme get primaryTextTheme => theme.primaryTextTheme;

  ColorScheme get colorScheme => theme.colorScheme;
}

extension PaddingExtension on BuildContext {
  EdgeInsets get paddingLow => EdgeInsets.all(lowValueHeight);

  EdgeInsets get paddingNormal => EdgeInsets.all(normalValueHeight);

  EdgeInsets get paddingMedium => EdgeInsets.all(mediumValueHeight);

  EdgeInsets get paddingHigh => EdgeInsets.all(highValueHeight);

  EdgeInsets get mainHorizontalPadding =>
      EdgeInsets.symmetric(horizontal: width * 0.064);

  EdgeInsets get mainHorizontalPadding2 =>
      EdgeInsets.symmetric(horizontal: width * 0.054);

  EdgeInsets get mediumHorizontalPadding =>
      EdgeInsets.symmetric(horizontal: width * 0.042);

  EdgeInsets get mainHorizontalPaddingLeft =>
      EdgeInsets.only(left: width * 0.064);

  EdgeInsets get mainHorizontalPaddingLeft2 =>
      EdgeInsets.only(left: width * 0.054);

  EdgeInsets get mainHorizontalPaddingRight =>
      EdgeInsets.only(right: width * 0.064);

  EdgeInsets get mainHorizontalPaddingRight2 =>
      EdgeInsets.only(right: width * 0.054);

  EdgeInsets get horizontalPaddingLow =>
      EdgeInsets.symmetric(horizontal: lowValueWidth);

  EdgeInsets get horizontalPaddingNormal =>
      EdgeInsets.symmetric(horizontal: normalValueWidth);

  EdgeInsets get horizontalPaddingMedium =>
      EdgeInsets.symmetric(horizontal: mediumValueWidth);

  EdgeInsets get horizontalPaddingHigh =>
      EdgeInsets.symmetric(horizontal: highValueWidth);

  EdgeInsets get horizontalPaddingHighest =>
      EdgeInsets.symmetric(horizontal: highestValueWidth);

  EdgeInsets get verticalPaddingLow =>
      EdgeInsets.symmetric(vertical: lowValueHeight);

  EdgeInsets get verticalPaddingNormal =>
      EdgeInsets.symmetric(vertical: normalValueHeight);

  EdgeInsets get verticalPaddingMedium =>
      EdgeInsets.symmetric(vertical: mediumValueHeight);

  EdgeInsets get verticalPaddingHigh =>
      EdgeInsets.symmetric(vertical: highValueHeight);

  EdgeInsets get onlyLeftPaddingLow => EdgeInsets.only(left: lowValueHeight);

  EdgeInsets get onlyLeftPaddingNormal =>
      EdgeInsets.only(left: normalValueHeight);

  EdgeInsets get onlyLeftPaddingMedium =>
      EdgeInsets.only(left: mediumValueHeight);

  EdgeInsets get onlyLeftPaddingHigh => EdgeInsets.only(left: highValueHeight);

  EdgeInsets get onlyRightPaddingLow => EdgeInsets.only(right: lowValueHeight);

  EdgeInsets get onlyRightPaddingNormal =>
      EdgeInsets.only(right: normalValueHeight);

  EdgeInsets get onlyRightPaddingMedium =>
      EdgeInsets.only(right: mediumValueHeight);

  EdgeInsets get onlyRightPaddingHigh =>
      EdgeInsets.only(right: highValueHeight);

  EdgeInsets get onlyBottomPaddingLow =>
      EdgeInsets.only(bottom: lowValueHeight);

  EdgeInsets get onlyBottomPaddingNormal =>
      EdgeInsets.only(bottom: normalValueHeight);

  EdgeInsets get onlyBottomPaddingMedium =>
      EdgeInsets.only(bottom: mediumValueHeight);

  EdgeInsets get onlyBottomPaddingHigh =>
      EdgeInsets.only(bottom: highValueHeight);

  EdgeInsets get onlyTopPaddingLow => EdgeInsets.only(top: lowValueHeight);

  EdgeInsets get onlyTopPaddingNormal =>
      EdgeInsets.only(top: normalValueHeight);

  EdgeInsets get onlyTopPaddingMedium =>
      EdgeInsets.only(top: mediumValueHeight);

  EdgeInsets get onlyTopPaddingHigh => EdgeInsets.only(top: highValueHeight);
}