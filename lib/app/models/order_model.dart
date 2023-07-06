import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class OrderModel {
  int id;
  String task;
  int statusPayment;
  double amountReceivable;
  String date;
  int statusTask;
  OrderModel({
    required this.id,
    required this.task,
    required this.statusPayment,
    required this.amountReceivable,
    required this.date,
    required this.statusTask,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'task': task,
      'statusPayment': statusPayment,
      'amountReceivable': amountReceivable,
      'date': date,
      'statusTask': statusTask,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: (map['id'] ?? 0) as int,
      task: (map['task'] ?? '') as String,
      statusPayment: (map['statusPayment'] ?? 0) as int,
      amountReceivable: (map['amountReceivable'] ?? 0.0) as double,
      date: (map['date'] ?? '') as String,
      statusTask: (map['statusTask'] ?? 0) as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) =>
      OrderModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
