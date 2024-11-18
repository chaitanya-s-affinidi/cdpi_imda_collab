import 'package:flutter/material.dart';

class AFMultiLineTextFormFieldWrapperWidget extends StatefulWidget {
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final String? value;
  final AutovalidateMode? autovalidateMode;
  final int? maxLines;
  final Widget? suffixIcon;
  final String? labelText;
  final String? hintText;
  final String? prefixText;
  final String? errString;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChanged;
  final String? Function(String?)? onSaved;
  final FocusNode? focusNode;
  const AFMultiLineTextFormFieldWrapperWidget({
    Key? key,
    this.textInputAction,
    this.keyboardType,
    this.value,
    this.autovalidateMode,
    this.focusNode,
    this.suffixIcon,
    this.labelText,
    this.prefixText,
    this.maxLines,
    this.hintText,
    this.errString,
    this.validator,
    this.onChanged,
    this.onSaved,
  }) : super(key: key);

  @override
  State<AFMultiLineTextFormFieldWrapperWidget> createState() =>
      _AFMultiLineTextFormFieldWrapperWidgetState();
}

class _AFMultiLineTextFormFieldWrapperWidgetState
    extends State<AFMultiLineTextFormFieldWrapperWidget> {
  bool _pageInitialized = false;
  final TextEditingController _textEditingController =
      new TextEditingController();

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
  void didUpdateWidget(
      covariant AFMultiLineTextFormFieldWrapperWidget oldWidget) {
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
      //   constraints: BoxConstraints.tight(
      // Size.fromHeight((60.0 * (widget.maxLines ?? 1)))),
      height: (50.0 + (30.0 * ((widget.maxLines ?? 1) - 1))),
      padding: const EdgeInsets.symmetric(
        horizontal: 6,
        vertical: 3,
      ),
      child: TextFormField(
        focusNode: widget.focusNode,
        controller: _textEditingController,
        textInputAction: widget.textInputAction,
        keyboardType: TextInputType.multiline,
        minLines: null,
        maxLines: null,
        // value: widget.value ?? "",
        autovalidateMode: widget.autovalidateMode,
        expands: true,
        textAlignVertical: TextAlignVertical.top,
        decoration: InputDecoration(
          isDense: true,
          filled: true,
          fillColor: Theme.of(context).colorScheme.onInverseSurface,
          alignLabelWithHint: true,
          prefixText: widget.prefixText,
          labelText: widget.labelText,
          hintText: widget.hintText,
          suffixIcon: widget.suffixIcon ??
              (_textEditingController.text.isNotEmpty
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
                    )),
          focusedBorder: OutlineInputBorder(
            // borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              width: 1.0,
              color: Theme.of(context).colorScheme.outline,
            ),
          ),
          border: OutlineInputBorder(
            // borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              width: 0,
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
          enabledBorder: InputBorder.none,
          contentPadding: const EdgeInsets.only(
            left: 10,
            top: 10,
            bottom: 0,
            right: 6,
          ),
        ),
        validator: widget.validator,
        onSaved: widget.onSaved,
        onChanged: widget.onChanged,
      ),
    );
  }
}
