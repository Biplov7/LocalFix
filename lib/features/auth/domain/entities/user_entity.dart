import 'package:localfix/features/auth/domain/entities/account_status.dart';
import 'package:localfix/features/auth/domain/entities/role.dart';

class UserEntity {
  final String id;
  final String name;
  final String email;
  final String phoneNumber;
  final AccountStatus status;
  final String? imageUrl;
  final Role role;

  UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.status,
    required this.imageUrl,
    required this.role,
  });

  UserEntity copyWith({
    String? id,
    String? name,
    String? email,
    String? phoneNumber,
    AccountStatus? status,
    String? imageUrl,
    Role? role,
  }) {
    return UserEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      status: status ?? this.status,
      imageUrl: imageUrl ?? this.imageUrl,
      role: role ?? this.role,
    );
  }
}
