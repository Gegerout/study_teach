import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:study_teach/onboarding/presentation/pages/welcome_screen.dart';
import 'package:study_teach/onboarding/presentation/states/onboardingProvider.dart';

class OnboardingPage extends ConsumerWidget {
  OnboardingPage({Key? key}) : super(key: key);

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int index = ref.watch(onboardingStates);

    return ref.watch(onboardingProvider).when(
        data: (value) {
          return Scaffold(
            body: PageView(
              controller: pageController,
              onPageChanged: (index) {
                ref.read(onboardingStates.notifier).changeIndex(index);
              },
              children: [
                onboardingCard(
                    context, value[0].image, value[0].subtitle, index),
                onboardingCard(
                    context, value[1].image, value[1].subtitle, index),
                onboardingCard(
                    context, value[2].image, value[2].subtitle, index)
              ],
            ),
          );
        },
        error: (error, stacktrace) {
          return Scaffold(
            body: Center(
              child: Text(error.toString()),
            ),
          );
        },
        loading: () => const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ));
  }

  Widget onboardingCard(
      BuildContext context, String image, String subtitle, int index) {
    final height = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Center(
            child: Image.asset(
          image,
          width: double.infinity,
          fit: BoxFit.fill,
        )),
        Center(
            child: Image.asset(
          "assets/images/blue_blur.png",
          width: double.infinity,
          fit: BoxFit.fill,
        )),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: height * 0.25),
              child: Center(
                  child: Text(
                "StudyTeach",
                style: GoogleFonts.passeroOne(
                    fontWeight: FontWeight.w400,
                    fontSize: 64,
                    color: const Color(0xFFF9B208)),
              )),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 28),
              child: Text(
                "Selamat Datang",
                style: GoogleFonts.openSans(
                    fontWeight: FontWeight.w700,
                    fontSize: 36,
                    color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Text(
                subtitle,
                style: GoogleFonts.openSans(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: DotsIndicator(
                position: index,
                dotsCount: 3,
                decorator: const DotsDecorator(
                    activeColor: Colors.white,
                    activeSize: Size(12, 12),
                    size: Size(6, 6),
                    color: Colors.white,
                    spacing: EdgeInsets.all(20)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: onboardingButton(context),
            )
          ],
        )
      ],
    );
  }

  Widget onboardingButton(BuildContext context) {
    return Container(
      width: 197,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          begin: Alignment(0, 0),
          end: Alignment(1, 1),
          colors: [
            Color(0xFF7EC9F5),
            Color(0xFF3957ED)
          ]
        )
      ),
      child: ElevatedButton(
          onPressed: () {
            if(pageController.page!.toInt() == 2) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
            }
            else {
              pageController.animateToPage(pageController.page!.toInt() + 1, duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
          child: Text(
            "Selanjutnya",
            style: GoogleFonts.oxygen(
                fontWeight: FontWeight.w700, fontSize: 18, color: Colors.white),
          )
      ),
    );
  }
}
