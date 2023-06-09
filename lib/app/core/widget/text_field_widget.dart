import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../ui/styles/text_styles.dart';

class TextFieldWidget extends StatefulWidget {
  final String? label;
  final String hintText;
  final String? errorText;
  final ValueChanged<String>? onChanged;
  final Function? onChangedAnother;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final bool obscure;
  final String? initialValue;
  final TextEditingController? controller;
  const TextFieldWidget({
    Key? key,
    this.label,
    required this.hintText,
    this.errorText,
    this.onChanged,
    this.onChangedAnother,
    this.inputFormatters,
    this.keyboardType,
    this.obscure = false,
    this.initialValue,
    this.controller,
  }) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool isVisible = false;

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
          if (widget.label != null)
            Text(
              widget.label!,
              style: context.textStyles.textBold,
            ),
          if (widget.label != null) const SizedBox(height: 8),
          TextFormField(
            controller: widget.controller,
            decoration: InputDecoration(
              errorText: widget.errorText,
              hintText: widget.hintText,
              suffixIcon: widget.obscure
                  ? IconButton(
                      icon: Icon(
                        isVisible ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          isVisible = !isVisible;
                        });
                      },
                    )
                  : null,
            ),
            obscureText: widget.obscure ? !isVisible : false,
            onChanged: widget.onChanged,
            keyboardType: widget.keyboardType,
            inputFormatters: widget.inputFormatters,
          ),
        ],
      ),
    );
  }
}
