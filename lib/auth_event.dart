// Abstract class representing the base event for authentication actions.
abstract class AuthEvent {
  // Common properties for authentication events.
  final String email;
  final String password;

  // Constructor for AuthEvent, enforcing the presence of email and password.
  AuthEvent({required this.email, required this.password});
}

// Represents a login event, extending the base AuthEvent.
class LoginEvent extends AuthEvent {
  // Constructor for LoginEvent, inheriting email and password from AuthEvent.
  LoginEvent({required super.email, required super.password});
}

// Represents a registration event, extending the base AuthEvent.
class RegisterEvent extends AuthEvent {
  // Constructor for RegisterEvent, inheriting email and password from AuthEvent.
  RegisterEvent({required super.email, required super.password});
}
