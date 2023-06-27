// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:meu_movi/app/models/worker_model.dart';

import '../core/ui/helpers/enums.dart';

class TaskModel {
  final String? code;
  final String descriptionService;
  final String? descCostCenter;
  final String extraPercentage;
  final EmployeerModel? employeer;
  final ProductionType? productionType;
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
    this.hourDays,
    this.employeer,
    required this.valuePayroll,
    required this.invoiceAmount,
    required this.valueInvoice,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'descriptionService': descriptionService,
      'employeer': employeer?.toMap(),
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
      employeer: map['employeer'] != null
          ? EmployeerModel.fromMap(map['employeer'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskModel.fromJson(String source) =>
      TaskModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TaskModel(code: $code, descriptionService: $descriptionService, descCostCenter: $descCostCenter, extraPercentage: $extraPercentage, productionType: $productionType, reportType: $reportType, calculateNightTime: $calculateNightTime, hourDays: $hourDays, valuePayroll: $valuePayroll, invoiceAmount: $invoiceAmount, valueInvoice: $valueInvoice)';
  }

  TaskModel copyWith({
    String? code,
    String? descriptionService,
    String? companyId,
    String? companyName,
    String? idCostCenter,
    String? descCostCenter,
    String? extraPercentage,
    ProductionType? productionType,
    ReportType? reportType,
    bool? calculateNightTime,
    String? hourDays,
    double? valuePayroll,
    double? invoiceAmount,
    double? valueInvoice,
    EmployeerModel? employeer,
  }) {
    return TaskModel(
      code: code ?? this.code,
      descriptionService: descriptionService ?? this.descriptionService,
      descCostCenter: descCostCenter ?? this.descCostCenter,
      extraPercentage: extraPercentage ?? this.extraPercentage,
      productionType: productionType ?? this.productionType,
      reportType: reportType ?? this.reportType,
      calculateNightTime: calculateNightTime ?? this.calculateNightTime,
      hourDays: hourDays ?? this.hourDays,
      valuePayroll: valuePayroll ?? this.valuePayroll,
      invoiceAmount: invoiceAmount ?? this.invoiceAmount,
      valueInvoice: valueInvoice ?? this.valueInvoice,
      employeer: employeer ?? this.employeer,
    );
  }
}
