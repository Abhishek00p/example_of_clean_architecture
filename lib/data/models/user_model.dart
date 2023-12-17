import 'package:societymanager/domain/entities/user_entity.dart';

class AppUserModel extends AppUserEntity {
  const AppUserModel(
      {required super.name,
      required super.deviceId,
      required super.gender,
      required super.email,
      required super.avatar});

  factory AppUserModel.fromjson(Map<String, dynamic> json) {
    return AppUserModel(
        name: json['name'],
        deviceId: json['deviceId'],
        gender: json['gender'],
        email: json['email'],
        avatar: json['avatar']);
  }

  Map<String, dynamic> tojson() {
    return {
      name: name,
      deviceId: deviceId,
      gender: gender,
      email: email,
      avatar: avatar
    };
  }
}
