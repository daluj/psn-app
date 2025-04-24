import 'package:collection/collection.dart';

enum BeneficiaryType {
  Type1,
  Type2,
  Type3,
}

enum AppRoles {
  monitor,
  coordinator,
  supervisor,
  organization,
}

enum PersonType {
  staff,
  beneficiary,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (BeneficiaryType):
      return BeneficiaryType.values.deserialize(value) as T?;
    case (AppRoles):
      return AppRoles.values.deserialize(value) as T?;
    case (PersonType):
      return PersonType.values.deserialize(value) as T?;
    default:
      return null;
  }
}
