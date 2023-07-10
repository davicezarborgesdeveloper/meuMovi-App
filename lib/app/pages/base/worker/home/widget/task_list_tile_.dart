import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';

import '../../../../../core/extensions/formatter_extensions.dart';
import '../../../../../core/ui/helpers/size_extensions.dart';
import '../../../../../core/ui/styles/text_styles.dart';
import '../../../../../models/task_model.dart';

class TaskListTile extends StatelessWidget {
  final TaskModel task;
  final GestureLongPressCallback? onPressed;
  final Color? themeColor;
  const TaskListTile({
    required this.task,
    required this.onPressed,
    this.themeColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: themeColor!.withAlpha(25),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tomadora',
                  style: context.textStyles.textSemiBold,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  task.servTaker!.name,
                  style: context.textStyles.textRegular.copyWith(fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ],
            ),
            Divider(color: Colors.grey.shade700, thickness: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Descrição',
                      style: context.textStyles.textSemiBold,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      task.descriptionService.toUpperCase(),
                      style: context.textStyles.textBold,
                    ),
                    const SizedBox(height: 6),
                    if ((task.hourDays != null && task.hourDays!.isNotEmpty) &&
                        task.hourUnitary != null)
                      Text(
                        'HORAS EXTRAS',
                        style: context.textStyles.textBold,
                      ),
                  ],
                ),
                SizedBox(
                  width: context.percentWidth(.45),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Qtde.',
                            style: context.textStyles.textSemiBold,
                          ),
                          const SizedBox(height: 6),
                          Text(
                            '${task.quantity}',
                            style: context.textStyles.textRegular,
                          ),
                          const SizedBox(height: 6),
                          if ((task.hourDays != null &&
                                  task.hourDays!.isNotEmpty) &&
                              task.hourUnitary != null)
                            Text(
                              '${task.hourDays}',
                              style: context.textStyles.textRegular,
                            ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Unitário',
                            style: context.textStyles.textSemiBold,
                          ),
                          const SizedBox(height: 6),
                          Text(
                            UtilBrasilFields.obterReal(
                              task.unitaryValue!,
                              moeda: false,
                            ),
                            style: context.textStyles.textRegular,
                          ),
                          const SizedBox(height: 6),
                          if (task.hourUnitary != null)
                            Text(
                              UtilBrasilFields.obterReal(
                                task.hourUnitary!,
                                moeda: false,
                              ),
                              style: context.textStyles.textRegular,
                            ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Total',
                            style: context.textStyles.textSemiBold,
                          ),
                          const SizedBox(height: 6),
                          Text(
                            UtilBrasilFields.obterReal(
                              task.unitaryValue! * task.quantity!,
                              moeda: false,
                            ),
                            style: context.textStyles.textRegular,
                          ),
                          const SizedBox(height: 6),
                          if ((task.hourDays != null &&
                                  task.hourDays!.isNotEmpty) &&
                              task.hourUnitary != null)
                            Text(
                              UtilBrasilFields.obterReal(
                                task.hourUnitary! *
                                    double.tryParse(
                                      task.hourDays!.replaceAll(',', '.'),
                                    )!,
                                moeda: false,
                              ),
                              style: context.textStyles.textRegular,
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(color: Colors.grey, thickness: .5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: context.textStyles.textSemiBold,
                ),
                ((task.hourDays != null && task.hourDays!.isNotEmpty) &&
                        task.hourUnitary != null)
                    ? Text(
                        ((task.hourUnitary! *
                                    double.tryParse(
                                      task.hourDays!.replaceAll(',', '.'),
                                    )!) +
                                (task.unitaryValue! * task.quantity!))
                            .currencyPTBR,
                      )
                    : Text(
                        (task.unitaryValue! * task.quantity!).currencyPTBR,
                        style: context.textStyles.textRegular,
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
