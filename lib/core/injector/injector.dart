import 'package:abook/core/core.dart';

class ServiceInjector {
  UtilityService utilityService = UtilityService();
  RouterService routerService = RouterService();
  AuthService authService = AuthService();
  BookService bookService = BookService();
  PermissionService permissionService = PermissionService();
  UserService userService = UserService();
}

ServiceInjector si = ServiceInjector();
