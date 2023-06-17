// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:meu_movi/app/models/service_taker_model.dart';

import '../core/ui/helpers/enums.dart';

class TaskModel {
  final String code;
  final String descriptionService;
  // final ServiceTakerModel serviceTaker;
  final String companyId;
  final String companyName;
  final String idCostCenter;
  final String descCostCenter;
  final String extraPercentage;
  final ProductionType? productionType;
  final ReportType? reportType;
  final bool calculateNightTime;
  final String? hourDays;
  final String valuePayroll;
  final String invoiceAmount;
  final String valueInvoice;
  TaskModel({
    required this.code,
    required this.descriptionService,
    // required this.serviceTaker,
    required this.companyId,
    required this.companyName,
    required this.idCostCenter,
    required this.descCostCenter,
    required this.extraPercentage,
    required this.productionType,
    required this.reportType,
    required this.calculateNightTime,
    this.hourDays,
    required this.valuePayroll,
    required this.invoiceAmount,
    required this.valueInvoice,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'descriptionService': descriptionService,
      // 'serviceTaker': serviceTaker.toMap(),
      'companyId': companyId,
      'companyName': companyName,
      'idCostCenter': idCostCenter,
      'descCostCenter': descCostCenter,
      'extraPercentage': extraPercentage,
      'productionType': productionType?.acronym,
      'reportType': reportType?.acronym,
      'calculateNightTime': calculateNightTime,
      'hourDays': hourDays,
      'valuePayroll': valuePayroll,
      'invoiceAmount': invoiceAmount,
      'valueInvoice': valueInvoice,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      code: (map['code'] ?? '') as String,
      descriptionService: (map['descriptionService'] ?? '') as String,
      companyId: (map['companyId'] ?? '') as String,
      companyName: (map['companyName'] ?? '') as String,

      // serviceTaker: ServiceTakerModel.fromMap(
      //     map['serviceTaker'] as Map<String, dynamic>),
      idCostCenter: (map['idCostCenter'] ?? '') as String,
      descCostCenter: (map['descCostCenter'] ?? '') as String,
      extraPercentage: (map['extraPercentage'] ?? '') as String,
      productionType: map['productionType'] != null
          ? ProductionType.parse(map['productionType'])
          : null,
      reportType: map['reportType'] != null
          ? ReportType.parse(map['reportType'])
          : null,
      calculateNightTime: (map['calculateNightTime'] ?? false) as bool,
      hourDays: map['hourDays'] != null ? map['hourDays'] as String : null,
      valuePayroll: (map['valuePayroll'] ?? '') as String,
      invoiceAmount: (map['invoiceAmount'] ?? '') as String,
      valueInvoice: (map['valueInvoice'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskModel.fromJson(String source) =>
      TaskModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
