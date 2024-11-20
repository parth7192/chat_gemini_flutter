import 'package:chat_gemini_flutter/Routes/app_route.dart';
import 'package:chat_gemini_flutter/helper/auth_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.brown.shade400, Colors.black],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 100),

            //WelCome mate
            Text(
              'WELCOME',
              style: GoogleFonts.openSans(
                fontSize: 70,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 50),

            // Chat text
            Text(
              'CHAT',
              style: GoogleFonts.roboto(
                fontSize: 30,
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
            ),

            //Gemini logo image
            Image.asset(
              "lib/assets/image/aa.png",
              fit: BoxFit.contain,
            ),

            const SizedBox(height: 60),

            // login button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 20,
                      ),
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    child: Text(
                      'LOGIN WITH GOOGLE',
                      style: GoogleFonts.roboto(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Google icon with login
            IconButton(
              onPressed: () {
                AuthHelper.instance.signInWithGoogle().then(
                      (value) =>
                          Navigator.pushNamed(context, AppRoutes.instance.home),
                    );
              },
              icon: Image.asset(
                "lib/assets/image/g.png",
                height: 35,
                width: 35,
              ),
            ),

            const SizedBox(height: 35),

            // login using social media text
            Text(
              "OR LOGIN USING SOCIAL MEDIA",
              style: GoogleFonts.openSans(
                fontSize: 24,
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 15),

            // other 3 icon
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.instance.home);
                  },
                  icon: Icon(Icons.facebook),
                  color: Colors.white,
                  iconSize: 30,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.instance.home);
                  },
                  icon: Icon(Icons.alternate_email),
                  color: Colors.white,
                  iconSize: 30,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.instance.home);
                  },
                  icon: Icon(Icons.g_translate),
                  color: Colors.white,
                  iconSize: 30,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
