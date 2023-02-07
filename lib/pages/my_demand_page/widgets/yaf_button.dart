import 'package:deprem_destek/theme/color/yaf_color.dart';
import 'package:deprem_destek/theme/text_style/font/dls_text_style.dart';
import 'package:flutter/material.dart';

class YafButton extends StatelessWidget {
  const YafButton({super.key, required this.onTap, required this.title});
  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap.call,
      child: SizedBox(
        height: 44,
        width: 320,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: YafColor.red,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            title,
            style: context.appTextTheme.hero!.copyWith(
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
