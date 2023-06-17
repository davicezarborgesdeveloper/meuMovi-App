// import 'package:brasil_fields/brasil_fields.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:intl/intl.dart';
// import 'package:mobx/mobx.dart';

// import '../../../../core/ui/helpers/enums.dart';
// import '../../../../core/ui/helpers/loader.dart';
// import '../../../../core/ui/helpers/messages.dart';
// import '../../../../core/ui/styles/colors_app.dart';
// import '../../../../core/ui/styles/text_styles.dart';
// import '../../../../core/widget/dropdown_widget.dart';
// import '../../../../core/widget/register_success.dart';
// import '../../../../core/widget/text_field_changed_widget.dart';
// import '../../../../core/widget/text_field_widget.dart';
// import '../../../menu/menu_drawer.dart';
// import 'register/tasks_register_controller.dart';

// class TasksSyndicateRegisterPage extends StatefulWidget {
//   const TasksSyndicateRegisterPage({super.key});

//   @override
//   State<TasksSyndicateRegisterPage> createState() =>
//       _TasksSyndicateRegisterPageState();
// }

// class _TasksSyndicateRegisterPageState extends State<TasksSyndicateRegisterPage>
//     with Loader, Messages {
//   final TasksRegisterController controller = TasksRegisterController();
//   late final ReactionDisposer statusDisposer;
//   final appointmentDateEC = TextEditingController();
//   final endDateEC = TextEditingController();
//   final cityEC = TextEditingController();
//   final stateEC = TextEditingController();
//   final streetEC = TextEditingController();
//   final districtEC = TextEditingController();

//   @override
//   void initState() {
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       statusDisposer = reaction((_) => controller.status, (status) {
//         switch (status) {
//           case TasksRegisterStateStatus.initial:
//             break;
//           case TasksRegisterStateStatus.loading:
//             showLoader();
//             break;
//           case TasksRegisterStateStatus.loaded:
//             hideLoader();
//             break;
//           case TasksRegisterStateStatus.saved:
//             hideLoader();
//             showDialog(
//               context: context,
//               builder: (_) => const RegisterSuccess(),
//             );
//             break;
//           case TasksRegisterStateStatus.error:
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
//     appointmentDateEC.dispose();
//     endDateEC.dispose();
//     cityEC.dispose();
//     stateEC.dispose();
//     streetEC.dispose();
//     districtEC.dispose();
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
//         backgroundColor: ColorsApp.i.bg,
//         title: Text(
//           'Tarefas',
//           style:
//               context.textStyles.textBold.copyWith(color: ColorsApp.i.primary),
//         ),
//         iconTheme: IconThemeData(color: ColorsApp.i.primary),
//       ),
//       drawer: MenuDrawer(),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Observer(
//                 builder: (_) => TextFieldChangedWidget(
//                   controller: appointmentDateEC,
//                   label: 'Data de Agendamento',
//                   hintText: 'dd/mm/aaaa',
//                   readOnly: true,
//                   initialValue: controller.appointmentDate,
//                   errorText: controller.appointmentDateError,
//                   onTap: () async {
//                     final result =
//                         await showDateDialog(controller.appointmentDate);
//                     if (result != null) {
//                       appointmentDateEC.text = result;
//                       controller.setAppointmentDate(result);
//                     }
//                   },
//                 ),
//               ),
//               Observer(
//                 builder: (_) => TextFieldChangedWidget(
//                   controller: endDateEC,
//                   label: 'Previsão de Termino',
//                   hintText: 'dd/mm/aaaa',
//                   readOnly: true,
//                   initialValue: controller.endDate,
//                   errorText: controller.endDateError,
//                   onTap: () async {
//                     final result =
//                         await showDateDialog(controller.appointmentDate);
//                     if (result != null) {
//                       endDateEC.text = result;
//                       controller.setEndDate(result);
//                     }
//                   },
//                 ),
//               ),
//               Observer(
//                 builder: (_) => TextFieldWidget(
//                   label: 'CEP',
//                   hintText: 'Digite seu CEP',
//                   errorText: controller.zipError,
//                   onChanged: (value) async {
//                     controller.setZip(value);
//                     if (value.length >= 10) {
//                       await controller.searchZip(value);
//                       cityEC.text = controller.city!;
//                       stateEC.text = controller.state!;
//                       streetEC.text = controller.street!;
//                       districtEC.text = controller.district!;
//                     }
//                   },
//                   initialValue: controller.zip,
//                   keyboardType: TextInputType.number,
//                   inputFormatters: [
//                     FilteringTextInputFormatter.digitsOnly,
//                     CepInputFormatter(),
//                   ],
//                 ),
//               ),
//               Observer(
//                 builder: (_) {
//                   return TextFieldChangedWidget(
//                     controller: streetEC,
//                     label: 'Rua',
//                     hintText: 'Digite o nome da sua rua',
//                     readOnly: false,
//                     initialValue: controller.street,
//                     onChanged: controller.setStreet,
//                   );
//                 },
//               ),
//               Observer(
//                 builder: (_) => TextFieldWidget(
//                   label: 'Numero',
//                   hintText: 'Nº',
//                   errorText: controller.numberError,
//                   onChanged: controller.setNumber,
//                   initialValue: controller.number,
//                 ),
//               ),
//               Observer(
//                 builder: (_) {
//                   return TextFieldChangedWidget(
//                     controller: districtEC,
//                     label: 'Bairro',
//                     hintText: 'Digite o nome do seu bairro',
//                     readOnly: true,
//                     initialValue: controller.district,
//                     onChanged: controller.setDistrict,
//                   );
//                 },
//               ),
//               Observer(
//                 builder: (_) {
//                   return TextFieldChangedWidget(
//                     controller: cityEC,
//                     label: 'Cidade',
//                     hintText: 'Cidade',
//                     readOnly: true,
//                     initialValue: controller.city,
//                     onChanged: controller.setCity,
//                   );
//                 },
//               ),
//               Observer(
//                 builder: (_) {
//                   return TextFieldChangedWidget(
//                     controller: stateEC,
//                     label: 'Estado',
//                     hintText: 'Estado',
//                     readOnly: true,
//                     initialValue: controller.state,
//                     onChanged: controller.setState,
//                   );
//                 },
//               ),
//               Observer(
//                 builder: (_) => TextFieldWidget(
//                   label: 'Complemento',
//                   hintText: 'Bloco, apto...',
//                   onChanged: controller.setComplement,
//                   initialValue: controller.complement,
//                 ),
//               ),
//               Observer(
//                 builder: (_) => TextFieldWidget(
//                   label: 'Ponto de referência',
//                   hintText: 'Digite um ponto de referência',
//                   onChanged: controller.setReferencePoint,
//                   initialValue: controller.referencePoint,
//                 ),
//               ),
//               Observer(
//                 builder: (_) => TextFieldWidget(
//                   label: 'Operação',
//                   hintText: '',
//                   onChanged: controller.setOperation,
//                   initialValue: controller.operation,
//                 ),
//               ),
//               Observer(
//                 builder: (_) => TextFieldWidget(
//                   label: 'Cliente',
//                   hintText: '',
//                   onChanged: controller.setClient,
//                   initialValue: controller.client,
//                 ),
//               ),
//               Observer(
//                 builder: (_) => TextFieldWidget(
//                   label: 'CTE',
//                   hintText: '',
//                   onChanged: controller.setCte,
//                   initialValue: controller.cte,
//                 ),
//               ),
//               Observer(
//                 builder: (_) => TextFieldWidget(
//                   label: 'NFE',
//                   hintText: '',
//                   onChanged: controller.setNfe,
//                   initialValue: controller.nfe,
//                 ),
//               ),
//               Observer(
//                 builder: (_) => TextFieldWidget(
//                   label: 'Remessa/Nº Transporte',
//                   hintText: '',
//                   onChanged: controller.setShipping,
//                   initialValue: controller.shipping,
//                 ),
//               ),
//               Observer(
//                 builder: (_) => TextFieldWidget(
//                   label: 'Placa do Véiculo',
//                   hintText: '',
//                   onChanged: controller.setLicensePlate,
//                   initialValue: controller.licensePlate,
//                 ),
//               ),
//               Observer(
//                 builder: (_) => TextFieldWidget(
//                   label: 'Tomadora',
//                   hintText: '',
//                   onChanged: controller.setServiceTaker,
//                   initialValue: controller.serviceTaker,
//                 ),
//               ),
//               Observer(
//                 builder: (_) => TextFieldWidget(
//                   label: 'Locais de Carga e Descarga',
//                   hintText: '',
//                   onChanged: controller.setLocationLoad,
//                   initialValue: controller.locationLoad,
//                 ),
//               ),
//               const SizedBox(height: 16),
//               Text(
//                 'Detalhes da Tarefa',
//                 style: context.textStyles.textBold.copyWith(fontSize: 16),
//               ),
//               const Divider(),
//               DropdownWidget(
//                 label: 'Tipo de Trabalho',
//                 statusSelected: controller.kindWork,
//                 onSave: controller.setKindWork,
//                 errorText: controller.kindWorkError,
//                 listOptions: KindWork.values,
//               ),
//               DropdownWidget(
//                 label: 'Tipo de Veículo',
//                 statusSelected: controller.vehicleTypes,
//                 onSave: controller.setVehicleTypes,
//                 errorText: controller.vehicleTypesError,
//                 listOptions: VehicleType.values,
//               ),
//               Observer(
//                 builder: (_) => TextFieldWidget(
//                   label: 'Peso Total (KG)',
//                   hintText: '',
//                   errorText: controller.totalWeightError,
//                   onChanged: controller.setTotalWeight,
//                   initialValue: controller.totalWeight,
//                   keyboardType: TextInputType.number,
//                   inputFormatters: [
//                     FilteringTextInputFormatter.digitsOnly,
//                     RealInputFormatter()
//                   ],
//                 ),
//               ),
//               Observer(
//                 builder: (_) => TextFieldWidget(
//                   label: 'Volume Total (M³)',
//                   hintText: '',
//                   errorText: controller.totalVolumeError,
//                   onChanged: controller.setTotalVolume,
//                   initialValue: controller.totalVolume,
//                   keyboardType: TextInputType.number,
//                   inputFormatters: [
                    // FilteringTextInputFormatter.digitsOnly,
                    // RealInputFormatter()
//                   ],
//                 ),
//               ),
//               Observer(
//                 builder: (_) => TextFieldWidget(
//                   label: 'Qtd. de Volume/Caixas',
//                   hintText: '',
//                   errorText: controller.qtyVolumeError,
//                   onChanged: controller.setQtyVolume,
//                   initialValue: controller.qtyVolume,
//                   keyboardType: TextInputType.number,
//                   inputFormatters: [
//                     FilteringTextInputFormatter.digitsOnly,
//                     RealInputFormatter()
//                   ],
//                 ),
//               ),
//               DropdownWidget(
//                 label: 'Tipo de Carga',
//                 statusSelected: controller.loadType,
//                 onSave: controller.setLoadType,
//                 errorText: controller.loadTypeError,
//                 listOptions: LoadType.values,
//               ),
//               DropdownWidget(
//                 label: 'Tipo de Carregamento',
//                 statusSelected: controller.loadingType,
//                 onSave: controller.setLoadingType,
//                 errorText: controller.loadingTypeError,
//                 listOptions: LoadingType.values,
//               ),
//               DropdownWidget(
//                 label: 'Tipo de Doca',
//                 statusSelected: controller.dockType,
//                 onSave: controller.setDockType,
//                 errorText: controller.kindWorkError,
//                 listOptions: DockType.values,
//               ),
//               Observer(
//                 builder: (_) => TextFieldWidget(
//                   label: 'Qtd. de Trabalhadores',
//                   hintText: '',
//                   errorText: controller.qtyWorkersError,
//                   onChanged: controller.setQtyWorkers,
//                   initialValue: controller.qtyWorkers,
//                   keyboardType: TextInputType.number,
//                   inputFormatters: [
//                     FilteringTextInputFormatter.digitsOnly,
//                   ],
//                 ),
//               ),
//               Observer(
//                 builder: (_) => TextFieldWidget(
//                   label: 'Trabalhador',
//                   hintText: '',
//                   errorText: controller.workerError,
//                   onChanged: controller.setWorker,
//                   initialValue: controller.worker,
//                   keyboardType: TextInputType.number,
//                   inputFormatters: [
//                     FilteringTextInputFormatter.digitsOnly,
//                     RealInputFormatter()
//                   ],
//                 ),
//               ),
//               Observer(
//                 builder: (_) => TextFieldWidget(
//                   label: 'Qtd. Locais de Descarga(Somatória)',
//                   hintText: '',
//                   errorText: controller.qtyDownloadLocationError,
//                   onChanged: controller.setQtyDownloadLocation,
//                   initialValue: controller.qtyDownloadLocation,
//                   keyboardType: TextInputType.number,
//                   inputFormatters: [
//                     FilteringTextInputFormatter.digitsOnly,
//                     RealInputFormatter()
//                   ],
//                 ),
//               ),
//               Observer(
//                 builder: (_) => SizedBox(
//                   width: double.infinity,
//                   height: 50,
//                   child: GestureDetector(
//                     onTap: controller.invalidSendPressed,
//                     child: ElevatedButton(
//                       onPressed: controller.sendPressed,
//                       child: const Text('Confirmar cadastro'),
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
