import 'package:flutter/material.dart';

import '../../../../../core/extensions/formatter_extensions.dart';
import '../../../../../core/ui/styles/colors_app.dart';
import '../../../../../core/ui/styles/text_styles.dart';
import '../../../../../models/order_model.dart';

class PeriodWorkerTile extends StatelessWidget {
  final OrderModel order;
  final bool isEven;
  const PeriodWorkerTile(this.order, this.isEven, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      decoration: BoxDecoration(
        color: isEven ? Colors.white : ColorsApp.i.ternary.withAlpha(50),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                order.task,
                // order.task,
                style: context.textStyles.textBold
                    .copyWith(fontSize: 14, color: Colors.grey.shade700),
              ),
              const SizedBox(height: 4),
              Text(
                order.date,
                style: context.textStyles.textLight
                    .copyWith(fontSize: 12, color: Colors.grey.shade700),
              ),
            ],
          ),
          Text(
            order.statusPayment == 0
                ? 'Aguadando pagamento'
                : order.statusPayment == 1
                    ? 'Pendente'
                    : 'Pago',
            style: context.textStyles.textLight
                .copyWith(fontSize: 12, color: Colors.grey.shade700),
          ),
          Text(
            order.amountReceivable.currencyPTBR,
            style: context.textStyles.textBold
                .copyWith(fontSize: 14, color: Colors.grey.shade700),
          ),
        ],
      ),
    );
  }
}
