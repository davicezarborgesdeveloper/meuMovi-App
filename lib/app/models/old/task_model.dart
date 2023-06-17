// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

// import '../../core/ui/helpers/enums.dart';
// import '../address_model.dart';

// class TaskModel {
//   final String appointmentDate;
//   final String endDate;
//   final AddressModel address;
//   final String? operation;
//   final String? client;
//   final String? cte;
//   final String? nfe;
//   final String? shipping;
//   final String? licensePlate;
//   final String? serviceTaker;
//   final String? locationLoad;
//   final DetailTaskModel? detailTask;
//   TaskModel({
//     required this.appointmentDate,
//     required this.endDate,
//     required this.address,
//     this.operation,
//     this.client,
//     this.cte,
//     this.nfe,
//     this.shipping,
//     this.licensePlate,
//     this.serviceTaker,
//     this.locationLoad,
//     this.detailTask,
//   });

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'appointmentDate': appointmentDate,
//       'endDate': endDate,
//       'address': address.toMap(),
//       'operation': operation,
//       'client': client,
//       'cte': cte,
//       'nfe': nfe,
//       'shipping': shipping,
//       'licensePlate': licensePlate,
//       'serviceTaker': serviceTaker,
//       'locationLoad': locationLoad,
//       // 'detailTask': detailTask?.toMap(),
//     };
//   }

//   factory TaskModel.fromMap(Map<String, dynamic> map) {
//     return TaskModel(
//       appointmentDate: (map['appointmentDate'] ?? '') as String,
//       endDate: (map['endDate'] ?? '') as String,
//       address: AddressModel.fromMap(map['address'] as Map<String, dynamic>),
//       operation: map['operation'] != null ? map['operation'] as String : null,
//       client: map['client'] != null ? map['client'] as String : null,
//       cte: map['cte'] != null ? map['cte'] as String : null,
//       nfe: map['nfe'] != null ? map['nfe'] as String : null,
//       shipping: map['shipping'] != null ? map['shipping'] as String : null,
//       licensePlate:
//           map['licensePlate'] != null ? map['licensePlate'] as String : null,
//       serviceTaker:
//           map['serviceTaker'] != null ? map['serviceTaker'] as String : null,
//       locationLoad:
//           map['locationLoad'] != null ? map['locationLoad'] as String : null,
//       // detailTask: map['detailTask'] != null
//       //     ? DetailTaskModel.fromMap(map['detailTask'] as Map<String, dynamic>)
//       //     : null,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory TaskModel.fromJson(String source) =>
//       TaskModel.fromMap(json.decode(source) as Map<String, dynamic>);
// }

// class DetailTaskModel {
//   final KindWork? kindWork;
//   final VehicleType? vehicleTypes;
//   final String totalWeight;
//   final String totalVolume;
//   final String qtyVolume;
//   final LoadType? loadType;
//   final LoadingType? loadingType;
//   final DockType? dockType;
//   final String qtyWorkers;
//   final String worker;
//   final String qtyDownloadLocation;
//   DetailTaskModel({
//     this.kindWork,
//     this.vehicleTypes,
//     required this.totalWeight,
//     required this.totalVolume,
//     required this.qtyVolume,
//     this.loadType,
//     this.loadingType,
//     this.dockType,
//     required this.qtyWorkers,
//     required this.worker,
//     required this.qtyDownloadLocation,
//   });

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'kindWork': kindWork?.acronym,
//       'vehicleTypes': vehicleTypes?.acronym,
//       'totalWeight': totalWeight,
//       'totalVolume': totalVolume,
//       'qtyVolume': qtyVolume,
//       'loadType': loadType?.acronym,
//       'loadingType': loadingType?.acronym,
//       'dockType': dockType?.acronym,
//       'qtyWorkers': qtyWorkers,
//       'worker': worker,
//       'qtyDownloadLocation': qtyDownloadLocation,
//     };
//   }

//   factory DetailTaskModel.fromMap(Map<String, dynamic> map) {
//     return DetailTaskModel(
//       kindWork:
//           map['kindWork'] != null ? KindWork.parse(map['kindWork']) : null,
//       vehicleTypes: map['vehicleTypes'] != null
//           ? VehicleType.parse(map['vehicleTypes'])
//           : null,
//       totalWeight: (map['totalWeight'] ?? '') as String,
//       totalVolume: (map['totalVolume'] ?? '') as String,
//       qtyVolume: (map['qtyVolume'] ?? '') as String,
//       loadType:
//           map['loadType'] != null ? LoadType.parse(map['loadType']) : null,
//       loadingType: map['loadingType'] != null
//           ? LoadingType.parse(map['loadingType'])
//           : null,
//       dockType:
//           map['dockType'] != null ? DockType.parse(map['dockType']) : null,
//       qtyWorkers: (map['qtyWorkers'] ?? '') as String,
//       worker: (map['worker'] ?? '') as String,
//       qtyDownloadLocation: (map['qtyDownloadLocation'] ?? '') as String,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory DetailTaskModel.fromJson(String source) =>
//       DetailTaskModel.fromMap(json.decode(source) as Map<String, dynamic>);
// }
