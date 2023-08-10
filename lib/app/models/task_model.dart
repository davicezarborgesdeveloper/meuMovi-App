// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../core/ui/helpers/enums.dart';

class TaskModel {
  final String? code;
  final String descriptionService;
  final String? descCostCenter;
  final String extraPercentage;
  final ServTakerModel? servTaker;
  final ProductionType? productionType;
  final String? syndicate;
  final ReportType? reportType;
  final String? hourDays;
  final double? hourUnitary;
  final double? valuePayroll;
  final double invoiceAmount;
  final double? valueInvoice;
  final int? quantity;
  final double? unitaryValue;
  final double? totalValueTask;
  final int status;
  final int access;
  TaskModel({
    this.code,
    required this.descriptionService,
    this.descCostCenter,
    required this.extraPercentage,
    this.servTaker,
    this.productionType,
    this.syndicate,
    this.reportType,
    this.hourDays,
    this.hourUnitary,
    this.valuePayroll,
    required this.invoiceAmount,
    this.valueInvoice,
    this.quantity,
    this.unitaryValue,
    this.totalValueTask,
    required this.status,
    required this.access,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': code,
      'descriptionService': descriptionService,
      'descCostCenter': descCostCenter,
      'extraPercentage': extraPercentage,
      'serviceTaker': servTaker?.toMap(),
      'productionType': productionType?.acronym,
      'syndicate': syndicate,
      'reportType': reportType?.acronym,
      'hourDays': hourDays,
      'hourUnitary': hourUnitary,
      'valuePayroll': valuePayroll,
      'invoiceAmount': invoiceAmount,
      'valueInvoice': valueInvoice,
      'quantity': quantity,
      'unitaryValue': unitaryValue,
      'totalValueTask': totalValueTask,
      'status': status,
      'access': access,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      // code: map['id'] != null ? map['id'] as String : null,
      //
      code: map['id'] != null ? (map['id']).toString() : null,
      descriptionService: (map['descriptionService'] ?? '') as String,
      descCostCenter: map['descCostCenter'] != null
          ? map['descCostCenter'] as String
          : null,
      extraPercentage: map['extraPercentage'] != null
          ? (map['extraPercentage']).toString()
          : '0.0',
      servTaker: map['serviceTaker'] != null
          ? ServTakerModel.fromMap(
              map['serviceTaker'] as Map<String, dynamic>,
            )
          : null,
      syndicate:
          map['syndicate'] != null ? map['syndicate']['code'] as String : null,
      productionType: map['productionType'] != null
          ? ProductionType.parse(map['productionType'])
          : null,
      reportType: map['reportType'] != null
          ? ReportType.parse(map['reportType'])
          : null,
      hourDays: map['hourDays'] != null ? (map['hourDays']).toString() : null,
      valuePayroll:
          map['valuePayroll'] != null ? (map['valuePayroll']).toDouble() : 0.0,
      invoiceAmount: map['invoiceAmount'] != null
          ? (map['invoiceAmount']).toDouble()
          : 0.0,
      valueInvoice:
          map['valueInvoice'] != null ? (map['valueInvoice']).toDouble() : 0.0,
      quantity: (map['quantity'] ?? 0) as int,
      unitaryValue:
          map['unitaryValue'] != null ? (map['unitaryValue']).toDouble() : 0.0,
      hourUnitary:
          map['hourUnitary'] != null ? (map['hourUnitary']).toDouble() : 0.0,
      totalValueTask: map['totalValueTask'] != null
          ? (map['totalValueTask']).toDouble()
          : 0.0,
      status: (map['status'] ?? 0) as int,
      access: (map['access'] ?? 0) as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskModel.fromJson(String source) =>
      TaskModel.fromMap(json.decode(source) as Map<String, dynamic>);

  TaskModel copyWith({
    String? code,
    String? descriptionService,
    String? descCostCenter,
    String? extraPercentage,
    ServTakerModel? servTaker,
    ProductionType? productionType,
    String? syndicate,
    ReportType? reportType,
    bool? calculateNightTime,
    String? hourDays,
    double? valuePayroll,
    double? invoiceAmount,
    double? valueInvoice,
    int? quantity,
    double? unitaryValue,
    double? hourUnitary,
    double? totalValueTask,
    int? status,
    int? access,
  }) {
    return TaskModel(
      code: code ?? this.code,
      descriptionService: descriptionService ?? this.descriptionService,
      descCostCenter: descCostCenter ?? this.descCostCenter,
      extraPercentage: extraPercentage ?? this.extraPercentage,
      servTaker: servTaker ?? this.servTaker,
      productionType: productionType ?? this.productionType,
      syndicate: syndicate ?? this.syndicate,
      reportType: reportType ?? this.reportType,
      hourDays: hourDays ?? this.hourDays,
      valuePayroll: valuePayroll ?? this.valuePayroll,
      invoiceAmount: invoiceAmount ?? this.invoiceAmount,
      valueInvoice: valueInvoice ?? this.valueInvoice,
      quantity: quantity ?? this.quantity,
      unitaryValue: unitaryValue ?? this.unitaryValue,
      hourUnitary: hourUnitary ?? this.hourUnitary,
      totalValueTask: totalValueTask ?? this.totalValueTask,
      status: status ?? this.status,
      access: access ?? this.access,
    );
  }

  @override
  String toString() {
    return 'TaskModel(code: $code, descriptionService: $descriptionService, descCostCenter: $descCostCenter, extraPercentage: $extraPercentage, servTaker: $servTaker, productionType: $productionType, syndicate: $syndicate, reportType: $reportType, hourDays: $hourDays, hourUnitary: $hourUnitary, valuePayroll: $valuePayroll, invoiceAmount: $invoiceAmount, valueInvoice: $valueInvoice, quantity: $quantity, unitaryValue: $unitaryValue, totalValueTask: $totalValueTask, status: $status, access: $access)';
  }
}

class ServTakerModel {
  final String code;
  final String name;
  ServTakerModel({
    required this.code,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'name': name,
    };
  }

  factory ServTakerModel.fromMap(Map<String, dynamic> map) {
    return ServTakerModel(
      code: (map['code'] ?? '') as String,
      name: (map['name'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ServTakerModel.fromJson(String source) =>
      ServTakerModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ServTakerModel(code: $code, name: $name)';
}
