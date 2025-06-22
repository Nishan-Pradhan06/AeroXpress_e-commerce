import 'package:deal_sell/core/constant/api.dart';

enum Environment { development, production }

class EnvConfig {
  final Environment environment;
  final String apiBaseUrl;
  final bool enableLogging;

  EnvConfig({
    required this.environment,
    required this.apiBaseUrl,
    required this.enableLogging,
  });

  // Development environment configuration
  factory EnvConfig.development() {
    return EnvConfig(
      environment: Environment.development,
      apiBaseUrl: BASE_URL,
      enableLogging: true,
    );
  }

  // Production environment configuration
  factory EnvConfig.production() {
    return EnvConfig(
      environment: Environment.production,
      apiBaseUrl: BASE_URL,
      enableLogging: false,
    );
  }

  static late EnvConfig _instance;

  static void initialize(Environment env) {
    switch (env) {
      case Environment.development:
        _instance = EnvConfig.development();
        break;
      case Environment.production:
        _instance = EnvConfig.production();
        break;
    }
  }

  static EnvConfig get instance => _instance;
}
