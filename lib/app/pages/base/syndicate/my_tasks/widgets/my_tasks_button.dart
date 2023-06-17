// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../../core/ui/styles/colors_app.dart';
import '../../../../../core/ui/styles/text_styles.dart';

class MyTasksButton extends StatelessWidget {
  final String label;
  final bool selected;
  final double width;
  final double height;

  const MyTasksButton({
    Key? key,
    required this.label,
    required this.selected,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double width = (context.screenWidth / 2) - 28;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Material(
        elevation: 2,
        // color: selected ? ColorsApp.i.primary : ColorsApp.i.bg,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: InkWell(
          onTap: () {},
          child: Column(
            children: [
              Container(
                height: height,
                width: width,
                decoration: BoxDecoration(
                  color: selected
                      ? ColorsApp.i.primary.withAlpha(50)
                      : Colors.grey.shade200,
                  // color: ColorsApp.i.primary.withAlpha(50),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 12,
                      left: 8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '0',
                            style: context.textStyles.textBold
                                .copyWith(fontSize: 18),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'R\$ 0,00',
                            style: context.textStyles.textBold
                                .copyWith(fontSize: 16),
                          ),
                          const SizedBox(height: 4),
                          Text(label),
                        ],
                      ),
                    ),
                    const Positioned(
                      right: 8,
                      top: 8,
                      child: Icon(Icons.search),
                    ),
                  ],
                ),
              ),
              Container(
                height: 6,
                width: width,
                decoration: BoxDecoration(
                  color: ColorsApp.i.primary,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
