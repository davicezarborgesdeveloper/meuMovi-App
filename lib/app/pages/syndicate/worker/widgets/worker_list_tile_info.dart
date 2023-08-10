import 'package:flutter/material.dart';

import '../../../../core/ui/styles/text_styles.dart';

class WorkerListTileInfo extends StatelessWidget {
  final String title;
  final String info;
  final String side;
  const WorkerListTileInfo({
    required this.title,
    required this.info,
    required this.side,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment:
            side == 'l' ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          Text(
            title,
            style: context.textStyles.textSemiBold.copyWith(fontSize: 12),
          ),
          const SizedBox(height: 2),
          Text(
            info,
            style: context.textStyles.textRegular.copyWith(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
