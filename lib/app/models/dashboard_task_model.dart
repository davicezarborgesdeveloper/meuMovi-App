// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'task_model.dart';

class DashboardTaskModel {
  final DashboardList? opened;
  final DashboardList? inAnalysis;
  final DashboardList? waitStart;
  final DashboardList? available;
  final DashboardList? confirmed;
  final DashboardList? inProgress;
  final DashboardList? finished;
  DashboardTaskModel({
    this.opened,
    this.inAnalysis,
    this.waitStart,
    this.available,
    this.confirmed,
    this.inProgress,
    this.finished,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'opened': opened?.toMap(),
      'inAnalysis': inAnalysis?.toMap(),
      'waitStart': waitStart?.toMap(),
      'available': available?.toMap(),
      'confirmed': confirmed?.toMap(),
      'inProgress': inProgress?.toMap(),
      'finished': finished?.toMap(),
    };
  }

  factory DashboardTaskModel.fromMap(Map<String, dynamic> map) {
    return DashboardTaskModel(
      opened: map['opened'] != null
          ? DashboardList.fromMap(map['opened'] as Map<String, dynamic>)
          : null,
      inAnalysis: map['inAnalysis'] != null
          ? DashboardList.fromMap(map['inAnalysis'] as Map<String, dynamic>)
          : null,
      waitStart: map['waitStart'] != null
          ? DashboardList.fromMap(map['waitStart'] as Map<String, dynamic>)
          : null,
      available: map['available'] != null
          ? DashboardList.fromMap(map['available'] as Map<String, dynamic>)
          : null,
      confirmed: map['confirmed'] != null
          ? DashboardList.fromMap(map['confirmed'] as Map<String, dynamic>)
          : null,
      inProgress: map['inProgress'] != null
          ? DashboardList.fromMap(map['inProgress'] as Map<String, dynamic>)
          : null,
      finished: map['finished'] != null
          ? DashboardList.fromMap(map['finished'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DashboardTaskModel.fromJson(String source) =>
      DashboardTaskModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DashboardTaskModel(opened: $opened, inAnalysis: $inAnalysis, waitStart: $waitStart, available: $available, confirmed: $confirmed, inProgress: $inProgress, finished: $finished)';
  }
}

class DashboardList {
  final List<TaskModel>? items;
  double? amount;
  DashboardList({
    this.items,
    this.amount = 0.0,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'list': items!.map((x) => x.toMap()).toList(),
      'amount': amount,
    };
  }

  factory DashboardList.fromMap(Map<String, dynamic> map) {
    return DashboardList(
      items: map['items'] != null
          ? List<TaskModel>.from(
              (map['items']).map<TaskModel>(
                (x) => TaskModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      amount: map['amount'] != null ? (map['amount']).toDouble() : 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory DashboardList.fromJson(String source) =>
      DashboardList.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'DashboardList(list: $items, amount: $amount)';
}
