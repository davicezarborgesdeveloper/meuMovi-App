import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import '../../models/worker_model.dart';
import 'worker_service.dart';

const String userCollection = 'users';

class WorkerServiceImpl implements WorkerService {
  @override
  Future<void> saveWorker(WorkerModel user) async {
    final store = FirebaseFirestore.instance;
    final docRef = store.collection(userCollection).doc(user.user);
    user = user.copyWith(
      personal: user.personal.copyWith(
        birthdate: DateFormat('yyyy-MM-dd')
            .format(DateFormat('dd/MM/yyyy').parse(user.personal.birthdate)),
      ),
      documents: user.documents.copyWith(
        dataEmissao: user.documents.dataEmissao != null
            ? DateFormat('yyyy-MM-dd').format(
                DateFormat('dd/MM/yyyy').parse(user.documents.dataEmissao!),
              )
            : null,
      ),
    );

    docRef.set(user.toMap());
    store.collection('login').doc(user.user).set({
      'user': user.user,
      'password': user.password,
      'profileType': user.profileType,
      'active': user.active,
      'displayName': '${user.name} ${user.lastname}',
    });
  }

  @override
  Future<void> workerUpdate(WorkerModel data) async {
    final store = FirebaseFirestore.instance;
    final docRef = store.collection(userCollection).doc(data.user);
    late String? birthdate;
    late String? emissionDate;

    try {
      birthdate = DateFormat('yyyy-MM-dd')
          .format(DateFormat('dd/MM/yyyy').parse(data.personal.birthdate));
    } on FormatException {
      birthdate = DateFormat('yyyy-MM-dd')
          .format(DateFormat('dd/MM/yyyy').parse(data.personal.birthdate));
      birthdate = data.documents.dataEmissao!;
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
