import 'package:faker_dart/faker_dart.dart';
import 'package:projeto_flutter/domain/entities/studant_info_entity.dart';

abstract class StudenteFakeFactory {
  static StudentInfoEntity factory() {
    final faker = Faker.instance;
    faker.setLocale(FakerLocaleType.pt_PT);

    var instance = StudentInfoEntity(
      name: faker.name.fullName(),
      address: faker.address.streetAddress(useFullAddress: true),
      phone: faker.phoneNumber.phoneNumber(),
      email: faker.internet.email(),
      age: faker.datatype.number(min: 18, max: 100),
    );
    return instance;
  }
}
