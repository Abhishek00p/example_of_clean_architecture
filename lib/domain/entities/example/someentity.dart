import 'package:equatable/equatable.dart';

class SomeEntity extends Equatable {
  const SomeEntity({
    required this.id,
    this.name,
    this.addressEntity,
  });

  final String id;
  final String? name;
  final AddressEntity? addressEntity;

  @override
  List<Object?> get props => [id, name, addressEntity];
}

class AddressEntity extends Equatable {
  const AddressEntity({
    required this.street,
    this.pincode,
    this.landMark,
  });

  final String street;
  final String? pincode;
  final String? landMark;

  @override
  List<Object?> get props => [street, pincode, landMark];
}
