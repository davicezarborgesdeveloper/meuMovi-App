import 'package:flutter/material.dart';

import '../ui/helpers/size_extensions.dart';
import '../ui/styles/text_styles.dart';

class MoviStepper extends StatefulWidget {
  final int currentStep;
  final Widget? buttonCancel;
  final Widget buttonContinue;
  final List<Widget> steps;

  const MoviStepper({
    Key? key,
    required this.currentStep,
    required this.steps,
    this.buttonCancel,
    required this.buttonContinue,
  }) : super(key: key);

  @override
  State<MoviStepper> createState() => _MoviStepperState();
}

class _MoviStepperState extends State<MoviStepper> {
  Color _setColorStep(int index) {
    if (widget.currentStep == index) {
      return Colors.indigo;
    }
    if (widget.currentStep > index) {
      return Colors.green;
    }
    return Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(16),
          height: 60,
          child: Center(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: widget.steps.length,
              itemBuilder: (_, index) {
                return Row(
                  children: [
                    if (index > 0)
                      Container(
                        width: 40,
                        height: 2,
                        color: _setColorStep(index),
                      ),
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: _setColorStep(index),
                      child: Text(
                        '${(index + 1)}',
                        style: context.textStyles.textSemiBold
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        widget.steps[widget.currentStep],
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (widget.buttonCancel != null)
                SizedBox(
                  width: (context.percentWidth(.45)),
                  height: 50,
                  child: widget.buttonCancel!,
                ),
              SizedBox(
                width: widget.buttonCancel == null
                    ? context.percentWidth(.9)
                    : (context.percentWidth(.45)),
                height: 50,
                child: widget.buttonContinue,
              ),
            ],
          ),
        )
      ],
    );
  }
}
