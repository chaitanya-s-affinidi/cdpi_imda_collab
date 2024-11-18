import 'package:flutter/material.dart';
import './decorated-text.widget.dart';

class AFTextFormFieldWrapperWidget extends StatefulWidget {
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final EdgeInsets? padding;
  final bool? hideClearIcon;
  final String? value;
  final Color? cursorColor;
  final AutovalidateMode? autovalidateMode;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final Widget? suffixIcon;
  final String? labelText;
  final String? hintText;
  final String? prefixText;
  final String? suffixText;
  final TextStyle? suffixStyle;
  final String? errString;
  final bool? showCursor;
  final bool? readOnly;

  final String? Function(String?)? onChanged;
  final String? Function(String?)? onSaved;
  final Function()? onTap;
  final FocusNode? focusNode;
  const AFTextFormFieldWrapperWidget({
    Key? key,
    this.textInputAction,
    this.keyboardType,
    this.value,
    this.autovalidateMode,
    this.padding,
    this.hideClearIcon,
    this.focusNode,
    this.obscureText,
    this.suffixIcon,
    this.suffixText,
    this.suffixStyle,
    this.labelText,
    this.prefixText,
    this.hintText,
    this.errString,
    this.validator,
    this.onChanged,
    this.onSaved,
    this.cursorColor,
    this.onTap,
    this.showCursor,
    this.readOnly,
  }) : super(key: key);

  @override
  State<AFTextFormFieldWrapperWidget> createState() =>
      _AFTextFormFieldWrapperWidgetState();
}

class _AFTextFormFieldWrapperWidgetState
    extends State<AFTextFormFieldWrapperWidget> {
  bool _pageInitialized = false;
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void didChangeDependencies() {
    if (!_pageInitialized) {
      _textEditingController.addListener(() {
        setState(() {
          if (widget.onChanged != null) {
            widget.onChanged!(_textEditingController.text);
          }
        });
      });
      _textEditingController.text = widget.value ?? "";
      _pageInitialized = true;
    }
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant AFTextFormFieldWrapperWidget oldWidget) {
    if ((widget.value ?? "") != (oldWidget.value ?? "")) {
      _textEditingController.text = widget.value ?? "";
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding ??
          const EdgeInsets.symmetric(
            horizontal: 6,
            vertical: 6,
          ),
      child: TextFormField(
        focusNode: widget.focusNode,
        controller: _textEditingController,
        cursorColor: widget.cursorColor,
        textInputAction: widget.textInputAction,
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText ?? false,
        autovalidateMode: widget.autovalidateMode,
        showCursor: widget.showCursor,
        readOnly: widget.readOnly ?? false,
        decoration: InputDecoration(
          isDense: true,
          filled: true,
          fillColor: Theme.of(context).colorScheme.onInverseSurface,
          border: OutlineInputBorder(
            // borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              width: 0,
              color: Theme.of(context).colorScheme.outline,
            ),
          ),
          enabledBorder: InputBorder.none,
          prefixText: widget.prefixText,
          suffixIcon: (!(widget.hideClearIcon ?? false)
              ? (widget.suffixIcon != null)
                  ? widget.suffixIcon
                  : ((widget.suffixText == null)
                      ? (_textEditingController.text.isNotEmpty
                          ? GestureDetector(
                              child: const Icon(
                                Icons.clear_outlined,
                                size: 15,
                                color: Colors.black26,
                              ),
                              onTap: () {
                                _textEditingController.text = "";
                              },
                            )
                          : Container(
                              height: 15,
                              width: 15,
                            ))
                      : null)
              : null),
          suffixText: widget.suffixText,
          suffixStyle: widget.suffixStyle,
          // suffix: (widget.suffixText != null)
          //     ? Container(
          //         height: 50,
          //         alignment: Alignment.center,
          //         child: Text(
          //           widget.suffixText ?? "",
          //           style: widget.suffixStyle,
          //         ),
          //       )
          //     : null,
          focusedBorder: OutlineInputBorder(
            // borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              width: 1.0,
              color: Theme.of(context).colorScheme.outline,
            ),
          ),
          errorBorder: OutlineInputBorder(
            // borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              width: 0,
              color: Theme.of(context).colorScheme.error,
            ),
          ),
          contentPadding:
              ((widget.hideClearIcon ?? false) || (widget.suffixText != null))
                  ? const EdgeInsets.only(
                      top: 12.0,
                      left: 10,
                      right: 6,
                      bottom: 12.0,
                    )
                  : const EdgeInsets.only(
                      left: 12,
                      top: 0,
                      bottom: 0,
                      right: 6,
                    ),
          labelText: widget.labelText,
          hintText: widget.hintText,
        ),
        validator: widget.validator,
        onSaved: widget.onSaved,
        onTap: widget.onTap,
      ),
    );
  }
}
