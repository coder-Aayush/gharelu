# Gharelu

Gharelu is a comprehensive on-demand handyman services platform built with Flutter, delivering a seamless experience for both users seeking home services and service providers offering their expertise.

## 🌟 Features

### For Users
- 🔍 Smart search with category and service type filters
- 📅 Seamless appointment scheduling
- 💬 Real-time chat with service providers
- 📍 Location-based service provider discovery
- 💳 Integrated payments (Khalti & eSewa)
- 📱 Intuitive appointment management
- ⭐ Service provider ratings and reviews

### For Service Providers
- 📊 Service listing management dashboard
- 📨 Real-time appointment request notifications
- 📆 Schedule and availability management
- 💰 Secure payment processing through Khalti
- 📈 Performance analytics and insights

### Other Features

- Real-time chat between users and service providers.
- Secure authentication and user account management.
- Integration with Google Maps for location-based search and appointment scheduling.

## 📱 Screenshots

<table>
  <tr>
    <td><img src="/screenshoots/splash_screen.jpg"  alt="Gharelu App Github"/></td>
    <td><img src="/screenshoots/login_screen.jpg"  alt="Gharelu App Github"/></td>
    <td><img src="/screenshoots/home_image.jpg"  alt="Gharelu App Github"/></td>
  </tr>
  <tr>
    <td><img src="/screenshoots/cart_image.jpg"  alt="Gharelu App Github"/></td>
    <td><img src="/screenshoots/select_slot_image.jpg"  alt="Gharelu App Github"/></td>
    <td></td>
  </tr>
</table>

## 🛠️ Tech Stack

- **Frontend**: Flutter
- **Backend**: Firebase
- **Database**: Cloud Firestore
- **Authentication**: Firebase Auth
- **Storage**: Firebase Cloud Storage
- **Location Services**: Google Maps
- **Payment Integration**: Khalti, eSewa
- **Search**: Algolia
- **Features**: Firebase Cloud Functions


## 🚀 Getting Started

### Prerequisites

- Flutter (3.x or later)
- Dart SDK
- Android Studio / VS Code
- Firebase CLI
- Git

### Installation Steps

1. Clone the repository
```bash
git clone https://github.com/yourusername/gharelu.git
cd gharelu
```

2. Install dependencies
```bash
flutter pub get
```

3. Configure Firebase
   - Create a new Firebase project at [Firebase Console](https://console.firebase.google.com)
   - Enable required services:
     - Authentication
     - Cloud Firestore
     - Cloud Storage
     - Cloud Functions
   - Download configuration files:
     - Add `google-services.json` to `android/app/`
     - Add `GoogleService-Info.plist` to `ios/Runner/`

4. Environment Setup
Create a `.env` file in the project root:
```env
MAPBOX_KEY=your_mapbox_key
GOOGLE_MAP_API_KEY=your_google_maps_key
ALGOLIA_APPLICATIONID=your_algolia_app_id
ALGOLIA_APIKEY=your_algolia_api_key
```

5. Generate Required Code
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

6. Run the application
```bash
flutter run
```

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

### Contributing Guidelines

- Follow the established code style and organization
- Write meaningful commit messages
- Include comments and documentation for new features
- Add tests for new functionality
- Update README.md with details of significant changes

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [Flutter](https://flutter.dev/) - UI toolkit
- [Firebase](https://firebase.google.com/) - Backend services
- [Google Maps](https://developers.google.com/maps) - Location services
- [Khalti](https://khalti.com/) - Payment gateway
- [eSewa](https://esewa.com.np/) - Payment gateway
- [Algolia](https://www.algolia.com/) - Search functionality

## 📞 Contact

For support or queries, please reach out to:
- Email: bhattaraiaayush08@gmail.com
- Website: [aayushbhattarai.info.np](https://aayushbhattarai.info.np)
- WhatApp: [Contact](https://wa.me/+9779818630213)
