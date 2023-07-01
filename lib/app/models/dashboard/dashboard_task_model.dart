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
