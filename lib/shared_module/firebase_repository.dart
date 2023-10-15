import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../models/diary_model.dart';
import 'auth_service.dart';

class FirebaseRepository {
  static final FirebaseRepository instance = FirebaseRepository._init();

  static final FirebaseFirestore _database = FirebaseFirestore.instance;

  FirebaseRepository._init();

  Future<void> addNewUser(
    String? userId,
    String name,
  ) async {
    if (userId != null) {
      await _database.collection('users').doc(userId).set({"name": name});
    }
  }

  Future<void> uploadAllDiary(List<Diary> allDiary) async {
    String? uid = Get.find<FirebaseAuthService>().user.value?.uid;

    if (uid != null) {
      WriteBatch batch = _database.batch();
      for (Diary diary in allDiary) {
        batch.set(
            _database
                .collection('users')
                .doc(uid)
                .collection('diaries')
                .doc(diary.date.microsecondsSinceEpoch.toString()),
            diary.toJson()..['uploaded'] = 1,
            SetOptions(merge: true));
      }
      await batch.commit();
    }
  }

  Future<List<Diary>> downloadAllDiary() async {
    List<Diary>  allDiary=[];
    String? uid = Get.find<FirebaseAuthService>().user.value?.uid;

    if (uid != null) {
      final snapshot = await _database .collection('users')
        .doc(uid)
        .collection('diaries').get();
      return snapshot.docs.map((e){
        try{
          return  Diary.fromJson(e.data());
        }catch(e){
          if(kDebugMode)print('fromJson error : $e');
        }
      }).whereType<Diary>().toList();
    }
    return allDiary;
  }

  Future<void> deleteDiary(String id) async {
    String? uid = Get.find<FirebaseAuthService>().user.value?.uid;
    if (uid != null) {
      await _database
          .collection('users')
          .doc(uid)
          .collection('diaries')
          .doc(id)
          .delete();
    }
  }
}
