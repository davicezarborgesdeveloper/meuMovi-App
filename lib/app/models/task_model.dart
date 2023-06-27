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
  final bool calculateNightTime;
  final String? hourDays;
  final double valuePayroll;
  final double invoiceAmount;
  final double valueInvoice;
  TaskModel({
    this.code,
    required this.descriptionService,
    required this.descCostCenter,
    required this.extraPercentage,
    required this.productionType,
    required this.reportType,
    required this.calculateNightTime,
    this.syndicate,
    this.hourDays,
    this.servTaker,
    required this.valuePayroll,
    required this.invoiceAmount,
    required this.valueInvoice,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'descriptionService': descriptionService,
      'servTaker': servTaker?.toMap(),
      'descCostCenter': descCostCenter,
      'extraPercentage': extraPercentage,
      'productionType': productionType?.acronym,
      'reportType': reportType?.acronym,
      'calculateNightTime': calculateNightTime,
      'hourDays': hourDays,
      'valuePayroll': valuePayroll,
      'invoiceAmount': invoiceAmount,
      'valueInvoice': valueInvoice,
      'syndicate': syndicate,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      code: (map['code'] ?? '') as String,
      descriptionService: (map['descriptionService'] ?? '') as String,
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
      valuePayroll: map['valuePayroll'] != null
          ? map['valuePayroll'] is int
              ? (map['valuePayroll'] as int).toDouble()
              : map['valuePayroll'] as double
          : 0.00,
      invoiceAmount: map['invoiceAmount'] != null
          ? map['invoiceAmount'] is int
              ? (map['invoiceAmount'] as int).toDouble()
              : map['invoiceAmount'] as double
          : 0.00,
      valueInvoice: map['valueInvoice'] != null
          ? map['valueInvoice'] is int
              ? (map['valueInvoice'] as int).toDouble()
              : map['valueInvoice'] as double
          : 0.00,
      servTaker: map['servTaker'] != null
          ? ServTakerModel.fromMap(map['servTaker'] as Map<String, dynamic>)
          : null,
      syndicate: map['syndicate'] != null ? map['syndicate'] as String : null,
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
      calculateNightTime: calculateNightTime ?? this.calculateNightTime,
      hourDays: hourDays ?? this.hourDays,
      valuePayroll: valuePayroll ?? this.valuePayroll,
      invoiceAmount: invoiceAmount ?? this.invoiceAmount,
      valueInvoice: valueInvoice ?? this.valueInvoice,
    );
  }

  @override
  String toString() {
    return 'TaskModel(code: $code, descriptionService: $descriptionService, descCostCenter: $descCostCenter, extraPercentage: $extraPercentage, servTaker: $servTaker, productionType: $productionType, syndicate: $syndicate, reportType: $reportType, calculateNightTime: $calculateNightTime, hourDays: $hourDays, valuePayroll: $valuePayroll, invoiceAmount: $invoiceAmount, valueInvoice: $valueInvoice)';
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
}
