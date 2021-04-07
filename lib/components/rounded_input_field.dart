import 'package:flutter/material.dart';
import 'package:golden_bite/components/text_field_container.dart';
import 'package:golden_bite/constants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final double size;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key key,
    this.hintText,
    this.onChanged,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      size: size,
      child: TextField(
        keyboardType: TextInputType.multiline,
        maxLines: null,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration:
            InputDecoration(hintText: hintText, border: InputBorder.none),
      ),
    );
  }
}
