import 'dart:math';

import 'package:projeto_flutter/domain/entities/studant_info_entity.dart';
import 'package:projeto_flutter/errors/errors_classes.dart';
import 'package:projeto_flutter/errors/errors_messagens.dart';
import 'student_fake_factory.dart';

class StudentFakeApiDataBase {
  // late List<Pet> pets;
  StudentInfoEntity? student;
  StudentFakeApiDataBase() {
    if (Random().nextBool()) {
      student = StudenteFakeFactory.factory();
    }
  }

  Future<String> getData() async {
    if (Random().nextBool()) {
      return throw APIFailure(MessagesError.apiError);
    }

    return student == null
        ? throw DatasourceResultEmpty(MessagesError.emptySharedP)
        : student!.toJson();
  }

  Future<bool> updateData(String studentJson) async {
    try {
      student = StudentInfoEntity.fromJson(studentJson);
      return true;
    } catch (e) {
      throw APIFailureOnSave('erro ao salvar: ${e.toString()}');
    }
  }
}
