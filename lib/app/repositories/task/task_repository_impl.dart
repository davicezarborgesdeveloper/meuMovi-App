import 'dart:developer';

import 'package:dio/dio.dart';

import '../../core/exceptions/repository_exception.dart';
import '../../core/rest_client/custom_dio.dart';
import '../../models/dashboard_task_model.dart';
import '../../models/task_model.dart';
import 'task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final CustomDio _dio;
  TaskRepositoryImpl(this._dio);

  @override
  Future<DashboardTaskModel?> getTasksServiceTaker(
    String? serviceTakerId,
  ) async {
    try {
      final result = await _dio.auth().get('task/t/$serviceTakerId');
      return DashboardTaskModel.fromMap(result.data);
    } on DioException catch (e, s) {
      log(
        'Erro ao realizar carregar tarefas',
        error: e,
        stackTrace: s,
      );
      throw RepositoryException(
        message: 'Erro ao realizar carregar tarefas',
      );
    }
  }

  @override
  Future<DashboardTaskModel?> getTasksSyndicate(String? serviceTakerId) async {
    try {
      final result = await _dio.auth().get('task/s/$serviceTakerId');
      return DashboardTaskModel.fromMap(result.data);
    } on DioException catch (e, s) {
      log(
        'Erro ao realizar carregar tarefas',
        error: e,
        stackTrace: s,
      );
      throw RepositoryException(
        message: 'Erro ao realizar carregar tarefas',
      );
    }
  }

  @override
  Future<DashboardTaskModel?> getTasksWorker(String? serviceTakerId) async {
    try {
      final result = await _dio.auth().get('task/w/$serviceTakerId');
      return DashboardTaskModel.fromMap(result.data);
    } on DioException catch (e, s) {
      log(
        'Erro ao realizar carregar tarefas',
        error: e,
        stackTrace: s,
      );
      throw RepositoryException(
        message: 'Erro ao realizar carregar tarefas',
      );
    }
  }

  @override
  Future<void> sendToSyndicate(String taskCode) async {
    try {
      await _dio.auth().patch(
        'task',
        data: {'idTask': taskCode, 'access': 2, 'status': 1},
      );
    } on DioException catch (e, s) {
      log(
        'Erro ao enviar tarefa para o sindicato',
        error: e,
        stackTrace: s,
      );
      throw RepositoryException(
        message: 'Erro ao enviar tarefa para o sindicato',
      );
    }
  }

  @override
  Future<void> sendToWorker(String taskCode) async {
    try {
      await _dio.auth().patch(
        'task',
        data: {'idTask': taskCode, 'access': 3, 'status': 2},
      );
    } on DioException catch (e, s) {
      log(
        'Erro ao enviar tarefa para o sindicato',
        error: e,
        stackTrace: s,
      );
      throw RepositoryException(
        message: 'Erro ao enviar tarefa para o sindicato',
      );
    }
  }

  @override
  Future<void> delete(String taskCode) async {
    try {
      await _dio.auth().delete(
            'task/$taskCode',
          );
    } on DioException catch (e, s) {
      log(
        'Erro ao apagar tarefa!',
        error: e,
        stackTrace: s,
      );
      throw RepositoryException(
        message: 'Erro ao apagar tarefa!',
      );
    }
  }

  @override
  Future<void> save(TaskModel model) async {
    try {
      await _dio.auth().post('task', data: model.toJson());
    } on DioException catch (e, s) {
      log('Erro ao registrar trabalhador', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao registrar trabalhador');
    }
  }

  @override
  Future<void> update(TaskModel model) async {
    try {
      await _dio.auth().put('task', data: model.toJson());
    } on DioException catch (e, s) {
      log('Erro ao registrar trabalhador', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao registrar trabalhador');
    }
  }
}
