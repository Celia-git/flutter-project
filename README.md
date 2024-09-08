## flutter-project

# A demo which showcases my ability to create a flutter app written in dart using Android Studio.  

The App is configured with firebase to track **google analytics**, write data to the **realtime database**, and keep user accounts secure with **authentication** based on email and password.

App defaults to user login and allows existing users to log in, or new users to sign up.  New users are added to firebase authentication for future logins.  Home page displays a background; user can swipe through multiple pages and set the background on home.  After navigating back to home, an event, image_changed, is incremented in firebase analytics and the choice of image is written to the realtime database. 
