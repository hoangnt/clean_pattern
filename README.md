# clean_pattern
My Flutter project with Clean pattern design.

# Command
dart run build_runner build --delete-conflicting-outputs

# Build APK
flutter build apk --flavor dev .\lib\main_dev.dart<br />
flutter build apk --flavor stg .\lib\main_stg.dart<br />
flutter build apk --flavor prod .\lib\main_prod.dart<br />
