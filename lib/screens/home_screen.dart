import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'login_screen.dart';

// TR: Ana sayfa widget'ı, kullanıcı bilgilerini gösterir
// EN: Home screen widget, displays user information
class HomeScreen extends StatelessWidget {
  // TR: Auth0'dan alınan kullanıcı kimlik bilgileri
  // EN: User credentials received from Auth0
  final Credentials credentials;

  const HomeScreen({super.key, required this.credentials});

  // TR: Çıkış yapma işlemini gerçekleştiren metod
  // EN: Method that performs logout operation
  Future<void> _logout(BuildContext context) async {
    try {
      await AuthService.logoutWithAuth0();
      if (context.mounted) {
        // TR: Başarılı çıkıştan sonra giriş sayfasına yönlendir
        // EN: Navigate to login screen after successful logout
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const LoginScreen()),
        );
      }
    } catch (e) {
      // TR: Hata durumunda kullanıcıya bilgi ver
      // EN: Inform user in case of error
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Logout error: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // TR: Ana sayfa arayüzünü oluştur
    // EN: Build home screen interface
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          // TR: Çıkış yapma butonu
          // EN: Logout button
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _logout(context),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TR: Kullanıcı profil resmi
            // EN: User profile picture
            CircleAvatar(
              radius: 40,
              backgroundImage:
                  NetworkImage(credentials.user.pictureUrl.toString() ?? ''),
            ),
            const SizedBox(height: 16),
            // TR: Kullanıcı adı
            // EN: User name
            Text(
              'Welcome ${credentials.user.name}',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            // TR: Kullanıcı e-posta adresi
            // EN: User email address
            Text(credentials.user.email ?? ''),
          ],
        ),
      ),
    );
  }
}
