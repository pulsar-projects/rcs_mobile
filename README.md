# Geopivot Mobile App - Recycling Centers and Services Mobile App

(assets/logo.png)[Logo]

# Pitch

GeoPivot is powered by AI, Machine Learning, earth911 data and mobile technologies to bring the convenience of recycling to people's homes.

## Additional Information

Worldwide it is difficult to identify what can and cannot be recycled and where.
GeoPivot makes recycling easier, allowing users to take/upload pictures with mobile phones. It uses Tensorflow object detection, Earth911 data, Flutter maps to enable accurate prediction of images for recycling and show nearest recycle centre. The application is secure, using Firebase authentication for email/password and Goole sign-in. GeoPivot is tested and deployed to both Andriod and ios platforms.
white_check_markeyesraised_hands

## Tags

Computer Vision, Flutter, Firebase, Earth911, Machine Learning, Object Detection, Tensorflow, Andriod, Map, Recycle, YOLOV, Street Map

## Technical Details

* for Object Detection we have integrated Tensorflow Lite TiniyYoloV2
* For data-models, stubs and explorations we  have used Earth911 API
* Maps are supported by Flutter Map with Open Street Maps
* for Authentication we use  Firebase Authentication with supported flows for Email/Password  and Google sign-in
* For state management we’ve implemented the provider pattern
* We are sharing a theme cross the entire app to enable easier customisations 
* The code has been structured into small manageable widgets of different types
* Deployed and tested on both iOS and Android platforms

## Development notes 

### iOS
- include firebase updated plist into the credentials folder: `ios/credentials/GoogleService-Info.plist`
- in XCode, on the left hand side select the `GoogleService-Info.plist` under Runner and map it to the above location
- in Project > Runner > set Compile Sources As : `Objective-C++`
- in Project > Runner set Project Format to `11.0` and iOS Deployment Target to `11.0`