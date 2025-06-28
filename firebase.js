// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";

// Your web app's Firebase configuration
const firebaseConfig = {
  apiKey: "AIzaSyAnD7qlsksZ_7zuWBpiIQqUb1rUWs4Ux4",
  authDomain: "neuralflow-e32ab.firebaseapp.com",
  projectId: "neuralflow-e32ab",
  storageBucket: "neuralflow-e32ab.appspot.com",
  messagingSenderId: "57150854598",
  appId: "1:57150854598:web:02916d7aa7a9b494d35dc7",
  measurementId: "G-B0DNZQV4E7"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);
