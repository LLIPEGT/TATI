import 'package:projeto_flutter/domain/entities/studant_info_entity.dart';
import 'package:projeto_flutter/errors/errors_classes.dart';
import 'package:projeto_flutter/patterns/result%20.dart';

abstract class StudentRepositoryContract {
  Future<Result<StudentInfoEntity, Failure>> getStudent();

  Future<Result<void, Failure>> saveStudent(StudentInfoEntity student);
}
