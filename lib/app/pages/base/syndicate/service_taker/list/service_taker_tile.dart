import 'package:flutter/material.dart';

import '../../../../../core/extensions/formatter_extensions.dart';
import '../../../../../core/ui/styles/colors_app.dart';
import '../../../../../core/ui/styles/text_styles.dart';
import '../../../../../models/service_taker_model.dart';

class ServiceTakerTile extends StatelessWidget {
  final ServiceTakerModel serviceTaker;
  final GestureLongPressCallback? onLongPress;
  const ServiceTakerTile(this.serviceTaker, this.onLongPress, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: onLongPress,
      child: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: ColorsApp.i.primary.withAlpha(75),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    serviceTaker.fantasyName,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Text(serviceTaker.user.formattedCNPJ),
                ],
              ),
              const Divider(color: Colors.grey),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Responsável',
                        style: context.textStyles.textSemiBold,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        serviceTaker.name,
                        style: context.textStyles.textRegular
                            .copyWith(fontSize: 12),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Telefone',
                        style: context.textStyles.textSemiBold,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        serviceTaker.phone.formattedPhone,
                        style: context.textStyles.textRegular
                            .copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'CEP',
                        style: context.textStyles.textSemiBold,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        serviceTaker.zip.formattedZip,
                        style: context.textStyles.textRegular
                            .copyWith(fontSize: 12),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'E-mail',
                        style: context.textStyles.textSemiBold,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        serviceTaker.email,
                        style: context.textStyles.textRegular
                            .copyWith(fontSize: 12),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
