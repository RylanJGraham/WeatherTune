import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weather_tune/components/login_page/dropdown_button.dart';
import 'package:weather_tune/widgets/profile_page/profile_picture.dart';
import 'package:weather_tune/components/login_page/menu_container.dart';
import 'package:weather_tune/widgets/profile_page/email.dart';
import 'package:weather_tune/widgets/profile_page/username.dart';

class ProfilePage extends StatelessWidget {
  final double margins = 10;
  // String email = FirebaseFirestore.instance.collection('UserInfo').get('email');
  // String username = "username";
  // String profilePicPath =
  ProfilePage({super.key});
//Sign User Out
  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile', style: TextStyle(fontSize: 20)),
        backgroundColor: Colors.grey.shade900,
        foregroundColor: const Color.fromARGB(207, 255, 255, 255),
        toolbarHeight: 50,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 66, 9, 56),
              Color.fromARGB(255, 24, 5, 53)
            ],
          ),
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: margins),
              MenuContainer(
                  widgetWidth: MediaQuery.sizeOf(context).width - 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: margins),
                      ChangeProfilePicture(pictureSize: 100),
                      SizedBox(height: margins),
                      UsernameTextbox(),
                      SizedBox(height: margins),
                    ],
                  )),
              SizedBox(height: margins),
              MenuContainer(
                widgetWidth: MediaQuery.sizeOf(context).width - 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(Icons.place, color: Colors.white, size: 36),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(255, 167, 143, 186)
                                .withOpacity(0.4),
                          ),
                          child: const Align(
                            alignment: Alignment.center,
                            child: Text("Barcelona",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(height: margins),
              MenuContainer(
                widgetWidth: MediaQuery.sizeOf(context).width - 40,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: margins / 2),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Email",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(height: margins),
                      EmailTextBox(),
                      SizedBox(height: margins / 2),
                    ]),
              ),
              SizedBox(height: margins),
              DropDownButton(
                widgetWidth: MediaQuery.sizeOf(context).width - 40,
                title: "Terms of Service",
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "The user allows WeatherTune to access their current location and their email address. For more information, contact support.",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: margins),
              DropDownButton(
                widgetWidth: MediaQuery.sizeOf(context).width - 40,
                title: "Support",
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: RichText(
                    text: const TextSpan(
                      text: "For more information, contact ",
                      style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: "+34 933 64 55 55",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: margins),
              IconButton(
                icon: const Icon(
                  Icons.logout_rounded,
                  color: Colors.white,
                  size: 40,
                ),
                onPressed: () {
                  signOut();
                  Navigator.of(context).pushReplacementNamed("/auth");
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
