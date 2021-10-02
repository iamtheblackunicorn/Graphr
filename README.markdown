<p align="center">
 <img src="https://github.com/iamtheblackunicorn/Graphr/raw/main/assets/images/banner.png"/>
</p>

# GRAPHR :chart_with_upwards_trend:

*Plot graphs anywhere!* :chart_with_upwards_trend:

## About :books:

Some months ago, when I still had much to learn about Dart's and Flutter's State management, I wrote an app called *Math X*.
The purpose of this app was to let people type in a list of X values and Y values for a mathematical graph and then have these briefly visualized as a line graph. There were multiple problems. I didn't know how to roll my own widgets which would allow me to properly handle updating line graphs on the go and actually making *Math X* do what it was designed for. ***Graphr*** is *Math X's* reincarnation. Enjoy! :unicorn: :heart:

## Download :inbox_tray:

- ***X (STILL W.I.P) (v.1.0.0)***:
  - ***[Download for Android](https://github.com/iamtheblackunicorn/Graphr/releases/download/v.1.0.0/Graphr-v1.0.0-X-Release.apk) (~15.2 MB)***
  - ***[Download for Mac OSX](https://github.com/iamtheblackunicorn/Graphr/releases/download/v.1.0.0/Graphr-v1.0.0-X-Release.app.zip) (~11.8 MB)***

## Building :hammer:

Make sure that you have the following programmes installed:

- Flutter SDK
- Dart SDK
- Android Studio
- Android SDK
- Java JDK
- Xcode
- Make
- Git

After you have installed these, run this command to generate a keystore for the app.

```bash
$ keytool -genkey -v -keystore key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias key
```

After having done that, move the Java keystore to `android/app` and fill in the fields for the keystore password in the file `android/app/key.properties`.

Finally, run these commands:

```bash
$ flutter pub get
$ flutter build apk
```

You have now generated a release build of *Graphr*.

## Changelog :black_nib:

### Version 1.0.0: ***X***

- upload to GitHub
- polishing of the logic
- polishing of the design

## Note :scroll:

- *Random :chart_with_upwards_trend:* by Alexander Abraham :black_heart: a.k.a. *"The Black Unicorn" :unicorn:*
- Licensed under the MIT license.
