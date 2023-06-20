// import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:mobx/mobx.dart';

// import '../../../../core/ui/helpers/loader.dart';
// import '../../../../core/ui/helpers/messages.dart';
// import '../../../../core/ui/styles/colors_app.dart';
// import '../../../../core/ui/styles/text_styles.dart';
// import 'bank_account/bank_account_page.dart';
// import 'pix/bank_pix_page.dart';
// import 'profile_bank_data_controller.dart';
// import 'widget/card_receipt.dart';

// class ProfileBankDataPage extends StatefulWidget {
//   const ProfileBankDataPage({Key? key}) : super(key: key);

//   @override
//   State<ProfileBankDataPage> createState() => _ProfileBankDataPageState();
// }

// class _ProfileBankDataPageState extends State<ProfileBankDataPage>
//     with Loader, Messages {
//   final ProfileBankDataController controller = ProfileBankDataController();
//   late final ReactionDisposer statusDisposer;

//   @override
//   void initState() {
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       statusDisposer = reaction((_) => controller.status, (status) {
//         switch (status) {
//           case ProfileBankDataStateStatus.initial:
//             break;
//           case ProfileBankDataStateStatus.loading:
//             showLoader();
//             break;
//           case ProfileBankDataStateStatus.loaded:
//             hideLoader();
//             break;
//           case ProfileBankDataStateStatus.update:
//             hideLoader();
//             break;
//           case ProfileBankDataStateStatus.error:
//             hideLoader();
//             showError(controller.errorMessage ?? 'Erro');
//             break;
//         }
//       });
//       controller.findBankReceipt();
//     });
//     super.initState();
//   }

//   @override
//   void dispose() {
//     statusDisposer();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.grey[300],
//         title: Text(
//           'Dados bancários',
//           style: context.textStyles.textBold.copyWith(color: Colors.black),
//         ),
//         iconTheme: const IconThemeData(color: Colors.black),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.fromLTRB(24, 32, 24, 16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Observer(
//               builder: (_) => Text(
//                 controller.bankReceipt != null
//                     ? 'Minha conta cadastrada para recebimentos'
//                     : 'Cadastre uma conta bancária ativa ou chave Pix para recebimentos.',
//                 style: context.textStyles.textRegular
//                     .copyWith(fontSize: 15, color: Colors.grey.shade500),
//               ),
//             ),
//             const SizedBox(height: 32),
//             Observer(
//               builder: (_) {
//                 return controller.bankReceipt != null
//                     ? CardReceipt(controller)
//                     : Column(
//                         children: [
//                           SizedBox(
//                             height: 60,
//                             width: double.infinity,
//                             child: ElevatedButton(
//                               onPressed: () async {
//                                 await Navigator.of(context).push(
//                                   MaterialPageRoute(
//                                     builder: (_) => const BankPixPage(),
//                                   ),
//                                 );
//                                 await controller.findBankReceipt();
//                               },
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.white,
//                               ),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(4.0),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   children: [
//                                     Icon(
//                                       Icons.pix,
//                                       color: ColorsApp.i.secondary,
//                                     ),
//                                     const SizedBox(width: 16),
//                                     Text(
//                                       'Cadastre sua chave Pix',
//                                       style:
//                                           context.textStyles.textBold.copyWith(
//                                         color: Colors.grey.shade600,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 16,
//                           ),
//                           SizedBox(
//                             height: 60,
//                             width: double.infinity,
//                             child: ElevatedButton(
//                               onPressed: () async {
//                                 await Navigator.of(context).push(
//                                   MaterialPageRoute(
//                                     builder: (_) => const BankAccountPage(),
//                                   ),
//                                 );
//                                 await controller.findBankReceipt();
//                               },
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.white,
//                               ),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(4.0),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   children: [
//                                     Icon(
//                                       Icons.credit_card,
//                                       color: ColorsApp.i.secondary,
//                                     ),
//                                     const SizedBox(width: 16),
//                                     Text(
//                                       'Cadastre sua conta bancária',
//                                       style:
//                                           context.textStyles.textBold.copyWith(
//                                         color: Colors.grey.shade600,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
