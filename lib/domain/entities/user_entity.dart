import 'package:equatable/equatable.dart';

class AppUserEntity extends Equatable {
  final String name;
  final String deviceId;
  final String email;
  final String avatar;
  final String gender;

  const AppUserEntity(
      {required this.name,
      required this.deviceId,
      required this.gender,
      required this.email,
      required this.avatar});

  @override
  List<Object?> get props => [name, email, gender, deviceId, avatar];
}
