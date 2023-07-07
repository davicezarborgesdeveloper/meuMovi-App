import 'package:flutter/material.dart';

import '../../../../../../core/extensions/formatter_extensions.dart';
import '../../../../../../core/ui/helpers/size_extensions.dart';
import '../../../../../../core/ui/styles/colors_app.dart';
import '../../../../../../core/ui/styles/text_styles.dart';
import '../../../../../../models/address_model.dart';
import '../../../../../../models/worker_model.dart';

class WorkerListTile extends StatelessWidget {
  final WorkerModel worker;
  final GestureLongPressCallback? onLongPress;
  const WorkerListTile(this.worker, this.onLongPress, {super.key});

  String? getAddressFormatted(AddressModel address) {
    final buffer = StringBuffer();
    buffer.write(address.street.isNotEmpty ? address.street : '');
    buffer.write(address.number.isNotEmpty ? ', ${address.number}' : '');
    buffer
        .write(address.complement.isNotEmpty ? ', ${address.complement}' : '');
    buffer.write(address.district.isNotEmpty ? ', ${address.district}' : '');
    buffer.write(address.city.isNotEmpty ? ', ${address.city}' : '');
    buffer.write(address.state.isNotEmpty ? ' - ${address.state}' : '');
    buffer.write(
      address.zip.isNotEmpty ? ', CEP ${address.zip.formattedZip}' : '',
    );

    return buffer.toString();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onLongPress: onLongPress,
      onTap: onLongPress,
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
                Text('${worker.name} ${worker.lastname}'),
                Text(worker.documents.cpf.formattedCPF),
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
                      'Data de Nascimento',
                      style: context.textStyles.textSemiBold,
                    ),
                    const SizedBox(height: 4),
                    Text(worker.personal.birthdate),
                    const SizedBox(height: 8),
                    Text(
                      'Telefone',
                      style: context.textStyles.textSemiBold,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      worker.personal.phone ?? '',
                      style:
                          context.textStyles.textRegular.copyWith(fontSize: 12),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'RG',
                      style: context.textStyles.textSemiBold,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${worker.documents.rg} ${worker.documents.orgaoEmissor ?? ''}',
                      style:
                          context.textStyles.textRegular.copyWith(fontSize: 12),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'E-mail',
                      style: context.textStyles.textSemiBold,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      worker.personal.email,
                      style:
                          context.textStyles.textRegular.copyWith(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
            const Divider(
              color: Colors.grey,
            ),
            SizedBox(
              width: context.percentWidth(.9),
              child: Text(
                getAddressFormatted(worker.address)!,
                textAlign: TextAlign.left,
              ),
            )
          ],
        ),
      ),
    );
  }
}
