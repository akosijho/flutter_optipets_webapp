import 'package:flutter/material.dart';

const thisLabelStyle = TextStyle(fontSize: 12,
overflow: TextOverflow.clip);

Widget fieldLabel({required String label, double fieldWidth = 104}) {
  return Container(
      width: fieldWidth,
      padding: const EdgeInsets.only(top: 4),
      child: Text(label, style: thisLabelStyle));
}

TextFormField textField(
    {String? label,
    bool? enabled,
    int? lines = 1,
    TextEditingController? textEditingController,
    double maxWidth = 384,
    dynamic function,
    bool expands = false}) {
  return TextFormField(
    controller: textEditingController,
    enabled: enabled,
    maxLines: lines,
    style: thisLabelStyle,
    expands: expands,
    decoration: InputDecoration(
      border: const OutlineInputBorder(),
      isDense: true,
      // isCollapsed: true,
      hintText: label,
      constraints: BoxConstraints(maxWidth: maxWidth),
      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      errorStyle: const TextStyle(
        fontSize: 10,
      ),
    ),
    validator: (val) => val!.isEmpty ? 'Do not leave this empty' : null,
    onTap: function,
  );
}
