import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import '../../models/worker_model.dart';
import 'worker_service.dart';

const String userCollection = 'users';

class WorkerServiceImpl implements WorkerService {
  @override
  Future<void> saveWorker(WorkerModel data) async {
    final store = FirebaseFirestore.instance;
    final docRef = store.collection(userCollection).doc(data.user);
    late String? birthdate;
    String? emissionDate = '';
    try {
      birthdate = DateFormat('yyyy-MM-dd')
          .format(DateFormat('dd/MM/yyyy').parse(data.personal.birthdate));
    } on FormatException {
      birthdate = data.personal.birthdate;
    }

    if (data.documents.dataEmissao != null) {
      try {
        emissionDate = DateFormat('yyyy-MM-dd').format(
          DateFormat('dd/MM/yyyy').parse(data.documents.dataEmissao!),
        );
      } on FormatException {
        emissionDate = data.documents.dataEmissao!;
      }
    }

    data = data.copyWith(
      personal: data.personal.copyWith(
        birthdate: birthdate,
      ),
      documents: data.documents.copyWith(
        dataEmissao: emissionDate,
      ),
    );

    docRef.set(data.toMap());
    store.collection('login').doc(data.user).set({
      'user': data.user,
      'password': data.password,
      'profileType': data.profileType,
      'active': data.active,
      'displayName': '${data.name} ${data.lastname}',
    });
  }

  @override
  Future<void> workerUpdate(WorkerModel data) async {
    final store = FirebaseFirestore.instance;
    final docRef = store.collection(userCollection).doc(data.user);
    late String? birthdate;
    String? emissionDate = '';

    try {
      birthdate = DateFormat('yyyy-MM-dd')
          .format(DateFormat('dd/MM/yyyy').parse(data.personal.birthdate));
    } on FormatException {
      birthdate = data.personal.birthdate;
    }

    if (data.documents.dataEmissao != null) {
      try {
        emissionDate = DateFormat('yyyy-MM-dd').format(
          DateFormat('dd/MM/yyyy').parse(data.documents.dataEmissao!),
        );
      } on FormatException {
        emissionDate = data.documents.dataEmissao!;
      }
    }

    data = data.copyWith(
      personal: data.personal.copyWith(
        birthdate: birthdate,
        phone: data.personal.phone?.replaceAll(RegExp(r'[^0-9]'), ''),
      ),
      documents: data.documents.copyWith(
        dataEmissao: emissionDate,
      ),
    );

    docRef.update(data.toMap());
  }

  @override
  Future<List<WorkerModel>> getAllWorkers() async {
    final collectionRef = FirebaseFirestore.instance.collection(userCollection);
    final QuerySnapshot querySnapshot = await collectionRef.get();
    final workerList = <WorkerModel>[];
    for (var doc in querySnapshot.docs) {
      final map = doc.data() as Map<String, dynamic>;
      if (map['profileType'] == 0) {
        workerList.add(WorkerModel.fromMap(map));
      }
    }
    return workerList;
  }

  @override
  Future<void> delete(String id) async {
    final userRef = FirebaseFirestore.instance.collection(userCollection);
    await userRef.doc(id).delete();
  }
}
