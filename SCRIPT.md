flutter create --project-name meumovi --org br.com.dcbsystem --platforms android,ios,web ./meumovi

flutter pub get

flutter pub run flutter_native_splash:create --path=flutter_native_splash.yaml

flutter pub run icons_launcher:create --path icons_launcher.yaml

dart run build_runner watch -d

<!-- ----------------------------------- -->

flutter pub add firebase_core
dart pub global activate flutterfire_cli
flutterfire configure

<!-- ------------------------- -->

flutter build web --web-renderer html --release
