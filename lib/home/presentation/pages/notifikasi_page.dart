import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:study_teach/home/presentation/pages/video_page.dart';

class NotifikasiPage extends StatelessWidget {
  const NotifikasiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF5775BA),
        elevation: 0,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                    width: 414,
                    height: 104,
                    child: Image.asset("assets/images/notifikasi_ellipse.png",
                        fit: BoxFit.fill)),
                SizedBox(
                    width: 266,
                    child: Text(
                      "Notifikasi",
                      style: GoogleFonts.alata(
                          fontWeight: FontWeight.w400,
                          fontSize: 24,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 26, top: 25),
              child: Row(
                children: [
                  Image.asset("assets/images/notifikasi_sheet.png"),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Laporan Progres Belajar Mingguanmu",
                    style: GoogleFonts.alatsi(
                        fontWeight: FontWeight.w400, fontSize: 20),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 27, top: 21, right: 19),
              child: Row(
                children: [
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 2.0,
                            spreadRadius: 1.0,
                            offset: const Offset(2.0, 2.0),
                          )
                        ]),
                    child: Image.asset(
                      "assets/images/logo_image.png",
                      scale: 4,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "StudyTeach",
                        style: GoogleFonts.alatsi(
                            fontWeight: FontWeight.w400, fontSize: 14),
                      ),
                      Row(
                        children: [
                          Text(
                            "Kepada saya ",
                            style: GoogleFonts.alatsi(
                                fontWeight: FontWeight.w400, fontSize: 8),
                          ),
                          const Icon(
                            Icons.arrow_downward_rounded,
                            size: 12,
                          ),
                        ],
                      )
                    ],
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Image.asset("assets/images/arrow_back.png"),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 29),
              child: Center(
                  child: Text(
                "StudyTeach",
                style: GoogleFonts.passeroOne(
                    fontWeight: FontWeight.w400,
                    fontSize: 36,
                    color: const Color(0xFFF9B208)),
              )),
            ),
            const SizedBox(
              height: 15,
            ),
            Image.asset("assets/images/logo_image.png"),
            const SizedBox(
              height: 19,
            ),
            Text(
              "HI! Keira Herlambang \nprogres belajar mingguanmu \nsudah bagus",
              style:
                  GoogleFonts.alatsi(fontWeight: FontWeight.w400, fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 28,
            ),
            Text(
              "Progres belajarmu sudah bagus, lanjutkan dan tingkatkan semangat \nbelajar kamu!",
              style:
                  GoogleFonts.alatsi(fontWeight: FontWeight.w400, fontSize: 11),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 28,
            ),
            SizedBox(
              width: 191,
              height: 24,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      elevation: 10,
                      backgroundColor: const Color(0xFFE58A7B),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: Text(
                    "Lanjutkan Belajar",
                    style: GoogleFonts.alatsi(
                        fontWeight: FontWeight.w400,
                        fontSize: 11,
                        color: Colors.white),
                  )),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 46, right: 46, top: 37),
              child: Divider(
                height: 2,
                color: Color(0xFF888888),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/logo_image.png",
                    scale: 2,
                  ),
                  const SizedBox(
                    width: 19,
                  ),
                  Column(
                    children: [
                      Text(
                        "Latihan mengasah \nketerampilanmu !",
                        style: GoogleFonts.alatsi(
                            fontWeight: FontWeight.w400, fontSize: 13),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Belajar adalah kebiasaan sehat. \nBagaimana kalau berlatih di StudyTeach aja ?",
                        style: GoogleFonts.alatsi(
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                            color: const Color(0xFF9A9A9A)),
                        textAlign: TextAlign.center,
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            SizedBox(
              width: 191,
              height: 24,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      elevation: 10,
                      backgroundColor: const Color(0xFF0070D7),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: Text(
                    "Terus Berlatih",
                    style: GoogleFonts.alatsi(
                        fontWeight: FontWeight.w400,
                        fontSize: 11,
                        color: Colors.white),
                  )),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 46, right: 46, top: 15),
              child: Divider(
                height: 2,
                color: Color(0xFF888888),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 55, right: 59, top: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("13940 Penggilingan Cakung Jakarta Timur",
                          style: GoogleFonts.alatsi(
                              fontWeight: FontWeight.w400,
                              fontSize: 11,
                              color: const Color(0xFF9A9A9A))),
                      const SizedBox(height: 4,),
                      Text(
                        "Ayo berlangganan secara gratis !!! ",
                        style: GoogleFonts.alatsi(
                            fontWeight: FontWeight.w400, fontSize: 10),
                      )
                    ],
                  ),
                  const Spacer(),
                  InkWell(child: Image.asset("assets/images/instagram.png")),
                  const SizedBox(width: 10,),
                  InkWell(child: Image.asset("assets/images/twitter.png")),
                  const SizedBox(width: 10,),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => VideoPage()));
                    },
                      child: Image.asset("assets/images/youtube.png")
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 46, top: 33),
              child: Row(
                children: [
                  SizedBox(
                    width: 64,
                    height: 27,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                            elevation: 0,
                            backgroundColor: const Color(0xFF89B8FF),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/arrow_back.png", scale: 2,),
                            const SizedBox(width: 4,),
                            Text(
                              "Balas",
                              style: GoogleFonts.alatsi(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                  color: Colors.white),
                            )
                          ],
                        )
                    ),
                  ),
                  const SizedBox(width: 14,),
                  SizedBox(
                    width: 73,
                    height: 27,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            elevation: 0,
                            backgroundColor: const Color(0xFFFF7777).withOpacity(0.69),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.arrow_circle_right_rounded, color: Colors.black,),
                            const SizedBox(width: 4,),
                            Text(
                              "Teruskan",
                              style: GoogleFonts.alatsi(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                  color: Colors.white),
                            )
                          ],
                        )
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
