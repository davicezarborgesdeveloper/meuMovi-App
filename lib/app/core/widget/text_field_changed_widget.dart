import 'package:flutter/material.dart';

import '../ui/styles/text_styles.dart';

class TextFieldChangedWidget extends StatefulWidget {
  final String label;
  final String? hintText;
  final String? errorText;
  final bool readOnly;
  final String? initialValue;
  final GestureTapCallback? onTap;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  const TextFieldChangedWidget({
    Key? key,
    required this.label,
    this.readOnly = false,
    this.initialValue,
    this.controller,
    this.onChanged,
    this.hintText,
    this.errorText,
    this.onTap,
  }) : super(key: key);

  @override
  State<TextFieldChangedWidget> createState() => _TextFieldChangedWidgetState();
}

class _TextFieldChangedWidgetState extends State<TextFieldChangedWidget> {
  @override
  void initState() {
    if (widget.controller != null) {
      widget.controller!.text = widget.initialValue ?? '';
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: context.textStyles.textBold,
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: widget.controller,
            readOnly: widget.readOnly,
            onChanged: widget.onChanged,
            decoration: InputDecoration(
              fillColor: widget.readOnly ? Colors.grey[200] : Colors.white,
              errorText: widget.errorText,
              hintText: widget.hintText,
            ),
            onTap: widget.onTap,
          )
        ],
      ),
    );
  }
}
