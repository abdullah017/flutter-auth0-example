import 'package:flutter/material.dart';
import 'package:logauth/screens/home_screen.dart';
import '../services/auth_service.dart';

// TR: Giriş ekranı widget'ı
// EN: Login screen widget
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // TR: Yükleme durumu ve hata mesajı için state değişkenleri
  // EN: State variables for loading status and error message
  bool isLoading = false;
  String? errorMessage;

  // TR: Auth0 ile giriş yapma işlemini gerçekleştiren metod
  // EN: Method that performs login with Auth0
  Future<void> _login() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      final credentials = await AuthService.loginWithAuth0();
      if (mounted) {
        // TR: Başarılı girişten sonra ana sayfaya yönlendir
        // EN: Navigate to home screen after successful login
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => HomeScreen(credentials: credentials),
          ),
        );
      }
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TR: Giriş ekranı arayüzünü oluştur
    // EN: Build login screen interface
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TR: Yükleme durumuna göre buton veya loading göster
            // EN: Show button or loading based on loading state
            if (isLoading)
              const CircularProgressIndicator()
            else
              ElevatedButton(
                onPressed: _login,
                child: const Text('Login with Auth0'),
              ),
            // TR: Hata mesajını göster (varsa)
            // EN: Show error message (if exists)
            if (errorMessage != null)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  errorMessage!,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
