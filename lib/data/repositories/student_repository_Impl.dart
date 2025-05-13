import 'package:projeto_flutter/data/repositories/student_repository_contract.dart';
import 'package:projeto_flutter/data/services/local_storage_contract.dart';
import 'package:projeto_flutter/domain/entities/studant_info_entity.dart';
import 'package:projeto_flutter/errors/errors_classes.dart';
import 'package:projeto_flutter/patterns/result%20.dart';

class StudentRepositoryImpl implements StudentRepositoryContract {
  final LocalStorageContract _localDataService;

  StudentRepositoryImpl({
    required LocalStorageContract localDataService,
  }) : _localDataService = localDataService;

  @override
  Future<Result<StudentInfoEntity, Failure>> getStudent() async {
    var result = await _localDataService.fetchStudent();
    return result;
  }

  @override
  Future<Result<void, Failure>> saveStudent(StudentInfoEntity student) async {
    var result =  await _localDataService.saveStudent(student);
    return result;
  }

}
