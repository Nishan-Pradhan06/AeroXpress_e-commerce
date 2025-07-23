import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/shared/user_profile/bloc/get_user_profile_bloc.dart';

/// A widget that conditionally renders content based on user roles
/// from GetUserProfileBloc
class RoleBasedWidget extends StatelessWidget {
  /// The child widget to show when role conditions are met
  final Widget child;

  /// List of allowed roles (case-insensitive)
  final List<String>? allowedRoles;

  /// List of forbidden roles (case-insensitive)
  final List<String>? forbiddenRoles;

  /// Widget to show when role conditions are not met
  final Widget? fallback;

  /// Widget to show during loading state
  final Widget? loadingWidget;

  /// Widget to show during error state
  final Widget? errorWidget;

  /// Whether to show child during loading (default: false)
  final bool showDuringLoading;

  /// Whether to show child during error (default: false)
  final bool showDuringError;

  const RoleBasedWidget({
    super.key,
    required this.child,
    this.allowedRoles,
    this.forbiddenRoles,
    this.fallback,
    this.loadingWidget,
    this.errorWidget,
    this.showDuringLoading = false,
    this.showDuringError = false,
  }) : assert(
         allowedRoles != null || forbiddenRoles != null,
         'Either allowedRoles or forbiddenRoles must be provided',
       );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserProfileBloc, GetUserProfileState>(
      builder: (context, state) {
        return state.when(
          initial: () => fallback ?? const SizedBox.shrink(),
          loading:
              () =>
                  showDuringLoading
                      ? child
                      : (loadingWidget ?? const SizedBox.shrink()),
          failure:
              (failure) =>
                  showDuringError
                      ? child
                      : (errorWidget ?? const SizedBox.shrink()),
          loaded: (profile) {
            final userRole = profile.role?.toUpperCase();

            // If user has no role, don't show content
            if (userRole == null || userRole.isEmpty) {
              return fallback ?? const SizedBox.shrink();
            }

            // Check forbidden roles first
            if (forbiddenRoles != null) {
              final forbiddenRolesUpper =
                  forbiddenRoles!.map((role) => role.toUpperCase()).toList();

              if (forbiddenRolesUpper.contains(userRole)) {
                return fallback ?? const SizedBox.shrink();
              }
            }

            // Check allowed roles
            if (allowedRoles != null) {
              final allowedRolesUpper =
                  allowedRoles!.map((role) => role.toUpperCase()).toList();

              if (!allowedRolesUpper.contains(userRole)) {
                return fallback ?? const SizedBox.shrink();
              }
            }

            // All conditions passed, show the child
            return child;
          },
        );
      },
    );
  }
}

/// Convenience widget for checking a single role
class SingleRoleWidget extends StatelessWidget {
  final Widget child;
  final String requiredRole;
  final Widget? fallback;
  final Widget? loadingWidget;
  final Widget? errorWidget;
  final bool showDuringLoading;
  final bool showDuringError;

  const SingleRoleWidget({
    super.key,
    required this.child,
    required this.requiredRole,
    this.fallback,
    this.loadingWidget,
    this.errorWidget,
    this.showDuringLoading = false,
    this.showDuringError = false,
  });

  @override
  Widget build(BuildContext context) {
    return RoleBasedWidget(
      allowedRoles: [requiredRole],
      fallback: fallback,
      loadingWidget: loadingWidget,
      errorWidget: errorWidget,
      showDuringLoading: showDuringLoading,
      showDuringError: showDuringError,
      child: child,
    );
  }
}

/// Convenience widget for customer-only content
class CustomerOnlyWidget extends StatelessWidget {
  final Widget child;
  final Widget? fallback;
  final Widget? loadingWidget;
  final Widget? errorWidget;

  const CustomerOnlyWidget({
    super.key,
    required this.child,
    this.fallback,
    this.loadingWidget,
    this.errorWidget,
  });

  @override
  Widget build(BuildContext context) {
    return SingleRoleWidget(
      requiredRole: 'CUSTOMER',
      fallback: fallback,
      loadingWidget: loadingWidget,
      errorWidget: errorWidget,
      child: child,
    );
  }
}

/// Convenience widget for seller-only content
class SellerOnlyWidget extends StatelessWidget {
  final Widget child;
  final Widget? fallback;
  final Widget? loadingWidget;
  final Widget? errorWidget;

  const SellerOnlyWidget({
    super.key,
    required this.child,
    this.fallback,
    this.loadingWidget,
    this.errorWidget,
  });

  @override
  Widget build(BuildContext context) {
    return SingleRoleWidget(
      requiredRole: 'SELLER',
      fallback: fallback,
      loadingWidget: loadingWidget,
      errorWidget: errorWidget,
      child: child,
    );
  }
}

/// Extension to easily get user role from context
extension RoleHelper on BuildContext {
  /// Get current user role from GetUserProfileBloc
  String? get userRole {
    final state = read<GetUserProfileBloc>().state;
    return state.maybeWhen(
      loaded: (profile) => profile.role?.toUpperCase(),
      orElse: () => null,
    );
  }

  /// Check if current user has specific role
  bool hasRole(String role) {
    return userRole?.toUpperCase() == role.toUpperCase();
  }

  /// Check if current user is a customer
  bool get isCustomer => hasRole('CUSTOMER');

  /// Check if current user is a seller
  bool get isSeller => hasRole('SELLER');

  /// Check if current user is an admin
  bool get isAdmin => hasRole('ADMIN');
}

/// Usage Examples:
/// 
/// 1. Basic role checking:
/// ```dart
/// RoleBasedWidget(
///   allowedRoles: ['CUSTOMER'],
///   child: Text('Customer only content'),
///   fallback: Text('Not a customer'),
/// )
/// ```
/// 
/// 2. Multiple allowed roles:
/// ```dart
/// RoleBasedWidget(
///   allowedRoles: ['SELLER', 'ADMIN'],
///   child: Text('Seller or Admin content'),
/// )
/// ```
/// 
/// 3. Forbidden roles:
/// ```dart
/// RoleBasedWidget(
///   forbiddenRoles: ['BANNED', 'SUSPENDED'],
///   child: Text('Available for non-banned users'),
/// )
/// ```
/// 
/// 4. Customer-only convenience widget:
/// ```dart
/// CustomerOnlyWidget(
///   child: Text('Customer only content'),
/// )
/// ```
/// 
/// 5. Using context extension:
/// ```dart
/// if (context.isCustomer) {
///   // Do something for customers
/// }
/// ```