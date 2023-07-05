import 'package:flutter/material.dart';

import '../../../../../../core/extensions/formatter_extensions.dart';
import '../../../../../../core/ui/helpers/size_extensions.dart';
import '../../../../../../core/ui/styles/text_styles.dart';
import '../../../../../../models/task_model.dart';

class TaskListTile extends StatelessWidget {
  final TaskModel task;
  final GestureLongPressCallback? onPressed;
  final Color themeColor;
  const TaskListTile(
    this.task,
    this.onPressed, {
    required this.themeColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: themeColor.withAlpha(75),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'cod. ${task.code}',
                  style: context.textStyles.textSemiBold,
                ),
                Text(task.descriptionService),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tomadora',
                      style: context.textStyles.textSemiBold,
                    ),
                    const SizedBox(height: 4),
                    SizedBox(
                      width: context.percentWidth(.4),
                      child: Text(
                        task.servTaker!.name,
                        style: context.textStyles.textRegular
                            .copyWith(fontSize: 12),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Informe',
                      style: context.textStyles.textSemiBold,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      task.reportType!.name,
                      style:
                          context.textStyles.textRegular.copyWith(fontSize: 12),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tipo de Produção',
                      style: context.textStyles.textSemiBold,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      task.productionType!.name,
                      style:
                          context.textStyles.textRegular.copyWith(fontSize: 12),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Horas Adicional Noturno',
                      style: context.textStyles.textSemiBold,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      task.hourDays ?? '0',
                      style:
                          context.textStyles.textRegular.copyWith(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Folha',
                      style: context.textStyles.textSemiBold,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      task.valuePayroll!.currencyPTBR,
                      style:
                          context.textStyles.textRegular.copyWith(fontSize: 12),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Fatura',
                      style: context.textStyles.textSemiBold,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      task.invoiceAmount.currencyPTBR,
                      style:
                          context.textStyles.textRegular.copyWith(fontSize: 12),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nota Fiscal',
                      style: context.textStyles.textSemiBold,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      task.valueInvoice!.currencyPTBR,
                      style:
                          context.textStyles.textRegular.copyWith(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
