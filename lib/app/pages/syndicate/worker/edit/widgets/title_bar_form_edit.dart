import 'package:flutter/material.dart';

import '../../../../../core/ui/helpers/size_extensions.dart';
import '../../../../../core/ui/styles/colors_app.dart';
import '../../../../../core/ui/styles/text_styles.dart';

class TitleBarFormEdit extends StatelessWidget {
  final String title;
  final Color titleColor;
  final double padding;
  final VoidCallback? onPressed;
  const TitleBarFormEdit({
    required this.title,
    required this.titleColor,
    this.padding = 0.0,
    this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
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
                  .copyWith(fontSize: 16, color: titleColor),
            ),
          ),
          const Expanded(child: Divider(color: Colors.grey)),
          IconButton(
            onPressed: onPressed,
            icon: Icon(
              Icons.edit,
              color: ColorsApp.i.primary,
            ),
          ),
          SizedBox(
            width: context.percentWidth(.025),
            child: const Divider(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
