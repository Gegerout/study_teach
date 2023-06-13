import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:study_teach/core/widgets/nav_bar.dart';
import 'package:study_teach/home/domain/usecases/user_usecase.dart';
import 'package:study_teach/home/presentation/pages/light_page.dart';
import 'package:study_teach/home/presentation/pages/notifications_page.dart';
import 'package:study_teach/home/presentation/pages/profile_page.dart';
import 'package:study_teach/home/presentation/pages/study_page.dart';
import 'package:study_teach/home/presentation/states/home_provider.dart';

var scaffoldKey = GlobalKey<ScaffoldState>();

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.value}) : super(key: key);

  final UserUseCase value;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screens = [
      HomeWidget(value: widget.value,),
      StudyPage(),
      LightPage(),
      NotificationsPage(),
      ProfilePage(),
    ];

    return Scaffold(
      key: scaffoldKey,
      drawer: const NavBar(),
      body: screens.elementAt(currentIndex),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 15, left: 28, right: 32),
        child: Material(
          color: Colors.transparent,
          elevation: 5,
          //shadowColor: Colors.transparent,
          borderRadius: BorderRadius.circular(100),
          child: Container(
            width: 354,
            height: 89,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 17, right: 37),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: () {
                    setState(() {
                      currentIndex = 0;
                    });
                  }, icon: Image.asset(currentIndex == 0 ? "assets/images/home_active.png" : "assets/images/home_non.png"),),
                  IconButton(onPressed: () {setState(() {
                    currentIndex = 1;
                  });}, icon: Image.asset(currentIndex == 1 ? "assets/images/study_active.png" : "assets/images/study_non.png"),),
                  IconButton(onPressed: () {setState(() {
                    currentIndex = 2;
                  });}, icon: Image.asset(currentIndex == 2 ? "assets/images/light_active.png" : "assets/images/light_non.png"),),
                  IconButton(onPressed: () {setState(() {
                    currentIndex = 3;
                  });}, icon: Image.asset(currentIndex == 3 ? "assets/images/notif_active.png" : "assets/images/notif_non.png"),),
                  IconButton(onPressed: () {setState(() {
                    currentIndex = 4;
                  });}, icon: Image.asset(currentIndex == 4 ? "assets/images/user_active.png" : "assets/images/user_non.png"),),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ScrollableHome extends ConsumerStatefulWidget {
  const ScrollableHome({Key? key}) : super(key: key);

  @override
  ConsumerState<ScrollableHome> createState() => _ScrollableHomeState();
}

class _ScrollableHomeState extends ConsumerState<ScrollableHome> {
  int? currentButton;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Center(
              child: Container(
                width: 348,
                height: 210,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: const LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color(0xFFA9CBFF),
                          Color(0xFF458BE7)
                        ]
                    )
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 19),
                          child: Text("Mulai \nBelajar", style: GoogleFonts.prozaLibre(fontWeight: FontWeight.w600, fontSize: 36, color: Colors.white),),
                        ),
                        const Spacer(),
                        Image.asset("assets/images/books_image.png")
                      ],
                    ),
                    Container(
                      width: 311,
                      height: 44,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.search, color: Color(0xFF9A9A9A),),
                            contentPadding: const EdgeInsets.only(left: 5),
                            hintText: "apa yang ingin kamu pelajari ?",
                            hintStyle: GoogleFonts.openSans(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: const Color(0xFF9A9A9A)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none
                            )
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 28, left: 32),
            child: SizedBox(
              height: 35,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  InkWell(
                    onTap: () {
                      ref.read(gurusProvider.notifier).selectSubject("kimia");
                      setState(() {
                        currentButton = 0;
                      });
                    },
                    child: Container(
                      width: 77,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11),
                          color: currentButton == 0 ? const Color(0xFFC7C3C3) : const Color(0xFFF4F4F4)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/study_1.png"),
                          Text("kimia", style: GoogleFonts.openSans(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: const Color(0xFF5F5F5F)),)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 14,),
                  InkWell(
                    onTap: () {
                      ref.read(gurusProvider.notifier).selectSubject("matematika");
                      setState(() {
                        currentButton = 1;
                      });
                    },
                    child: Container(
                      width: 120,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11),
                          color: currentButton == 1 ? const Color(0xFFC7C3C3) : const Color(0xFFF4F4F4)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/study_2.png"),
                          Text("matematika", style: GoogleFonts.openSans(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: const Color(0xFF5F5F5F)),)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 14,),
                  InkWell(
                    onTap: () {
                      ref.read(gurusProvider.notifier).selectSubject("fisika");
                      setState(() {
                        currentButton = 2;
                      });
                    },
                    child: Container(
                      width: 75,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11),
                          color: currentButton == 2 ? const Color(0xFFC7C3C3) : const Color(0xFFF4F4F4)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/study_3.png"),
                          Text("fisika", style: GoogleFonts.openSans(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: const Color(0xFF5F5F5F)),)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 14,),
                  InkWell(
                    onTap: () {
                      ref.read(gurusProvider.notifier).selectSubject("bahasa inggris");
                      setState(() {
                        currentButton = 3;
                      });
                    },
                    child: Container(
                      width: 121,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11),
                          color: currentButton == 3 ? const Color(0xFFC7C3C3) : const Color(0xFFF4F4F4)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/study_4.png"),
                          Text("bahasa inggris", style: GoogleFonts.openSans(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: const Color(0xFF5F5F5F)),)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 14,),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32, top: 42),
            child: Row(
              children: [
                Image.asset("assets/images/blue_line.png"),
                const SizedBox(width: 5,),
                Text("Rekomendasi Guru", style: GoogleFonts.openSans(fontWeight: FontWeight.w600, fontSize: 18),)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32, top: 29),
            child: SizedBox(
              height: 250,
              child: Builder(
                  builder: (context) {
                    if(currentButton != null) {
                      if(currentButton == 1) {
                        return ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            userCard("assets/images/avatar_3.png", "Firdaus Riski ", "Guru Matematika", "3219"),
                            const SizedBox(width: 18),
                          ],
                        );
                      }
                      else if(currentButton == 2) {
                        return ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            userCard("assets/images/avatar_2.png", "Muhammad", "Guru Fisika", "1581"),
                            const SizedBox(width: 18,),
                          ],
                        );
                      }
                      else if(currentButton == 3) {
                        return ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            userCard("assets/images/avatar_1.png", "Anika Rahman", "Guru Bahasa Inggris", "1581"),
                            const SizedBox(width: 18,),
                          ],
                        );
                      }
                      return Container();
                    }
                    return ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        userCard("assets/images/avatar_1.png", "Anika Rahman", "Guru Bahasa Inggris", "1581"),
                        const SizedBox(width: 18,),
                        userCard("assets/images/avatar_2.png", "Muhammad", "Guru Fisika", "1581"),
                        const SizedBox(width: 18,),
                        userCard("assets/images/avatar_3.png", "Firdaus Riski ", "Guru Matematika", "3219"),
                        const SizedBox(width: 18),
                      ],
                    );
                  }
              ),
            ),
          ),
          const SizedBox(height: 40,)
        ],
      ),
    );
  }

  Widget userCard(String image, String name, String work, String likes) {
    return Center(
      child: Container(
        width: 150,
        height: 233,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white
        ),
        child: Material(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 5,
          child: Column(
            children: [
              const SizedBox(height: 15,),
              Image.asset(image),
              const SizedBox(height: 11.84,),
              Text(name, style: GoogleFonts.openSans(fontWeight: FontWeight.w600, fontSize: 16),),
              Text(work, style: GoogleFonts.openSans(fontWeight: FontWeight.w400, fontSize: 12, color: const Color(0xFF5F5F5F)),),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 11, right: 9),
                child: Row(
                  children: [
                    Image.asset("assets/images/like_icon.png", height: 24, width: 24,),
                    Text(likes, style: GoogleFonts.openSans(fontWeight: FontWeight.w600, fontSize: 12, color: const Color(0xFF468CE7)),),
                    const Spacer(),
                    Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color(0xFF4A8EE8)
                      ),
                      child: const Center(
                        child: Icon(Icons.bookmark_border_outlined, color: Colors.white, size: 18,),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


class HomeWidget extends ConsumerStatefulWidget {
  const HomeWidget({Key? key, required this.value}) : super(key: key);

  final UserUseCase value;

  @override
  ConsumerState<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends ConsumerState<HomeWidget> {

  @override
  void initState() {
    super.initState();
    ref.refresh(getAvatarProvider);
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(getUserProvider).when(
        data: (value) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                elevation: 0,
                //centerTitle: true,
                leading: IconButton(onPressed: () {
                  scaffoldKey.currentState?.openDrawer();
                }, icon: Image.asset("assets/images/menu_icon.png"), tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,),
                title: Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 44),
                      child: Image.asset("assets/images/hand_icon.png"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text("Hello ${widget.value.name}", style: GoogleFonts.openSans(fontWeight: FontWeight.w600, fontSize: 20, color: Colors.black),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 53),
                      child: ref.watch(getAvatarProvider).value == null ? Image.asset("assets/images/user_avatar.png") : ClipRRect(borderRadius: BorderRadius.circular(50), child: SizedBox(width: 50, height:50, child: Image.file(File(ref.watch(getAvatarProvider).value!), width: 50, height: 50, fit: BoxFit.fill,))),
                    ),
                  ],
                ),
              ),
              body: ScrollableHome()
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
        )
    );
  }
}
