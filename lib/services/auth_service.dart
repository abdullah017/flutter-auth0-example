import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// TR: Auth0 kimlik doğrulama işlemlerini yöneten servis sınıfı
// EN: Service class managing Auth0 authentication operations
class AuthService {
  // TR: Auth0 istemcisini environment değişkenlerinden yapılandırır
  // EN: Configures Auth0 client from environment variables
  static final auth0 = Auth0(
    dotenv.env['AUTH0_DOMAIN']!,
    dotenv.env['AUTH0_CLIENT_ID']!,
  );

  // TR: Auth0 ile giriş yapma işlemini gerçekleştirir
  // EN: Performs login operation with Auth0
  static Future<Credentials> loginWithAuth0() async {
    try {
      final credentials =
          await auth0.webAuthentication(scheme: "com.example.logauth").login(
        parameters: {
          'prompt': 'login',
        },
      );
      return credentials;
    } catch (e) {
      rethrow;
    }
  }

  // TR: Auth0 ile çıkış yapma işlemini gerçekleştirir
  // EN: Performs logout operation with Auth0
  static Future<void> logoutWithAuth0() async {
    try {
      await auth0.webAuthentication(scheme: "com.example.logauth").logout();
    } catch (e) {
      rethrow;
    }
  }

  // TR: Kullanıcı profilini getirir
  // EN: Retrieves user profile
  static Future<UserProfile?> getUserProfile() async {
    try {
      final credentials = await auth0.credentialsManager.credentials();
      return credentials.user;
    } catch (e) {
      return null;
    }
  }
}
