import 'package:flutter/material.dart';

class DecoratedTextWidget extends StatelessWidget {
  final String? content;
  final bool? uppercase;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final double? fontSize;
  final bool? overflowEllipsisFlag;
  final bool? bold;
  final bool? eczar;
  final bool? underline;
  final bool? pill;
  final bool? rubberstamp;
  final double? height;
  final double? letterSpacing;
  final double? borderRadius;
  final double? padding;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final int? maxLines;
  final double? wordSpacing;
  final TextStyle? materialTextStyle;
  const DecoratedTextWidget({
    super.key,
    required this.content,
    this.uppercase,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
    this.bold,
    this.underline,
    this.pill,
    this.fontSize,
    this.rubberstamp,
    this.height,
    this.letterSpacing,
    this.borderRadius,
    this.padding,
    this.textAlign,
    this.overflowEllipsisFlag,
    this.maxLines,
    this.wordSpacing,
    this.fontWeight,
    this.eczar,
    this.materialTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = TextStyle(
      color: (textColor == null)
          ? ((backgroundColor == null) ? Colors.black : Colors.white)
          : textColor,
      fontSize: ((pill != null) && pill!) ? 12 : fontSize,
      // ((fontSize == null) && (bold == null) && (rubberstamp == null))
      //     ? 14.0
      //     : fontSize,
      fontFamily: ((eczar != null) && eczar!)
          ? (((bold != null) && bold!) ? "Eczar Bold" : "Eczar Regular")
          : ((rubberstamp != null) && rubberstamp!)
              // ? "rubberstamp"
              ? "DM Sans Bold"
              : ((((bold != null) && bold!) || ((pill != null) && pill!))
                  ? "DM Sans Bold"
                  : "DM Sans Medium"),
      height: height,
      letterSpacing: letterSpacing,
      decoration: ((underline != null) && underline!)
          ? TextDecoration.underline
          : TextDecoration.none,
      wordSpacing: wordSpacing,
      fontWeight: fontWeight,
    );
    if (materialTextStyle != null) {
      textStyle = materialTextStyle!.merge(textStyle);
    }
    return Container(
      padding: ((pill != null) && pill!)
          ? const EdgeInsets.symmetric(horizontal: 8, vertical: 4)
          : EdgeInsets.all(padding ?? 5.0),
      decoration: BoxDecoration(
        color: (backgroundColor != null) ? backgroundColor : null,
        border: (borderColor != null) ? Border.all(color: borderColor!) : null,
        borderRadius: BorderRadius.all(Radius.circular(
            borderRadius ?? (((pill != null) && pill!) ? 20.0 : 5.0))),
      ),
      child: RichText(
        textAlign: textAlign ?? TextAlign.left,
        maxLines: maxLines,
        overflow: ((overflowEllipsisFlag != null) && overflowEllipsisFlag!)
            ? TextOverflow.ellipsis
            : TextOverflow.visible,
        text: TextSpan(
          style: textStyle,
          text: ((uppercase != null) && uppercase!)
              ? content!.toUpperCase()
              : content,
        ),
      ),
    );
  }
}
