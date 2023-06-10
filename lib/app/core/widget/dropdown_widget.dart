import 'package:flutter/material.dart';

import '../../models/bank_model.dart';
import '../ui/helpers/size_extensions.dart';
import '../ui/styles/text_styles.dart';

class DropdownWidget extends StatefulWidget {
  final String label;
  final Enum? statusSelected;
  final Object? selected;
  final Function? onSave;
  final String? errorText;
  final List listOptions;
  const DropdownWidget({
    Key? key,
    required this.label,
    required this.onSave,
    this.statusSelected,
    this.selected,
    this.errorText,
    required this.listOptions,
  }) : super(key: key);

  @override
  State<DropdownWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: DropdownButtonFormField(
              decoration: InputDecoration(
                errorText: widget.errorText,
              ),
              value: widget.statusSelected ?? widget.selected,
              items: [
                DropdownMenuItem(
                  value: null,
                  child: Text(
                    'Selecione',
                    style:
                        context.textStyles.textRegular.copyWith(fontSize: 14),
                  ),
                ),
                if (widget.listOptions is List<BankModel>)
                  ...widget.listOptions.map(
                    (s) {
                      return DropdownMenuItem(
                        value: s,
                        child: SizedBox(
                          width: context.percentWidth(.65),
                          child: Text(
                            s.name,
                            overflow: TextOverflow.ellipsis,
                            style: context.textStyles.textRegular
                                .copyWith(fontSize: 14),
                          ),
                        ),
                      );
                    },
                  ).toList()
                else
                  ...widget.listOptions
                      .map(
                        (s) => DropdownMenuItem(
                          value: s,
                          child: Text(
                            s.name,
                            overflow: TextOverflow.ellipsis,
                            style: context.textStyles.textRegular
                                .copyWith(fontSize: 14),
                          ),
                        ),
                      )
                      .toList(),
                // else
              ],
              onChanged: (value) {
                // print((value as BankModel).fullname);
                widget.onSave!(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
