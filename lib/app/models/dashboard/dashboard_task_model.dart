// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../task_model.dart';

class DashboardTaskModel {
  final List<TaskModel> opened;
  final List<TaskModel> confirmed;
  final List<TaskModel> inProgress;
  final List<TaskModel> finished;
  DashboardTaskModel({
    required this.opened,
    required this.confirmed,
    required this.inProgress,
    required this.finished,
  });
}
