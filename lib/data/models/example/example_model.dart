import 'package:societymanager/domain/entities/example/someentity.dart';

class SomeModel extends SomeEntity {
  const SomeModel({
    required super.id,
    super.name,
    super.addressEntity,
  });

  factory SomeModel.fromJson(Map<String, dynamic> json) {
    return SomeModel(
      id: json['id'],
      name: json['name'],
      addressEntity: AddressModel.fromJson(json['address']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address': AddressModel.toJson(),
    };
  }
}

class AddressModel extends AddressEntity {
  const AddressModel({required super.street, super.pincode, super.landMark});

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      street: json['street'],
      pincode: json['pincode'],
      landMark: json['landmark'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'street': street,
      'pincode': pincode,
      'landMark': landMark,
    };
  }
}
