/// The role of an authenticated user.
enum UserRole { technician, client, admin }

/// Pure domain entity — no Firebase / JSON dependencies.
class AppUser {
  final String uid;
  final String email;
  final String displayName;
  final String? photoUrl;
  final UserRole role;
  final DateTime createdAt;

  const AppUser({
    required this.uid,
    required this.email,
    required this.displayName,
    this.photoUrl,
    required this.role,
    required this.createdAt,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is AppUser && other.uid == uid;

  @override
  int get hashCode => uid.hashCode;

  @override
  String toString() => 'AppUser(uid: $uid, role: $role, email: $email)';
}
