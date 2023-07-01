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
  final double? valueInvoice;
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
    required this.calculateNightTime,
    this.hourDays,
    required this.valuePayroll,
    required this.invoiceAmount,
    this.valueInvoice,
    required this.status,
    required this.access,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'descriptionService': descriptionService,
      'descCostCenter': descCostCenter,
      'extraPercentage': extraPercentage,
      'servTaker': servTaker?.toMap(),
      'productionType': productionType?.acronym,
      'syndicate': syndicate,
      'reportType': reportType?.acronym,
      'calculateNightTime': calculateNightTime,
      'hourDays': hourDays,
      'valuePayroll': valuePayroll,
      'invoiceAmount': invoiceAmount,
      'valueInvoice': valueInvoice,
      'status': status,
      'access': access,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      code: map['code'] != null ? map['code'] as String : null,
      descriptionService: (map['descriptionService'] ?? '') as String,
      descCostCenter: map['descCostCenter'] != null
          ? map['descCostCenter'] as String
          : null,
      extraPercentage: (map['extraPercentage'] ?? '') as String,
      servTaker: map['servTaker'] != null
          ? ServTakerModel.fromMap(map['servTaker'] as Map<String, dynamic>)
          : null,
      syndicate: map['syndicate'] != null ? map['syndicate'] as String : null,
      productionType: map['productionType'] != null
          ? ProductionType.parse(map['productionType'])
          : null,
      reportType: map['reportType'] != null
          ? ReportType.parse(map['reportType'])
          : null,
      calculateNightTime: (map['calculateNightTime'] ?? false) as bool,
      hourDays: map['hourDays'] != null ? map['hourDays'] as String : null,
      valuePayroll: (map['valuePayroll'] ?? 0.0) as double,
      invoiceAmount: (map['invoiceAmount'] ?? 0.0) as double,
      valueInvoice: (map['valueInvoice'] ?? 0.0) as double,
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
      calculateNightTime: calculateNightTime ?? this.calculateNightTime,
      hourDays: hourDays ?? this.hourDays,
      valuePayroll: valuePayroll ?? this.valuePayroll,
      invoiceAmount: invoiceAmount ?? this.invoiceAmount,
      valueInvoice: valueInvoice ?? this.valueInvoice,
      status: status ?? this.status,
      access: access ?? this.access,
    );
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
