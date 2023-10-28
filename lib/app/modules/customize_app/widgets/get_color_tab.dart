import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/utilities.dart';

class GetColorTab extends StatelessWidget {
  final Color color;
  final Color onColor;
  final String label;
  final String onLabel;
  final void Function(Color) pickColor;
  final void Function(Color) pickOnColor;

  const GetColorTab({
    Key? key,
    required this.color,
    required this.onColor,
    required this.label,
    required this.onLabel,
    required this.pickColor,
    required this.pickOnColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(
      fontSize: 20,
      color: onColor,
    );
    return Container(
      width: maxWidth(context),
      height: wv(60, context),
      decoration: BoxDecoration(
        color: color,
        border: Border(bottom: BorderSide(color: onColor)),
      ),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () => pickColorPopup(context, pickColor, color),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: wv(12, context)),
                width: maxWidth(context) / 2,
                height: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  label,
                  style: textStyle,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () => pickColorPopup(context, pickOnColor, onColor),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: wv(12, context)),
                height: double.infinity,
                width: maxWidth(context) / 2,
                alignment: Alignment.center,
                child: Text(
                  onLabel,
                  style: textStyle,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
