// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../core/ui/styles/colors_app.dart';
import '../../../../core/ui/styles/text_styles.dart';

class SignupMenuButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final double height;
  final double width;
  final VoidCallback onTap;
  final Color? color;
  const SignupMenuButton({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
    required this.onTap,
    required this.height,
    required this.width,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: color?.withOpacity(.7) ?? ColorsApp.i.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Row(
            children: [
              Icon(
                icon,
                size: height * .75,
                color: Colors.white,
              ),
              const SizedBox(
                width: 8,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: width * .57,
                    child: Text(
                      title,
                      style: context.textStyles.textBold
                          .copyWith(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: width * .57,
                    child: Text(
                      description,
                      style: context.textStyles.textLight
                          .copyWith(color: Colors.white, fontSize: 12),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
