// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../ui/helpers/size_extensions.dart';
import '../ui/styles/text_styles.dart';

class DialogTaskOptions extends StatelessWidget {
  final String label;
  final String? btDownLabel;
  final VoidCallback? btDownTap;
  final String? btLeftLabel;
  final VoidCallback? btLeftTap;
  final String? btRightLabel;
  final VoidCallback? btRightTap;
  const DialogTaskOptions(
    this.label, {
    Key? key,
    this.btDownLabel,
    this.btDownTap,
    this.btLeftLabel,
    this.btLeftTap,
    this.btRightLabel,
    this.btRightTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Atenção!!!',
                  style: context.textStyles.textBold.copyWith(fontSize: 20),
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Qual ação deseja realizar sobre',
              style: context.textStyles.textRegular.copyWith(fontSize: 14),
            ),
            SizedBox(
              width: context.percentWidth(.635),
              child: Text(
                '"$label?"',
                style: context.textStyles.textSemiBold.copyWith(fontSize: 14),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: SizedBox(
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                        ),
                        side: BorderSide(
                          color: btLeftTap != null
                              ? Colors.green
                              : Colors.transparent,
                        ),
                        backgroundColor: Colors.green,
                      ),
                      onPressed: btLeftTap,
                      child: Text(btLeftLabel!),
                    ),
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: SizedBox(
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                        side: BorderSide(
                          color: btLeftTap != null
                              ? Colors.indigo
                              : Colors.transparent,
                        ),
                        backgroundColor: Colors.indigo,
                      ),
                      onPressed: btRightTap,
                      child: Text(btRightLabel!),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 40,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  side: BorderSide(
                    color: btLeftTap != null ? Colors.red : Colors.transparent,
                  ),
                  backgroundColor: Colors.red,
                ),
                onPressed: btDownTap,
                child: Text(btDownLabel!),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
