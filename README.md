# Nerld
Social media app for iOS, for curious/beginners in programming.

## Description
This iOS app will allow users to share snippets of their code, to everyone on the platform. All posts and users will be stored in Firebase Firestore. Also, users will be be able to customize their profile with preset profile emojis and colors, expressing themselves. Each user will have a unique identification code, which will allows users to save their information on our back-end and login on any iOS device.

<img src='/walkthrough.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

## Requirements
- XCode 13
- iOS 15
- Internet connection
- Firebase account

## Setup
1. Create a firebase project
2. Register XCode project to firebase project
3. Drop the "GoogleService-Info.plist" file into project folder
4. Make sure "Copy items if needed is checked", and "Add to targets" is checked to the current project, then press save
5. Make sure you setup Firestore with "users" and "posts" collection

## Fixes
- If you're getting Firebase package errors, you'll need to reinstall Firebase
1. Go to Chat-Party project (TOP OF SIDE BAR, WITH APP STORE ICON)
2. Go to package dependencies
3. Click firebase-ios-sdk
4. Click negative symbol
5. Click plus symbol
6. Search for "firebase-ios-sdk" (ONE PACKAGE SHOULD SHOW UP)
7. Click package
8. Click "Add Package" (THIS MIGHT TAKE AWHILE)
9. Check "FirebaseFirestore"
10. Click "Add Package" (GIVE A MOMENT FOR FIREBASE TO SETUP)
