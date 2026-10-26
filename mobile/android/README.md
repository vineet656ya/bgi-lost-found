# BGI Lost & Found Android

Generated with Google Bubblewrap. Package: `app.bgi.lostfound`.
The app opens the existing HTTPS site as a Trusted Web Activity, using the same server authorization, accounts, ID uploads and data. No API secrets are bundled. Notifications are disabled.

## Build
Install JDK 17 and the Android SDK (platform 36 and build tools 35 or newer). Set `ANDROID_HOME` or create an ignored `local.properties` with `sdk.dir=...`. Run `./gradlew assembleRelease bundleRelease`.

Release signing keys are intentionally excluded from Git. Keep the separately supplied private signing backup safe; use its key for future updates. Sign the unsigned release APK with Android `apksigner`. Before publishing through Google Play, configure Play App Signing and add its app-signing SHA-256 certificate fingerprint to `public/.well-known/assetlinks.json`, retaining any still-supported direct-download certificate. Increase versionCode for each Android update.

The browser verifies the website/app relationship through Digital Asset Links. If verification fails it displays a browser toolbar. Device testing of login, admin MFA, uploads, navigation, recovery and installation remains required.

The initial signed APK is served at `/downloads/bgi-lost-found-1.0.0.apk`. Its SHA-256 checksum is alongside it. Minimum Android version is 7.0 (API 24).
