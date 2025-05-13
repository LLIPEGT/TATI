import 'package:projeto_flutter/data/services/local_storage_contract.dart';
import 'package:projeto_flutter/domain/entities/studant_info_entity.dart';
import 'package:projeto_flutter/errors/errors_classes.dart';
import 'package:projeto_flutter/helper/studente_fake_repository.dart';
import 'package:projeto_flutter/patterns/result%20.dart';

class FakeDbService implements LocalStorageContract {
  StudentFakeApiDataBase fakeDB = StudentFakeApiDataBase();

  @override
  Future<Result<StudentInfoEntity, Failure>> fetchStudent() async {
    try {
      var result = await fakeDB.getData();
      StudentInfoEntity student = StudentInfoEntity.fromJson(result);
      return Success(student);
    } on DatasourceResultEmpty catch (e) {
      return Error(DatasourceResultEmpty(e.toString()));
    } on APIFailure catch (e) {
      return Error(APIFailure(e.toString()));
    } on Exception catch (e) {
      return Error(DefaultError("Erro desconhecido: ${e.toString()}"));
    }
  }

  @override
  Future<Result<void, Failure>> saveStudent(StudentInfoEntity student) {
    // TODO: implement saveStudent
    throw UnimplementedError();
  }
}
