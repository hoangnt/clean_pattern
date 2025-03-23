# clean_pattern
My Flutter project with Clean pattern design.

# Active generate tool
dart pub global activate flutter_gen

# Required before build
<!-- C:\Users\<user_name>\AppData\Local\Pub\Cache\bin\fluttergen -c pubspec.yaml -->
fluttergen -c pubspec.yaml
dart run build_runner build --delete-conflicting-outputs

# Build APK
flutter build apk --flavor dev .\lib\main_dev.dart<br />
flutter build apk --flavor stg .\lib\main_stg.dart<br />
flutter build apk --flavor prod .\lib\main_prod.dart<br />

# Build App Bundle 
flutter build appbundle --flavor dev .\lib\main_dev.dart<br />
flutter build appbundle --flavor stg .\lib\main_stg.dart<br />
flutter build appbundle --flavor prod .\lib\main_prod.dart<br />

# Build IPA 
flutter build ipa --flavor dev .\lib\main_dev.dart<br />
flutter build ipa --flavor stg .\lib\main_stg.dart<br />
flutter build ipa --flavor prod .\lib\main_prod.dart<br />
