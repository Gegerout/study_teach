import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:study_teach/home/presentation/pages/home_page.dart';
import 'package:study_teach/home/presentation/pages/notifikasi_page.dart';
import 'package:study_teach/home/presentation/states/home_provider.dart';

class StudyPage extends ConsumerStatefulWidget {
  const StudyPage({Key? key}) : super(key: key);

  @override
  ConsumerState<StudyPage> createState() => _StudyPageState();
}

class _StudyPageState extends ConsumerState<StudyPage> {
  GlobalKey firstKey = GlobalKey();

  GlobalKey secondKey = GlobalKey();

  @override
  Widget build(BuildContext context) {

    void showPopupMenu1() async {
      await showMenu(
        context: context,
        position: const RelativeRect.fromLTRB(344.7, 55.6, 26.7, 587.8),
        items: [
          PopupMenuItem<String>(
              value: 'One',
              child: InkWell( onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => NotifikasiPage()));
              }, child: const Text('One')),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => NotifikasiPage()));
            },
          ),
          const PopupMenuItem<String>(
              value: 'Two',
              child: Text('Two')),
        ],
        elevation: 8.0,
      );
    }

    void showPopupMenu2() async {
      await showMenu(
        context: context,
        position: const RelativeRect.fromLTRB(334.1, 477.7, 37.3, 165.8),
        items: [
          const PopupMenuItem<String>(
              value: 'One',
              child: Text('One')),
          const PopupMenuItem<String>(
              value: 'Two',
              child: Text('Two')),
        ],
        elevation: 8.0,
      );
    }

    return ref.watch(getUserProvider).when(data: (value) {
      return Scaffold(
          appBar: AppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0,
              centerTitle: true,
              leading: IconButton(onPressed: () {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomePage(value: value!,)), (route) => false);
              }, icon: const Icon(Icons.arrow_back_ios_new, size: 16, color: Colors.black,),),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 80,),
                  Text("Detail", style: GoogleFonts.openSans(fontWeight: FontWeight.w600, fontSize: 20, color: Colors.black),),
                  const SizedBox(width: 82,),
                  Container(
                    key: firstKey,
                    child: InkWell(
                      //onLongPress: _showPopupMenu1,
                      child: IconButton(
                          onPressed: () {
                            showPopupMenu1();
                          }, icon: const Icon(Icons.more_vert, color: Colors.black,)),
                    ),
                  )
                ],
              )
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Center(
                    child: Container(
                        width: 363,
                        height: 230,
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
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("assets/images/numbers_image.png", width: 304.47, height: 198.61, fit: BoxFit.scaleDown,),
                        )
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 14),
                  child: Text("Kursus online \ndalam matematika", style: GoogleFonts.prozaLibre(fontWeight: FontWeight.w700, fontSize: 28),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 14),
                  child: Text("Tim kami sebagian mengambil tugas \nmatematika", style: GoogleFonts.openSans(fontWeight: FontWeight.w400, fontSize: 17, color: const Color(0xFF9A9A9A)),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 31),
                  child: Row(
                    children: [
                      Image.asset("assets/images/like_icon.png", width: 24, height: 24,),
                      Text("785", style: GoogleFonts.openSans(fontWeight: FontWeight.w600, fontSize: 12, color: const Color(0xFF468CE7)),),
                      const SizedBox(width: 21,),
                      Image.asset("assets/images/flash_icon.png", width: 24, height: 24,),
                      Text("1k+", style: GoogleFonts.openSans(fontWeight: FontWeight.w600, fontSize: 12, color: const Color(0xFF9A9A9A)),)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 22),
                  child: Row(
                    children: [
                      Material(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)
                        ),
                        child: Container(
                          width: 59,
                          height: 59,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: Colors.white
                          ),
                          child: Center(
                            child: Image.asset("assets/images/study_active.png"),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("5 Contoh Soal", style: GoogleFonts.openSans(fontWeight: FontWeight.w600, fontSize: 16),),
                          Text("Contoh soal yaitu 5 yang sesuai permintaan", style: GoogleFonts.openSans(fontWeight: FontWeight.w400, fontSize: 14, color: const Color(0xFF5F5F5F)),)
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 15),
                  child: Row(
                    children: [
                      Material(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)
                        ),
                        child: Container(
                          width: 59,
                          height: 59,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: Colors.white
                          ),
                          child: Center(
                            child: Image.asset("assets/images/present_icon.png", width: 32, height: 32,),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("8 Artikel", style: GoogleFonts.openSans(fontWeight: FontWeight.w600, fontSize: 16),),
                          Text("total 8 artikel yang mudah dipahami", style: GoogleFonts.openSans(fontWeight: FontWeight.w400, fontSize: 14, color: const Color(0xFF5F5F5F)),)
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 17, left: 15),
                  child: Material(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child: Container(
                      width: 345,
                      height: 121,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Image.asset("assets/images/avatar_3.png", width: 95, height: 95,),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 16, left: 16),
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Firdaus Riski", style: GoogleFonts.openSans(fontWeight: FontWeight.w600, fontSize: 16),),
                                        Text("Guru Matematika", style: GoogleFonts.openSans(fontWeight: FontWeight.w400, fontSize: 14, color: const Color(0xFF5F5F5F))),
                                      ],
                                    ),
                                    const SizedBox(width: 50,),
                                    Padding(
                                      padding: const EdgeInsets.only(),
                                      child: InkWell(
                                        child: IconButton(onPressed: () {
                                          showPopupMenu2();
                                        }, icon: const Icon(Icons.more_vert,)),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: Row(
                                  children: [
                                    Image.asset("assets/images/like_icon.png", height: 24, width: 24,),
                                    Text("3219", style: GoogleFonts.openSans(fontWeight: FontWeight.w600, fontSize: 12, color: const Color(0xFF468CE7)),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 16, top: 8),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 61,
                                      height: 18,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(6),
                                          border: Border.all(color: const Color(0xFF9A9A9A), width: 1)
                                      ),
                                      child: Center(
                                        child: Text("matematika", style: GoogleFonts.openSans(fontWeight: FontWeight.w400, fontSize: 9, color: const Color(0xFF9A9A9A)),),
                                      ),
                                    ),
                                    const SizedBox(width: 5,),
                                    Container(
                                      width: 64,
                                      height: 18,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(6),
                                          border: Border.all(color: const Color(0xFF9A9A9A), width: 1)
                                      ),
                                      child: Center(
                                        child: Text("trigonometri", style: GoogleFonts.openSans(fontWeight: FontWeight.w400, fontSize: 9, color: const Color(0xFF9A9A9A)),),
                                      ),
                                    ),
                                    const SizedBox(width: 5,),
                                    Container(
                                      width: 48,
                                      height: 18,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(6),
                                          border: Border.all(color: const Color(0xFF9A9A9A), width: 1)
                                      ),
                                      child: Center(
                                        child: Text("geometri", style: GoogleFonts.openSans(fontWeight: FontWeight.w400, fontSize: 9, color: const Color(0xFF9A9A9A)),),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20,)
              ],
            ),
          )
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
}
