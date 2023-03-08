# Gharelu

Gharelu is an on-demand handyman application built with Flutter and Firebase. The app allows users to find and hire local handymen for a variety of home repair and maintenance tasks. This repository contains the source code for the Gharelu mobile application.


## Screenshoots



## Getting Started
To get started with Gharelu, follow these steps:

1. Clone this repository to your local machine.
2. Install the latest version of Flutter and Dart.
3. Set up a new Firebase project:
    a. Go to the [Firebase Console](https://console.firebase.google.com) and create a new project.
    b. Add an Android app to the project and follow the instructions to download the `google-services.json` file.
    c. Add an iOS app to the project and follow the instructions to download the `GoogleService-Info.plist` file.
    d. In the Firebase Console, enable the Firebase Authentication, Cloud Firestore, Cloud Storage, and Cloud Functions services.
4. Add the Firebase configuration files to the project:
    a. For Android, move the `google-services.json` file to the `android/app` directory of the project.
    b. For iOS, move the `GoogleService-Info.plist` file to the `ios/Runner` directory of the project.
5. Create New File at the root fo your project named `.env` and replace with your credientials.
```dart
# .env
MAPBOX_KEY=
GOOGLE_MAP_API_KEY=
ALGOLIA_APPLICATIONID=
ALGOLIA_APIKEY=  
```
6. Next, Generate code using Build Runner:
    a. Install the build_runner package by running the following command:
       ```
       flutter pub global activate build_runner
       ```
    b. Generate the code by running the following command:
       ```
       flutter packages pub run build_runner build
       ```
       This command generates code for the project based on the code generators in the `build_runner` package.
6. Run the app






Contributing

If you'd like to contribute to Gharelu, please follow these guidelines:

1. Fork this repository and make your changes on a new branch.
2. Create a pull request with a detailed description of your changes.
3. Follow the code formatting and style guidelines outlined in the project.
4. All contributions must be submitted under the MIT license.
