import 'package:flutter/material.dart';

import '../../../../core/extensions/formatter_extensions.dart';
import '../../../../core/ui/helpers/size_extensions.dart';
import '../../../../core/ui/styles/colors_app.dart';
import '../../../../models/address_model.dart';
import '../../../../models/worker_model.dart';
import 'worker_list_tile_info.dart';

class WorkerListTile extends StatelessWidget {
  final WorkerModel worker;
  final GestureTapCallback? onTap;
  const WorkerListTile(this.worker, this.onTap, {super.key});

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
      onTap: onTap,
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
            Text('${worker.name} ${worker.lastname}'),
            const Divider(color: Colors.grey),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    WorkerListTileInfo(
                      title: 'RG',
                      info:
                          '${worker.documents.rg} ${worker.documents.orgaoEmissor ?? ''}',
                      side: 'l',
                    ),
                    WorkerListTileInfo(
                      title: 'Telefone',
                      info: worker.personal.phone != null
                          ? worker.personal.phone!.formattedPhone
                          : '',
                      side: 'r',
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    WorkerListTileInfo(
                      title: 'Data de Nascimento',
                      info: worker.personal.birthdate,
                      side: 'l',
                    ),
                    WorkerListTileInfo(
                      title: 'CPF',
                      info: worker.documents.cpf.formattedCPF,
                      side: 'r',
                    ),
                  ],
                ),
                WorkerListTileInfo(
                  title: 'E-mail',
                  info: worker.personal.email,
                  side: 'l',
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
