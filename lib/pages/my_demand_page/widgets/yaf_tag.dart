import 'package:deprem_destek/theme/color/yaf_color.dart';
import 'package:deprem_destek/theme/text_style/font/dls_text_style.dart';
import 'package:flutter/material.dart';

class YafTags extends StatelessWidget {
  const YafTags({super.key, required this.onClose, required this.title});
  final VoidCallback onClose;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: YafColor.grey300,
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(6, 6, 6, 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: context.appTextTheme.bodyText?.copyWith(
                  color: YafColor.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              GestureDetector(
                onTap: onClose.call,
                child: Icon(
                  Icons.close,
                  color: YafColor.grey400,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
