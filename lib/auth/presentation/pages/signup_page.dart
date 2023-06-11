import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:study_teach/auth/presentation/pages/signin_page.dart';
import 'package:study_teach/auth/presentation/states/auth_provider.dart';
import 'package:study_teach/core/utils/textinput_formatter.dart';
import 'package:study_teach/home/presentation/pages/home_page.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  final TextEditingController nameCont = TextEditingController();
  final TextEditingController phoneCont = TextEditingController();
  final TextEditingController emailCont = TextEditingController();
  final TextEditingController passwordCont = TextEditingController();

  bool isVisible = false;

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
                  "Sign up",
                  style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w700,
                      fontSize: 36,
                      color: Colors.white),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.03),
                child: Container(
                  height: height * 0.62,
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
                            "Create account",
                            style: GoogleFonts.openSans(
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                color: const Color(0xFF3D2C8D)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 34),
                          child: Text(
                            "Hello there, fill in below to create \nan account",
                            style: GoogleFonts.openSans(
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                                color: const Color(0xFFA9A297)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 29, top: 20),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Image.asset("assets/images/user_icon.png"),
                              ),
                              Text(
                                "Full name",
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
                              controller: nameCont,
                              onChanged: (value) {
                                ref.read(signupProvider.notifier).checkCreds(value, phoneCont.text, emailCont.text, passwordCont.text);
                              },
                              style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 11,
                                  color: const Color(0xFF888888)),
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(left: 18),
                                  suffixIcon: ref.watch(signupProvider).isName ? Image.asset("assets/images/success_icon.png") : const Icon(Icons.close, color: Color(0xFFEB4335),),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none),
                                  hintText: "Enter your full name",
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
                                child:
                                    Image.asset("assets/images/phone_icon.png"),
                              ),
                              Text(
                                "Phone number",
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
                              controller: phoneCont,
                              keyboardType: TextInputType.phone,
                              onChanged: (value) {
                                ref.read(signupProvider.notifier).checkCreds(nameCont.text, value, emailCont.text, passwordCont.text);
                              },
                              style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 11,
                                  color: const Color(0xFF888888)),
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(left: 18),
                                  suffixIcon: ref.watch(signupProvider).isPhone ? Image.asset("assets/images/success_icon.png") : const Icon(Icons.close, color: Color(0xFFEB4335),),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none),
                                  hintText: "Enter your phone number",
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
                                child: Image.asset("assets/images/mail_icon.png"),
                              ),
                              Text(
                                "Email address",
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
                                ref.read(signupProvider.notifier).checkCreds(nameCont.text, phoneCont.text, value, passwordCont.text);
                              },
                              style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 11,
                                  color: const Color(0xFF888888)),
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(left: 18),
                                  suffixIcon: ref.watch(signupProvider).isEmail ? Image.asset("assets/images/success_icon.png") : const Icon(Icons.close, color: Color(0xFFEB4335),),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none),
                                  hintText: "Enter your email address",
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
                                ref.read(signupProvider.notifier).checkCreds(nameCont.text, phoneCont.text, emailCont.text, value);
                              },
                              style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 11,
                                  color: const Color(0xFF888888)),
                              obscureText: !isVisible,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(left: 18),
                                  suffixIcon: IconButton(onPressed: () {
                                    setState(() {
                                      isVisible = !isVisible;
                                    });
                                  }, icon: isVisible ? Icon(Icons.visibility_off, color: ref.watch(signupProvider).isPassword ? const Color(0xFF007BFF) : const Color(0xFFEB4335,),) : Icon(Icons.visibility, color: ref.watch(signupProvider).isPassword ? const Color(0xFF007BFF) : const Color(0xFFEB4335,)),),
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
                                  onPressed: ref.watch(signupProvider).isChecked ? () {
                                    ref.read(signupProvider.notifier).createUser(nameCont.text, phoneCont.text, emailCont.text);
                                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomePage()), (route) => false);
                                  } : null,
                                  child: Text(
                                    "Sign up",
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
                                "I’m already a member",
                                style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                    color: const Color(0xFF524E48)),
                              ),
                              SizedBox(
                                width: 71,
                                  child: TextButton(
                                      onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignInPage()));
                                      },
                                      child: Text(
                                        "Sign in",
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
                        const SizedBox(height: 80,)
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
