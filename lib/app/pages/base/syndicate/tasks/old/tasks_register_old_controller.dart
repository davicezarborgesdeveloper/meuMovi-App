// import 'dart:developer';

// import 'package:mobx/mobx.dart';

// import '../../../../../core/ui/helpers/enums.dart';
// import '../../../../../models/address_model.dart';
// import '../../../../../models/task_model.dart';
// import '../../../../../repositories/zip/zip_repository.dart';
// import '../../../../../services/task/task_service.dart';
// part 'tasks_register_controller.g.dart';

// enum TasksRegisterStateStatus {
//   initial,
//   loading,
//   loaded,
//   error,
//   saved,
// }

// class TasksRegisterController = TasksRegisterControllerBase
//     with _$TasksRegisterController;

// abstract class TasksRegisterControllerBase with Store {
//   @readonly
//   var _status = TasksRegisterStateStatus.initial;

//   @readonly
//   String? _errorMessage;

//   @readonly
//   bool _showErrors = false;

//   @observable
//   String? appointmentDate;

//   @observable
//   String? endDate;

//   @observable
//   String? zip;

//   @observable
//   String? street;

//   @observable
//   String? number;

//   @observable
//   String? district;

//   @observable
//   String? city;

//   @observable
//   String? state;

//   @observable
//   String? complement;

//   @observable
//   String? referencePoint;

//   @observable
//   String? operation;

//   @observable
//   String? client;

//   @observable
//   String? cte;

//   @observable
//   String? nfe;

//   @observable
//   String? shipping;

//   @observable
//   String? licensePlate;

//   @observable
//   String? serviceTaker;

//   @observable
//   String? locationLoad;

//   @action
//   void setAppointmentDate(String value) => appointmentDate = value;

//   @action
//   void setEndDate(String value) => endDate = value;

//   @action
//   void setZip(String value) => zip = value;

//   @action
//   void setCity(String value) => city = value;

//   @action
//   void setState(String value) => state = value;

//   @action
//   void setStreet(String value) => street = value;

//   @action
//   void setDistrict(String value) => district = value;

//   @action
//   void setNumber(String value) => number = value;

//   @action
//   void setComplement(String value) => complement = value;

//   @action
//   void setReferencePoint(String value) => referencePoint = value;

//   @action
//   void setOperation(String value) => operation = value;

//   @action
//   void setClient(String value) => client = value;

//   @action
//   void setCte(String value) => cte = value;

//   @action
//   void setNfe(String value) => nfe = value;

//   @action
//   void setShipping(String value) => shipping = value;

//   @action
//   void setLicensePlate(String value) => licensePlate = value;

//   @action
//   void setServiceTaker(String value) => serviceTaker = value;

//   @action
//   void setLocationLoad(String value) => locationLoad = value;

//   // ------------------------------------------------------------
//   @observable
//   KindWork? kindWork;

//   @observable
//   VehicleType? vehicleTypes;

//   @observable
//   String? totalWeight;

//   @observable
//   String? totalVolume;

//   @observable
//   String? qtyVolume;

//   @observable
//   LoadType? loadType;

//   @observable
//   LoadingType? loadingType;

//   @observable
//   DockType? dockType;

//   @observable
//   String? qtyWorkers;

//   @observable
//   String? worker;

//   @observable
//   String? qtyDownloadLocation;

//   @action
//   void setKindWork(KindWork? value) => kindWork = value;

//   @action
//   void setVehicleTypes(VehicleType? value) => vehicleTypes = value;

//   @action
//   void setTotalWeight(String value) => totalWeight = value;

//   @action
//   void setTotalVolume(String value) => totalVolume = value;

//   @action
//   void setQtyVolume(String value) => qtyVolume = value;

//   @action
//   void setLoadType(LoadType? value) => loadType = value;

//   @action
//   void setLoadingType(LoadingType? value) => loadingType = value;

//   @action
//   void setDockType(DockType? value) => dockType = value;

//   @action
//   void setWorker(String value) => worker = value;

//   @action
//   void setQtyWorkers(String value) => qtyWorkers = value;
//   @action
//   void setQtyDownloadLocation(String value) => qtyDownloadLocation = value;

//   @computed
//   bool get appointmentDateValid =>
//       appointmentDate != null && appointmentDate!.isNotEmpty;
//   String? get appointmentDateError {
//     if (!_showErrors || appointmentDateValid) {
//       return null;
//     } else {
//       return 'Data de Agendamento obrigatória';
//     }
//   }

//   @computed
//   bool get endDateValid => endDate != null && endDate!.isNotEmpty;
//   String? get endDateError {
//     if (!_showErrors || endDateValid) {
//       return null;
//     } else {
//       return 'Previsão de Termino obrigatória';
//     }
//   }

//   @computed
//   bool get zipValid => zip != null && zip!.length >= 10;
//   String? get zipError {
//     if (!_showErrors || zipValid) {
//       return null;
//     } else if (zip == null || zip!.isEmpty) {
//       return 'CEP Obrigatório';
//     } else {
//       return 'CEP muito curto';
//     }
//   }

//   @computed
//   bool get numberValid => number != null && number!.isNotEmpty;
//   String? get numberError {
//     if (!_showErrors || numberValid) {
//       return null;
//     } else {
//       return 'Número Obrigatório';
//     }
//   }

//   @computed
//   bool get kindWorkValid => kindWork != null;
//   String? get kindWorkError {
//     if (!_showErrors || kindWorkValid) {
//       return null;
//     } else {
//       return 'Tipo de Trabalho Obrigatório';
//     }
//   }

//   @computed
//   bool get vehicleTypesValid => vehicleTypes != null;
//   String? get vehicleTypesError {
//     if (!_showErrors || vehicleTypesValid) {
//       return null;
//     } else {
//       return 'Tipo de Veículo Obrigatório';
//     }
//   }

//   @computed
//   bool get totalWeightValid => totalWeight != null && totalWeight!.isNotEmpty;
//   String? get totalWeightError {
//     if (!_showErrors || totalWeightValid) {
//       return null;
//     } else {
//       return 'Peso total obrigatório';
//     }
//   }

//   @computed
//   bool get totalVolumeValid => totalVolume != null && totalVolume!.isNotEmpty;
//   String? get totalVolumeError {
//     if (!_showErrors || totalVolumeValid) {
//       return null;
//     } else {
//       return 'Volume Total obrigatório';
//     }
//   }

//   @computed
//   bool get qtyVolumeValid => qtyVolume != null && qtyVolume!.isNotEmpty;
//   String? get qtyVolumeError {
//     if (!_showErrors || qtyVolumeValid) {
//       return null;
//     } else {
//       return 'Quantidade de Volume/Caixas obrigatório';
//     }
//   }

//   @computed
//   bool get loadTypeValid => loadType != null;
//   String? get loadTypeError {
//     if (!_showErrors || loadTypeValid) {
//       return null;
//     } else {
//       return 'Tipo de Carga Obrigatória';
//     }
//   }

//   @computed
//   bool get loadingTypeValid => loadingType != null;
//   String? get loadingTypeError {
//     if (!_showErrors || loadingTypeValid) {
//       return null;
//     } else {
//       return 'Tipo de Carregamento Obrigatório';
//     }
//   }

//   @computed
//   bool get dockTypeValid => dockType != null;
//   String? get dockTypeError {
//     if (!_showErrors || dockTypeValid) {
//       return null;
//     } else {
//       return 'Tipo de Doca Obrigatória';
//     }
//   }

//   @computed
//   bool get qtyWorkersValid => qtyWorkers != null && qtyWorkers!.isNotEmpty;
//   String? get qtyWorkersError {
//     if (!_showErrors || qtyWorkersValid) {
//       return null;
//     } else {
//       return 'Quantidade de trabalhadores Obrigatório';
//     }
//   }

//   @computed
//   bool get workerValid => worker != null && worker!.isNotEmpty;
//   String? get workerError {
//     if (!_showErrors || workerValid) {
//       return null;
//     } else {
//       return 'Quantidade de trabalhadores Obrigatório';
//     }
//   }

//   @computed
//   bool get qtyDownloadLocationValid =>
//       qtyDownloadLocation != null && qtyDownloadLocation!.isNotEmpty;
//   String? get qtyDownloadLocationError {
//     if (!_showErrors || workerValid) {
//       return null;
//     } else {
//       return 'Quantidade de locais de descarga Obrigatório';
//     }
//   }

//   @action
//   void invalidSendPressed() => _showErrors = true;

//   @computed
//   bool get isFormValid =>
//       appointmentDateValid &&
//       endDateValid &&
//       zipValid &&
//       numberValid &&
//       kindWorkValid &&
//       vehicleTypesValid &&
//       totalWeightValid &&
//       totalVolumeValid &&
//       qtyVolumeValid &&
//       loadTypeValid &&
//       loadingTypeValid &&
//       dockTypeValid &&
//       qtyWorkersValid &&
//       workerValid &&
//       qtyDownloadLocationValid;

//   @computed
//   dynamic get sendPressed => isFormValid ? register : null;

//   @action
//   Future<void> searchZip(String zipFilter) async {
//     _status = TasksRegisterStateStatus.loading;
//     try {
//       final address = await ZipRepository().getAddressFromZip(zipFilter);
//       city = address!.cidade.nome;
//       state = address.estado.sigla;
//       street = address.logradouro;
//       district = address.bairro;
//       _status = TasksRegisterStateStatus.loaded;
//     } catch (e, s) {
//       log('Erro ao buscar cep', error: e, stackTrace: s);
//       _status = TasksRegisterStateStatus.error;
//     }
//   }

//   @action
//   Future<void> register() async {
//     _status = TasksRegisterStateStatus.loading;
//     try {
//       final task = TaskModel(
//         appointmentDate: appointmentDate!,
//         endDate: endDate!,
//         address: AddressModel(
//           zip: zip!,
//           city: city!,
//           state: state!,
//           street: street!,
//           district: district!,
//           number: number!,
//           complement: complement ?? '',
//           referencePoint: referencePoint ?? '',
//         ),
//         operation: operation,
//         client: client,
//         cte: cte,
//         nfe: nfe,
//         shipping: shipping,
//         licensePlate: licensePlate,
//         serviceTaker: serviceTaker,
//         locationLoad: locationLoad,
//         detailTask: DetailTaskModel(
//           kindWork: kindWork,
//           vehicleTypes: vehicleTypes,
//           totalWeight: totalWeight!,
//           totalVolume: totalVolume!,
//           qtyVolume: qtyVolume!,
//           loadType: loadType,
//           loadingType: loadingType,
//           dockType: dockType,
//           qtyWorkers: qtyWorkers!,
//           worker: worker!,
//           qtyDownloadLocation: qtyDownloadLocation!,
//         ),
//       );
//       await TaskService().save(task);
//       _status = TasksRegisterStateStatus.saved;
//     } catch (e, s) {
//       log('Erro ao registrar Tomadora', error: e, stackTrace: s);
//       _errorMessage = 'Erro ao registrar Tomadora';
//       _status = TasksRegisterStateStatus.error;
//     }
//   }
// }
