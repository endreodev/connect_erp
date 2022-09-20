importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-messaging.js");

firebase.initializeApp({
    apiKey: "AIzaSyDSmLUso0Uej5ZIKH7q9JUG_iic1IdgGhg",
    authDomain: "connecterp-ae87d.firebaseapp.com",
    projectId: "connecterp-ae87d",
    storageBucket: "connecterp-ae87d.appspot.com",
    messagingSenderId: "988975610094",
    appId: "1:988975610094:web:a796a5194392d92d629bff",
    measurementId: "G-F8MXX1EB9K"
});

// Necessary to receive background messages:
const messaging = firebase.messaging();

// Optional:
messaging.onBackgroundMessage((m) => {
  console.log("onBackgroundMessage", m);
});