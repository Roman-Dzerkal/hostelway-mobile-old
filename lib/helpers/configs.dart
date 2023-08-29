import 'package:go_router/go_router.dart';
import 'package:hostelway/pages/auth/login/login_view.dart';
import 'package:hostelway/pages/auth/registration/registration_view.dart';
import 'package:hostelway/pages/profile/profile_view.dart';
import 'package:logger/logger.dart';

bool goLogin = true;

/// Configures routing accross all application
GoRouter configAppRouting() {
  return GoRouter(initialLocation: goLogin ? '/login' : '/signup', routes: [
    GoRoute(
      path: '/login',
      name: 'Login page',
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: '/signup',
      name: 'Registration page',
      builder: (context, state) => const RegistrationView(),
    ),
    GoRoute(
      path: '/profile',
      name: 'Main profile page',
      builder: (context, state) => const ProfileView(),
    ),
  ]);
}

final Logger logger = Logger(
    printer: PrettyPrinter(
        methodCount: 2, // Number of method calls to be displayed
        errorMethodCount: 8, // Number of method calls if stacktrace is provided
        lineLength: 120, // Width of the output
        colors: true, // Colorful log messages
        printEmojis: true, // Print an emoji for each log message
        printTime: false // Should each log print contain a timestamp
        ));
