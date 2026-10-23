enum Role {
  admin,
  customer,
  provider;

  String get firestoreValue {
    switch (this) {
      case Role.admin:
        return 'admin';
      case Role.customer:
        return 'customer';
      case Role.provider:
        return 'provider';
    }
  }

  static Role fromFirestore(Object? value) {
    switch (value) {
      case 'admin':
        return Role.admin;
      case 'provider':
        return Role.provider;
      case 'customer':
      default:
        return Role.customer;
    }
  }
}
