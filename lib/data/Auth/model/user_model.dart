import 'package:localfix/domain/Auth/entities/account_status.dart';
import 'package:localfix/domain/Auth/entities/role.dart';
import 'package:localfix/domain/Auth/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.phoneNumber,
    required super.status,
    required super.imageUrl,
    required super.role,
  });

  // Convert Map to UserModel
  factory UserModel.fromMap(Map<String, dynamic> map) {
    final statusValue = map['status'];
    final roleValue = map['role'];

    return UserModel(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      phoneNumber: map['phoneNumber'] as String,
      status: statusValue is AccountStatus
          ? statusValue
          : AccountStatus.values.firstWhere(
              (status) => status.name == statusValue,
              orElse: () => AccountStatus.active,
            ),
      imageUrl: map['imageUrl'] as String?,
      role: roleValue is Role
          ? roleValue
          : Role.values.firstWhere(
              (role) => role.name == roleValue,
              orElse: () => Role.customer,
            ),
    );
  }

  // Convert UserModel to Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'status': status.name,
      'imageUrl': imageUrl,
      'role': role.name,
    };
  }
}
