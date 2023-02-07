import 'package:deprem_destek/theme/color/yaf_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class YafReactiveTextField extends StatefulWidget {
  const YafReactiveTextField({
    super.key,
    required this.hintText,
    required this.onChange,
    this.updateTextField,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.fieldKey,
    this.inputFormatters,
    this.hasEditIcon = true,
    this.noSelectedBorder = const Color(0x4700C2E7),
    this.hasError = false,
    this.padding,
    this.enable = true,
    this.validatorUpdate,
    this.focus,
    this.nextFocus,
    this.textCapitalization = TextCapitalization.none,
    this.fillColor,
    this.textAlignVertical = TextAlignVertical.bottom,
    this.enableInteractiveSelection = true,
    this.minLines,
    this.borderRadius,
    this.alignment,
    this.validator,
    this.textEditingController,
    this.isAssignController = true,
    this.suffixIcon,
    this.autofillHints,
    this.readOnly = false,
    this.onTap,
    this.onCloseTap,
    this.isBirthDate = false,
    this.helperText,
    this.prefixIcon,
  });

  final bool readOnly;
  final String hintText;
  final void Function(String) onChange;
  final void Function()? onCloseTap;
  final void Function(TextEditingController)? updateTextField;
  final TextInputType keyboardType;
  final bool isPassword;
  final Key? fieldKey;
  final bool hasEditIcon;
  final Color noSelectedBorder;
  final bool hasError;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsets? padding;
  final bool enable;
  final bool Function(String)? validatorUpdate;
  final FocusNode? focus;
  final FocusNode? nextFocus;
  final TextCapitalization textCapitalization;
  final Color? fillColor;
  final TextAlignVertical textAlignVertical;
  final bool enableInteractiveSelection;
  final int? minLines;
  final double? borderRadius;
  final AlignmentGeometry? alignment;
  final String? Function(String?)? validator;
  final TextEditingController? textEditingController;
  final bool isAssignController;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final List<String>? autofillHints;
  final void Function()? onTap;
  final bool isBirthDate;
  final String? helperText;

  @override
  State<YafReactiveTextField> createState() => Yaf_ReactiveTextFieldState();
}

class Yaf_ReactiveTextFieldState extends State<YafReactiveTextField> {
  bool obscureText = false;
  late TextEditingController textEditingController;
  var _previousText = '';
  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    obscureText = widget.isPassword;
    textEditingController =
        widget.textEditingController ?? TextEditingController();
    focusNode = widget.focus ?? FocusNode();
    focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final hasErrorBorder = BoxDecoration(
      borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
      border: Border.all(
        color: focusNode.hasFocus ? YafColor.black : YafColor.red,
      ),
    );
    final enableBorder = BoxDecoration(
      borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
      color: YafColor.grey900,
      border: Border.all(
        color: focusNode.hasFocus
            ? const Color(0xffDBF7F7)
            : widget.isBirthDate
                ? widget.noSelectedBorder
                : widget.readOnly
                    ? const Color.fromRGBO(227, 230, 234, 1)
                    : !widget.hasError
                        ? YafColor.grey300
                        : YafColor.red,
        width: 2,
      ),
    );
    final disableBorder = BoxDecoration(
      borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
      border: Border.all(
        color: widget.readOnly
            ? YafColor.grey300
            : focusNode.hasFocus
                ? YafColor.black
                : !widget.hasError
                    ? YafColor.grey300
                    : YafColor.red,
      ),
    );

    return Column(
      children: [
        DecoratedBox(
          decoration: widget.hasError
              ? hasErrorBorder
              : widget.enable
                  ? enableBorder
                  : disableBorder,
          child: TextFormField(
            readOnly: widget.readOnly,
            autofillHints: widget.autofillHints,
            style: TextStyle(
              color: widget.enable ? YafColor.grey900 : YafColor.grey300,
            ),
            key: widget.fieldKey,
            focusNode: focusNode,
            enableInteractiveSelection: widget.enableInteractiveSelection,
            enabled: widget.enable,
            onTap: widget.onTap,
            keyboardType: widget.keyboardType,
            controller: textEditingController,
            obscureText: obscureText,
            inputFormatters: widget.inputFormatters,
            textCapitalization: widget.textCapitalization,
            textAlignVertical: widget.textAlignVertical,
            textInputAction: widget.nextFocus != null
                ? TextInputAction.next
                : TextInputAction.done,
            onFieldSubmitted: widget.nextFocus != null
                ? (_) => widget.nextFocus!.requestFocus()
                : null,
            cursorHeight: 16,
            cursorColor: YafColor.black,
            minLines: widget.minLines,
            maxLines: widget.minLines != null ? 7 : 1,
            decoration: InputDecoration(
              suffix: widget.suffixIcon,
              fillColor: YafColor.black,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              filled: widget.hasError || widget.fillColor != null,
              errorStyle: const TextStyle(fontSize: 0),
              labelText: widget.hintText,
              focusColor: YafColor.black,
              labelStyle: TextStyle(
                color: widget.enable ? YafColor.grey900 : YafColor.grey300,
              ),
              isDense: true,
              suffixIconConstraints: const BoxConstraints(
                maxWidth: 50,
                minWidth: 50,
                maxHeight: 56,
                minHeight: 56,
              ),
              contentPadding: const EdgeInsets.only(
                left: 10,
                top: 14,
                right: 10,
                bottom: 14,
              ),
              prefixIcon: widget.enable ? widget : const Icon(Icons.abc),
              prefixIconConstraints: const BoxConstraints(
                maxWidth: 50,
                minWidth: 50,
                maxHeight: 56,
                minHeight: 56,
              ),
              suffixIcon: textEditingController.text.isNotEmpty && widget.enable
                  ? IconButton(
                      onPressed: widget.onCloseTap,
                      icon: const Icon(Icons.close),
                    )
                  : Container(
                      alignment: widget.alignment ?? Alignment.center,
                      padding: const EdgeInsets.only(right: 20),
                      child: widget.suffixIcon,
                    ),
            ),
            onChanged: (value) {
              if (widget.validatorUpdate != null) {
                if (widget.validatorUpdate!(value)) {
                  widget.onChange(value);
                  _previousText = value;
                } else {
                  textEditingController
                    ..text = _previousText
                    ..selection = TextSelection.fromPosition(
                      TextPosition(offset: textEditingController.text.length),
                    );
                }
              } else {
                widget.onChange(value);
                _previousText = value;
              }
              setState(() {});
            },
            validator: widget.validator,
          ),
        ),
        if (widget.helperText?.isNotEmpty ?? false) ...[
          const SizedBox(height: 8),
          Row(
            children: [
              if (widget.hasError)
                const Icon(Icons.warning)
              else
                const Icon(
                  Icons.info_outline,
                  size: 16,
                ),
              const SizedBox(
                width: 4,
              ),
              Expanded(
                child: Text(
                  widget.helperText ?? '',
                  style: TextStyle(
                    color: widget.hasError ? YafColor.red : null,
                  ),
                ),
              ),
            ],
          )
        ]
      ],
    );
  }
}
