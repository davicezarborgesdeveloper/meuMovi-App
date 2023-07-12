// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../task_model.dart';

class DashboardTaskModel {
  final List<TaskModel>? opened;
  final List<TaskModel>? inAnalysis;
  final List<TaskModel>? waitStart;
  final List<TaskModel>? available;
  final List<TaskModel>? confirmed;
  final List<TaskModel> inProgress;
  final List<TaskModel> finished;

  DashboardTaskModel({
    this.opened,
    this.inAnalysis,
    this.waitStart,
    this.available,
    this.confirmed,
    required this.inProgress,
    required this.finished,
  });
}

class DashboardTaskModell {
  final DashboardList? opened;
  final DashboardList? inAnalysis;
  final DashboardList? waitStart;
  final DashboardList? available;
  final DashboardList? confirmed;
  final DashboardList inProgress;
  final DashboardList finished;

  DashboardTaskModell({
    this.opened,
    this.inAnalysis,
    this.waitStart,
    this.available,
    this.confirmed,
    required this.inProgress,
    required this.finished,
  });
}

class DashboardList {
  final List<TaskModel>? list;
  double? amountValue;
  DashboardList({
    this.list,
    this.amountValue = 0.0,
  });
}
