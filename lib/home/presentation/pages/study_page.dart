import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:study_teach/home/presentation/pages/home_page.dart';

class StudyPage extends StatefulWidget {
  StudyPage({Key? key}) : super(key: key);

  @override
  State<StudyPage> createState() => _StudyPageState();
}

class _StudyPageState extends State<StudyPage> {
  GlobalKey firstKey = GlobalKey();

  GlobalKey secondKey = GlobalKey();

  late Offset tapXY;
  late Offset tapXY2;

  late RenderBox overlay;
  late RenderBox overlay2;

  @override
  Widget build(BuildContext context) {
    overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
    overlay2 = Overlay.of(context).context.findRenderObject() as RenderBox;

    void _showPopupMenu1() async {
      await showMenu(
        context: context,
        position: relRectSize,
        items: [
          const PopupMenuItem<String>(
              child: Text('One'), value: 'Doge'),
          const PopupMenuItem<String>(
              child: Text('Two'), value: 'Lion'),
        ],
        elevation: 8.0,
      );
    }

    void _showPopupMenu2() async {
      await showMenu(
        context: context,
        position: relRectSize2,
        items: [
          const PopupMenuItem<String>(
              child: Text('One'), value: 'Doge'),
          const PopupMenuItem<String>(
              child: Text('Two'), value: 'Lion'),
        ],
        elevation: 8.0,
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(onPressed: () {
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomePage()), (route) => false);
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
                onTapDown: getPosition,
                onLongPress: _showPopupMenu1,
                child: IconButton(
                    onPressed: () {
                  _showPopupMenu1();
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
                                    onTapDown: getPosition2,
                                    onLongPress: _showPopupMenu2,
                                    child: IconButton(onPressed: () {
                                      //print("hello");
                                      _showPopupMenu2();
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
  }

  RelativeRect get relRectSize => RelativeRect.fromSize(tapXY & const Size(40,40), overlay.size);
  RelativeRect get relRectSize2 => RelativeRect.fromSize(tapXY2 & const Size(40,40), overlay2.size);

  // ↓ get the tap position Offset
  void getPosition(TapDownDetails detail) {
    tapXY = detail.globalPosition;
  }
  void getPosition2(TapDownDetails detail) {
    tapXY2 = detail.globalPosition;
  }
}
