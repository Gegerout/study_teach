import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:study_teach/auth/presentation/pages/signup_page.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
          children: [
            Center(
              child: Image.asset(
                "assets/images/welcome_bg.png",
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 70),
                    child: Center(child: Image.asset("assets/images/welcome_image.png", width: 268, height: 263,)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 31, top: 33),
                    child: Text(
                      "Selamat Datang \nMember StudyTeach",
                      style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w800,
                          fontSize: 24,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 31, top: 15),
                    child: Text(
                      "Pendidikan adalah paspor untuk masa \ndepan, karena hari esok adalah milik \nmereka yang mempersiapkannya hari ini.",
                      style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.07),
                    child: Center(child: Container(
                      padding: const EdgeInsets.only(left: 14),
                      height: 45,
                      width: 315,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Row(
                        children: [
                          Image.asset("assets/images/google_icon.png"),
                          Padding(
                            padding: const EdgeInsets.only(left: 32),
                            child: Text("Sign in with Google", style: GoogleFonts.openSans(fontWeight: FontWeight.w400, fontSize: 18, color: const Color(0xFF0046FB)),),
                          )
                        ],
                      ),
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 26),
                    child: Center(
                      child: Container(
                        width: 315,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF4285F4),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)
                              )
                            ),
                            child: Text(
                              "Create an account",
                              style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.w400, fontSize: 18, color: Colors.white),
                            )),
                      ),
                    ),
                  ),
                  // Align(
                  //     alignment: Alignment.bottomRight,
                  //     child: Image.asset("assets/images/rocket_image.png"),
                  //   ),
                  const SizedBox(height: 65,)
                ],
              ),
            )
          ],
        ),
    );
  }
}
