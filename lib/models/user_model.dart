/// Main user class-repository
///
/// Contains all user info
class UserModel {
  String? _name, _email, _phoneNumber;
  Roles? _role;

  UserModel._privateConstructor(
      {String? email, Roles? role, String? name, String? phoneNumber})
      : _role = role,
        _phoneNumber = phoneNumber,
        _email = email,
        _name = name;

  /// Factory method to parse user data from [json]
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel._privateConstructor(
      email: json['email'],
      name: json['name'],
      role: json['role'] == 'manager' ? Roles.manager : Roles.guest,
      phoneNumber: json['phone_number'],
    );
  }

  @override
  String toString() {
    return Map.from({
      'email': _email,
      'name': _name,
      'phone_number': _phoneNumber,
      'role': _role,
    }).toString();
  }

  /// Name of the current user
  String get name => _name ?? '';

  /// Role of current user. Default [Roles.guest]
  Roles get role => _role ?? Roles.guest;

  /// Email of the current user
  String get email => _email ?? '';

  /// Phone of the current user
  String get phoneNumber => _phoneNumber ?? '';
}

enum Roles { manager, guest }

enum Week { mondya, tuesday, wednesday, sunday }

class CWeek {
  static String monday = 'Monday';
  static String tueasday = 'Tuesday';
}
