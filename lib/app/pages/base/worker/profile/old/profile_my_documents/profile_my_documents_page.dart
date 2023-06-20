// import 'package:brasil_fields/brasil_fields.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:intl/intl.dart';
// import 'package:mobx/mobx.dart';

// import '../../../../core/ui/helpers/loader.dart';
// import '../../../../core/ui/helpers/messages.dart';
// import '../../../../core/ui/styles/text_styles.dart';
// import '../../../../core/widget/text_field_changed_widget.dart';
// import '../../../../core/widget/text_field_widget.dart';
// import 'profile_my_documents_controller.dart';

// class ProfileMyDocumentsPage extends StatefulWidget {
//   const ProfileMyDocumentsPage({Key? key}) : super(key: key);

//   @override
//   State<ProfileMyDocumentsPage> createState() => _ProfileMyDocumentsPageState();
// }

// class _ProfileMyDocumentsPageState extends State<ProfileMyDocumentsPage>
  //   with Loader, Messages {
  // final ProfileMyDocumentsController controller =
  //     ProfileMyDocumentsController();
  // late final ReactionDisposer statusDisposer;

  // final cpfEC = TextEditingController();
  // final rgEC = TextEditingController();
  // final orgaoEmissorEC = TextEditingController();
  // final dataEmissaoEC = TextEditingController();

//   @override
//   void initState() {
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       statusDisposer = reaction((_) => controller.status, (status) {
//         switch (status) {
//           case ProfileMyDocumentsStateStatus.initial:
//             break;
//           case ProfileMyDocumentsStateStatus.loading:
//             showLoader();
//             break;
//           case ProfileMyDocumentsStateStatus.loaded:
//             hideLoader();
//             break;
//           case ProfileMyDocumentsStateStatus.saved:
//             hideLoader();
//             Navigator.pop(context);
//             break;
//           case ProfileMyDocumentsStateStatus.error:
//             hideLoader();
//             showError(controller.errorMessage ?? 'Erro');
//             break;
//         }
//       });
//     });
//     super.initState();
//   }

//   @override
//   void dispose() {
//     cpfEC.dispose();
//     rgEC.dispose();
//     orgaoEmissorEC.dispose();
//     dataEmissaoEC.dispose();
//     statusDisposer();
//     super.dispose();
//   }

//   Future<String?> showDateDialog(String? initialValue) async {
//     final now = DateTime.now();
//     final initialDate = initialValue != null
//         ? DateFormat('dd/MM/yyyy').parse(initialValue)
//         : DateTime.utc(now.year - 18, now.month, now.day);
//     final DateTime? pickedDate = await showDatePicker(
//       context: context,
//       initialDate: initialDate,
//       firstDate: DateTime(1950),
//       lastDate: DateTime(2100),
//     );

//     if (pickedDate != null) {
//       final String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
//       return formattedDate;
//     }
//     return null;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.grey[300],
//         title: Text(
//           'Meus Documentos',
//           style: context.textStyles.textBold.copyWith(color: Colors.black),
//         ),
//         iconTheme: const IconThemeData(color: Colors.black),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Observer(
//                 builder: (_) => TextFieldWidget(
//                   controller: cpfEC,
//                   label: 'CPF',
//                   hintText: 'Digite seu CPF',
//                   errorText: controller.cpfError,
//                   onChanged: controller.setCPF,
//                   initialValue: controller.cpf,
//                   keyboardType: TextInputType.number,
//                   inputFormatters: [
//                     FilteringTextInputFormatter.digitsOnly,
//                     CpfInputFormatter(),
//                   ],
//                 ),
//               ),
//               Observer(
//                 builder: (_) => TextFieldWidget(
//                   controller: rgEC,
//                   label: 'RG',
//                   hintText: 'Digite seu RG',
//                   errorText: controller.rgError,
//                   onChanged: controller.setRG,
//                   initialValue: controller.rg,
//                   keyboardType: TextInputType.number,
//                 ),
//               ),
//               Observer(
//                 builder: (_) => TextFieldWidget(
//                   controller: orgaoEmissorEC,
//                   label: 'Órgão emissor',
//                   hintText: 'Digite o órgao do seu RG',
//                   errorText: controller.orgaoEmissorError,
//                   onChanged: controller.setOrgaoEmissor,
//                   initialValue: controller.orgaoEmissor,
//                 ),
//               ),
//               Observer(
//                 builder: (_) => TextFieldChangedWidget(
//                   controller: dataEmissaoEC,
//                   label: 'Data de Nascimento',
//                   hintText: 'Data de Nascimento',
//                   readOnly: true,
//                   initialValue: controller.dataEmissao,
//                   errorText: controller.dataEmissaoError,
//                   onTap: () async {
//                     final result = await showDateDialog(controller.dataEmissao);
//                     if (result != null) {
//                       dataEmissaoEC.text = result;
//                       controller.setDataEmissao(result);
//                     }
//                   },
//                 ),
//               ),
//               const SizedBox(
//                 height: 16,
//               ),
//               Observer(
//                 builder: (_) => SizedBox(
//                   width: double.infinity,
//                   height: 50,
//                   child: GestureDetector(
//                     onTap: controller.invalidSendPressed,
//                     child: ElevatedButton(
//                       onPressed: controller.sendPressed,
//                       child: const Text(
//                         'Salvar Informações',
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
