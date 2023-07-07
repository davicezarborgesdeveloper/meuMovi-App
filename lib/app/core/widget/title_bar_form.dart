import 'package:flutter/material.dart';

import '../ui/helpers/size_extensions.dart';
import '../ui/styles/text_styles.dart';

class TitleBarForm extends StatelessWidget {
  final String title;
  final Color titleColor;
  const TitleBarForm({
    required this.title,
    required this.titleColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          SizedBox(
            width: context.percentWidth(.025),
            child: const Divider(
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              title,
              style: context.textStyles.textBold
                  .copyWith(fontSize: 18, color: titleColor),
            ),
          ),
          const Expanded(child: Divider(color: Colors.grey)),
        ],
      ),
    );
  }
}
