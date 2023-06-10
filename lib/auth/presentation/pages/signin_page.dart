import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:study_teach/auth/presentation/pages/signin_page.dart';
import 'package:study_teach/auth/presentation/pages/signup_page.dart';
import 'package:study_teach/auth/presentation/states/auth_provider.dart';
import 'package:study_teach/core/utils/textinput_formatter.dart';
import 'package:study_teach/home/presentation/pages/home_page.dart';

class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  ConsumerState<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
  final TextEditingController emailCont = TextEditingController();
  final TextEditingController passwordCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              "assets/images/blue_bg.png",
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 14, top: 40),
                child: SizedBox(
                  width: 37,
                  height: 37,
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: Colors.transparent,
                    splashColor: Colors.transparent,
                    elevation: 0,
                    textColor: Colors.white,
                    padding: EdgeInsets.zero,
                    shape: const CircleBorder(
                        side: BorderSide(
                          width: 2,
                          color: Colors.white,
                        )),
                    child: const Icon(
                      Icons.arrow_back,
                      size: 24,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Image.asset("assets/images/auth_bubbles.png")
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset("assets/images/trees_image.png",),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: height * 0.07),
                child: Center(
                    child: Text(
                      "StudyTeach",
                      style: GoogleFonts.passeroOne(
                          fontWeight: FontWeight.w400,
                          fontSize: 36,
                          color: const Color(0xFFF9B208)),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 32),
                child: Text(
                  "Sign in",
                  style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w700,
                      fontSize: 36,
                      color: Colors.white),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.03),
                child: Container(
                  height: height * 0.59,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                          bottomRight: Radius.circular(60))),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 34, top: 35),
                          child: Text(
                            "Welcome back",
                            style: GoogleFonts.openSans(
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                color: const Color(0xFF3D2C8D)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 34),
                          child: Text(
                            "Hello there, sign in continue",
                            style: GoogleFonts.openSans(
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                                color: const Color(0xFFA9A297)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 29, top: 53),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Image.asset("assets/images/user_icon.png"),
                              ),
                              Text(
                                "Username or email",
                                style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                    color: const Color(0xFF0F044C)),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 31, top: 3),
                          child: Container(
                            width: 277,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xFFE9E9E9)),
                            child: TextFormField(
                              controller: emailCont,
                              inputFormatters: [
                                LowerCaseTextFormatter()
                              ],
                              keyboardType: TextInputType.emailAddress,
                              onChanged: (value) {
                                ref.read(signinProvider.notifier).checkCreds(value, passwordCont.text);
                              },
                              style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 11,
                                  color: const Color(0xFF888888)),
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(left: 18),
                                  suffixIcon: ref.watch(signinProvider).isEmail ? Image.asset("assets/images/success_icon.png") : null,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none),
                                  hintText: "Enter your username or email",
                                  hintStyle: GoogleFonts.openSans(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 11,
                                      color: const Color(0xFF888888))),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 29, top: 16),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Image.asset("assets/images/lock_icon.png"),
                              ),
                              Text(
                                "Password",
                                style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                    color: const Color(0xFF0F044C)),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 31, top: 3),
                          child: Container(
                            width: 277,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xFFE9E9E9)),
                            child: TextFormField(
                              controller: passwordCont,
                              onChanged: (value) {
                                ref.read(signinProvider.notifier).checkCreds(emailCont.text, value);
                              },
                              style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 11,
                                  color: const Color(0xFF888888)),
                              obscureText: true,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(left: 18),
                                  suffixIcon: ref.watch(signinProvider).isPassword ? Image.asset("assets/images/success_icon.png") : null,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none),
                                  hintText: "Enter your password",
                                  hintStyle: GoogleFonts.openSans(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 11,
                                      color: const Color(0xFF888888))),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 31, top: 27),
                          child: Text("Forgot password?", style: GoogleFonts.openSans(fontWeight: FontWeight.w600, fontSize: 12, color: const Color(0xFF241957)),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 38),
                          child: Center(
                            child: Container(
                              height: 40,
                              width: 277,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: const Alignment(0, -1),
                                      end: const Alignment(0, 0),
                                      colors: [
                                        const Color(0xFF918FF2).withOpacity(0.9),
                                        const Color(0xFFAA89DF).withOpacity(0.4),
                                      ]),
                                  borderRadius: BorderRadius.circular(10)),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      shadowColor: Colors.transparent),
                                  onPressed: ref.watch(signinProvider).isChecked ? () {
                                    ref.read(signinProvider.notifier).loginUser(emailCont.text);
                                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomePage()), (route) => false);
                                  } : null,
                                  child: Text(
                                    "Sign in",
                                    style: GoogleFonts.openSans(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                        color: Colors.white),
                                  )),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don’t have an account?",
                                style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                    color: const Color(0xFF524E48)),
                              ),
                              SizedBox(
                                  //width: 80,
                                  child: TextButton(
                                      onPressed: () {
                                        print("hello");
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
                                      },
                                      child: Text(
                                        "Sign up",
                                        style: GoogleFonts.openSans(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14,
                                            color: const Color(0xFF4285F4)),
                                      )))
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width - 224, right: MediaQuery.of(context).size.width - 224, top: 10),
                          child: const Divider(height: 1, color: Color(0xFF959595),),
                        ),
                        const SizedBox(height: 20,)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
