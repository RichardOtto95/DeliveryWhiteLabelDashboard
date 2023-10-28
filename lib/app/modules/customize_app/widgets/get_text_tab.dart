import 'package:flutter/material.dart';

import '../../../shared/utilities.dart';

class GetTextTab extends StatelessWidget {
  final String label;
  final String? hint;
  final TextStyle? style;
  final Color? color;
  final Color? onColor;
  final void Function(String)? onChanged;
  const GetTextTab({
    Key? key,
    this.style,
    this.hint,
    required this.label,
    this.onChanged,
    this.color,
    this.onColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = style ??
        Theme.of(context).textTheme.labelLarge ??
        const TextStyle(
          fontSize: 20,
        );
    return Container(
      width: maxWidth(context),
      padding: EdgeInsets.symmetric(horizontal: wv(25, context)),
      decoration: BoxDecoration(
          color: color ?? getColor(context).background,
          border: Border(
              bottom: BorderSide(
                  color: onColor ?? getColor(context).onBackground))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: textStyle),
          Container(
            width: pw(60, context),
            height: wv(60, context),
            alignment: Alignment.center,
            child: TextFormField(
              onChanged: onChanged,
              decoration: InputDecoration.collapsed(hintText: hint),
            ),
          )
        ],
      ),
    );
  }
}
