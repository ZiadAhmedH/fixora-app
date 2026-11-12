# Deep Link Setup Guide (Fixora App)

This guide documents the complete setup for Android App Links and iOS Universal Links using your custom domain **`fixora-app.web.app`** and the **`app_links`** Flutter package.

---

## 1. Flow Overview

```
1. User taps "Send Reset Link"
       │
       ▼
2. Firebase sends email containing link:
   https://fixora-app.web.app/__/auth/action?mode=resetPassword&oobCode=XYZ
       │
       ▼
3. User clicks the link on mobile device
       │
       ▼
4. OS recognizes domain (fixora-app.web.app)
   and opens Fixora app directly (not browser)
       │
       ▼
5. DeepLinkService (app_links) / GoRouter extracts oobCode
       │
       ▼
6. App opens "Set New Password" screen
       │
       ▼
7. User inputs new password -> Firebase confirms reset -> Done!
```

---

## 2. Android Configuration

### A. AndroidManifest.xml
Already configured in `android/app/src/main/AndroidManifest.xml`:

```xml
<!-- Deep link: Password reset email link opens this app -->
<intent-filter android:autoVerify="true">
    <action android:name="android.intent.action.VIEW" />
    <category android:name="android.intent.category.DEFAULT" />
    <category android:name="android.intent.category.BROWSABLE" />

    <data
        android:scheme="https"
        android:host="fixora-app.web.app" />
    <data
        android:scheme="https"
        android:host="fixora-app.firebaseapp.com" />
    <data
        android:scheme="https"
        android:host="field-service-app-1145a.firebaseapp.com" />
</intent-filter>

<!-- Custom scheme for quick debugging via adb / browser -->
<intent-filter>
    <action android:name="android.intent.action.VIEW" />
    <category android:name="android.intent.category.DEFAULT" />
    <category android:name="android.intent.category.BROWSABLE" />
    <data
        android:scheme="fixora"
        android:host="set-new-password" />
</intent-filter>
```

### B. Android App Links Digital Asset Links (`assetlinks.json`)
For Android to open HTTPS links automatically without prompting the user, Google requires an `assetlinks.json` file hosted at:
`https://fixora-app.web.app/.well-known/assetlinks.json`

#### Step 1: Get your SHA-256 Fingerprint
Run this in PowerShell / Terminal:
```bash
cd android
./gradlew signingReport
```
Look for `SHA-256:` under the `debug` or `release` variant.

#### Step 2: Create `assetlinks.json`
```json
[
  {
    "relation": ["delegate_permission/common.handle_all_urls"],
    "target": {
      "namespace": "android_app",
      "package_name": "com.ziadahmed.feild_service_app",
      "sha256_cert_fingerprints": [
        "YOUR_SHA256_FINGERPRINT_HERE_UPPERCASE_WITH_COLONS"
      ]
    }
  }
]
```

#### Step 3: Deploy with Firebase Hosting
In your Firebase project root, place the file under `public/.well-known/assetlinks.json`, then deploy:
```bash
firebase deploy --only hosting
```

---

## 3. iOS Configuration

### A. Associated Domains (Xcode)
1. Open `ios/Runner.xcworkspace` in Xcode.
2. Select the `Runner` target -> **Signing & Capabilities**.
3. Click **+ Capability** and add **Associated Domains**.
4. Add the entry:
   ```
   applinks:fixora-app.web.app
   ```

### B. Apple App Site Association (`apple-app-site-association`)
Host this file without file extension at:
`https://fixora-app.web.app/.well-known/apple-app-site-association`

```json
{
  "applinks": {
    "apps": [],
    "details": [
      {
        "appID": "<TEAM_ID>.com.ziadahmed.feildServiceApp",
        "paths": ["/set-new-password*", "/__/auth/action*", "/reset*"]
      }
    ]
  }
}
```

---

## 4. How to Test Deep Links Right Now

### Option 1: Fast test via ADB (Android Emulator / Device)
With your app installed, run either command in terminal:

```bash
# Test custom scheme (no assetlinks verification needed):
adb shell am start -a android.intent.action.VIEW -d "fixora://set-new-password?oobCode=TEST12345"

# Test full HTTPS domain deep link:
adb shell am start -a android.intent.action.VIEW -d "https://fixora-app.web.app/set-new-password?oobCode=TEST12345" com.ziadahmed.feild_service_app

# Test Firebase action URL format:
adb shell am start -a android.intent.action.VIEW -d "https://fixora-app.web.app/__/auth/action?mode=resetPassword&oobCode=TEST12345" com.ziadahmed.feild_service_app
```

The app will immediately open and route directly to the **Set New Password** screen with the code!

