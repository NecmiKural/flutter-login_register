# login_and_register_app
**Used Packages**
- firebase_auth
- firebase_core
- cloud_firestore
- email_validator
- get
  
The first three packages were used for authentication and database operations in Firebase.

email_ validator was used to verify the accuracy of the email value entered when the user logged in or registered.

Get was used for the state management needed on the main screen.

**Scenario of the Application**

When a user logs in to the application for the first time, a splash screen greets the user, and the application checks in the background whether the user has logged in before. The splash screen waits until the connection is established and a response is received. Then, the user is directed to the main screen if he/she has logged in before, or to the login screen if he/she has not logged in before.

User login and registration can be done with FirebaseAuth. If the user enters a non-existent user or incorrect user information when trying to log in, the application displays the necessary error message to the user.

The application verifies whether the user has filled in the required information correctly. After the user registers, the user's information is stored in Firestore with the same user's uid. Thus, the user's information is visible on the main screen. There is also an option to log out here.

When the user reaches the home screen, they can see the hobbies section under his information. From there, they can instantly add new hobbies or delete the hobbies they added.

**Screenshots of the Application**

<img src="https://cdn.discordapp.com/attachments/926423286840193044/1210478725980885002/Screenshot_2024-02-22-22-03-39-924_com.example.login_and_register_app.jpg?ex=65eab529&is=65d84029&hm=034d4d89be42ce047341787c46248d1bddba2079f2ed424c50af35598e83c1fd&" alt="drawing" width="400"/> <img src="https://cdn.discordapp.com/attachments/926423286840193044/1210478724852490300/Screenshot_2024-02-22-22-03-46-763_com.example.login_and_register_app.jpg?ex=65eab529&is=65d84029&hm=8e9981149177bb8297c47384b3ace2749969002be9b270f6a7c4a44c1dd699b3&" alt="drawing" width="400"/>
<img src="https://cdn.discordapp.com/attachments/926423286840193044/1210478722730164264/Screenshot_2024-02-22-22-03-53-072_com.example.login_and_register_app.jpg?ex=65eab529&is=65d84029&hm=3f2e497fa889c46f3b79c3fdb4b588fd3685ab11ebcc140b6d3cf44687133d6f&" alt="drawing" width="400"/> <img src="https://cdn.discordapp.com/attachments/926423286840193044/1210478723028090931/Screenshot_2024-02-22-22-03-31-381_com.example.login_and_register_app.jpg?ex=65eab529&is=65d84029&hm=04d30ec43dd97d4392a0ff3ad13138c6b36ab26e0ccb1179e8cb4bee99b230cd&" alt="drawing" width="400"/>
