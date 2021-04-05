import 'package:flutter/material.dart';
import 'package:golden_bite/components/text_field_container.dart';
import 'package:golden_bite/constants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key key,
    this.hintText,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration:
            InputDecoration(hintText: hintText, border: InputBorder.none),
      ),
    );
  }
}
