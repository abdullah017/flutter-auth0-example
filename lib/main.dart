import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'screens/login_screen.dart';

// TR: Uygulama başlangıç noktası. Environment değişkenlerini yükler ve uygulamayı başlatır.
// EN: Application entry point. Loads environment variables and starts the application.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  runApp(const MyApp());
}

// TR: Ana uygulama widget'ı. Tema ve ana sayfa yapılandırmasını içerir.
// EN: Main application widget. Contains theme and home page configuration.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth0 Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
