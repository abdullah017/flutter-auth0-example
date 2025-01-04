# 🔐 Flutter Auth0 Authentication Example App

[TR] Auth0 kimlik doğrulama sistemi ile geliştirilmiş Flutter uygulaması.
[EN] Flutter application developed with Auth0 authentication system.

## 📱 Özellikler | Features

[TR]
- Auth0 ile güvenli kimlik doğrulama
- Email/şifre ile giriş
- Sosyal medya hesapları ile giriş
- Kullanıcı profil bilgilerini görüntüleme
- Material Design 3 arayüz tasarımı
- Çoklu dil desteği (Türkçe/İngilizce)

[EN]
- Secure authentication with Auth0
- Email/password login
- Social media account login
- User profile information display
- Material Design 3 interface
- Multi-language support (Turkish/English)

## 🛠️ Kullanılan Teknolojiler | Technologies Used

- Flutter 3.x
- Dart SDK ^3.6.0
- auth0_flutter: ^1.7.2
- flutter_dotenv: ^5.1.0

## ⚙️ Kurulum | Installation

### 1. Gereksinimleri Yükleme | Install Requirements

- `flutter pub get`



### 3. Platform Yapılandırması | Platform Configuration

#### Android

[TR] `android/app/build.gradle` dosyasında manifestPlaceholders'ı ayarlayın:
[EN] Set manifestPlaceholders in `android/app/build.gradle`:


`
defaultConfig {
manifestPlaceholders += [
'auth0Domain': 'YOUR_AUTH0_DOMAIN',
'auth0Scheme': '${applicationId}'
]
}
`



#### iOS

[TR] `ios/Runner/Info.plist` dosyasına URL scheme ekleyin:
[EN] Add URL scheme to `ios/Runner/Info.plist`:

`
<key>CFBundleURLTypes</key>
<array>
<dict>
<key>CFBundleURLSchemes</key>
<array>
<string>$(PRODUCT_BUNDLE_IDENTIFIER)</string>
</array>
</dict>
</array>
`


## 📁 Proje Yapısı | Project Structure
`
lib/
├── main.dart # Uygulama başlangıç noktası | Application entry point
├── services/
│ └── auth_service.dart # Auth0 servis işlemleri | Auth0 service operations
└── screens/
├── login_screen.dart # Giriş ekranı | Login screen
└── home_screen.dart # Ana sayfa | Home screen
`


## 🚀 Çalıştırma | Running

[TR] Uygulamayı başlatmak için:
[EN] To start the application:

`flutter run`



## 🔒 Güvenlik | Security

[TR]
- Hassas bilgiler `.env` dosyasında saklanır
- `.env` dosyası .gitignore'a eklenmiştir
- Auth0'ın güvenli kimlik doğrulama protokolleri kullanılmaktadır

[EN]
- Sensitive information is stored in `.env` file
- `.env` file is added to .gitignore
- Auth0's secure authentication protocols are used

## 🤝 Katkıda Bulunma | Contributing

[TR] 
1. Bu depoyu fork edin
2. Yeni bir branch oluşturun (`git checkout -b feature/yeniOzellik`)
3. Değişikliklerinizi commit edin (`git commit -m 'Yeni özellik eklendi'`)
4. Branch'inizi push edin (`git push origin feature/yeniOzellik`)
5. Bir Pull Request oluşturun

[EN]
1. Fork this repository
2. Create a new branch (`git checkout -b feature/newFeature`)
3. Commit your changes (`git commit -m 'Add new feature'`)
4. Push to the branch (`git push origin feature/newFeature`)
5. Create a Pull Request

## 📝 Lisans | License

[TR] Bu proje MIT lisansı altında lisanslanmıştır.
[EN] This project is licensed under the MIT License.

## 📞 İletişim | Contact

[TR] Sorularınız için:
[EN] For questions:

- GitHub: [@abdullah017](https://github.com/abdullah017)


---

[TR] Bu proje Auth0 ile güvenli kimlik doğrulama işlemlerini gerçekleştirmek için geliştirilmiştir.
[EN] This project was developed to implement secure authentication operations with Auth0.
