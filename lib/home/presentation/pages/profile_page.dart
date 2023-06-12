import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:study_teach/home/presentation/states/home_provider.dart';

import 'camera_page.dart';
import 'home_page.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {

  refresh() {
    setState(() {
    });
  }

  @override
  void initState() {
    super.initState();
    ref.refresh(getUserProvider);
    ref.refresh(getAvatarProvider);
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(getUserProvider).when(
        data: (value) {
          if(value != null) {
            return Scaffold(
                backgroundColor: const Color(0xFFEBECF6),
                appBar: AppBar(
                    backgroundColor: const Color(0xFFEBECF6),
                    elevation: 0,
                    //centerTitle: true,
                    leading: IconButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage(value: value!,)),
                                (route) => false);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        size: 18,
                        color: Colors.black,
                      ),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //const SizedBox(width: 0,),
                        Text(
                          "Akun Saya",
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Colors.black),
                        ),
                      ],
                    )),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 47, top: 12),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () async {
                                final bool result = await Navigator.push(context, MaterialPageRoute(builder: (context) => CameraPage()));
                                if(result) {
                                  ref.refresh(getAvatarProvider);
                                }
                              },
                              child: Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  SizedBox(
                                      height: 65, width: 65, child: CircleAvatar(
                                    child: ref.watch(getAvatarProvider).value == null ? Image.asset("assets/images/avatar_1.png") : SizedBox(width: 65, height:65, child: ClipRRect(borderRadius: BorderRadius.circular(50), child: Image.file(File(ref.watch(getAvatarProvider).value!),fit: BoxFit.fill))),
                                  )),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Container(
                                        width: 21,
                                        height: 21,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50),
                                            color: const Color(0xFF7598A7)),
                                        child: const Icon(
                                          Icons.edit,
                                          size: 15,
                                          color: Color(0xFF36402F),
                                        )),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 29),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    value!.name,
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500, fontSize: 14),
                                  ),
                                  Text(
                                    value.email,
                                    style: GoogleFonts.portLligatSlab(
                                        fontWeight: FontWeight.w400, fontSize: 14),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    value.phone,
                                    style: GoogleFonts.openSans(
                                        fontWeight: FontWeight.w700, fontSize: 10),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 28),
                        child: Container(
                            width: 327,
                            height: 32,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white
                            ),
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )
                                ),
                                child: Text(
                                  "Ubah Profil",
                                  style: GoogleFonts.pavanam(
                                      fontWeight: FontWeight.w400, fontSize: 14, color: Colors.black),
                                ))),
                      ),
                      const SizedBox(height: 46,),
                      Container(
                        width: 363,
                        height: 287,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 22, top: 14, right: 42),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Data Pribadi", style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 16),),
                              const SizedBox(height: 5,),
                              Text("Nama Lengkap", style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 12,)),
                              TextFormField(
                                style: GoogleFonts.openSans(fontWeight: FontWeight.w700, fontSize: 12),
                                decoration: InputDecoration(
                                  hintText: "Nama Lengkap",
                                  hintStyle: GoogleFonts.openSans(fontWeight: FontWeight.w700, fontSize: 12),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 9,),
                              Text("Tempat tgl lahir", style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 12,)),
                              TextFormField(
                                style: GoogleFonts.openSans(fontWeight: FontWeight.w700, fontSize: 12),
                                decoration: InputDecoration(
                                  hintText: "Tempat tgl lahir",
                                  hintStyle: GoogleFonts.openSans(fontWeight: FontWeight.w700, fontSize: 12),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 9,),
                              Text("Jenis Kelamin", style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 12,)),
                              TextFormField(
                                style: GoogleFonts.openSans(fontWeight: FontWeight.w700, fontSize: 12),
                                decoration: InputDecoration(
                                  hintText: "Jenis Kelamin",
                                  hintStyle: GoogleFonts.openSans(fontWeight: FontWeight.w700, fontSize: 12),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 37,),
                      Container(
                        width: 363,
                        height: 347,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 22, top: 14, right: 42),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Detail Alamat", style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 16),),
                              TextFormField(
                                style: GoogleFonts.openSans(fontWeight: FontWeight.w700, fontSize: 12),
                                decoration: InputDecoration(
                                  hintText: "Something",
                                  hintStyle: GoogleFonts.openSans(fontWeight: FontWeight.w700, fontSize: 12),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 24,),
                              Text("Sekolah Asal", style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 14,)),
                              TextFormField(
                                style: GoogleFonts.openSans(fontWeight: FontWeight.w700, fontSize: 12),
                                decoration: InputDecoration(
                                  hintText: "Sekolah Asal",
                                  hintStyle: GoogleFonts.openSans(fontWeight: FontWeight.w700, fontSize: 12),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 9,),
                              Text("Nama Orang tua", style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 12,)),
                              TextFormField(
                                style: GoogleFonts.openSans(fontWeight: FontWeight.w700, fontSize: 12),
                                decoration: InputDecoration(
                                  hintText: "Nama Orang tua",
                                  hintStyle: GoogleFonts.openSans(fontWeight: FontWeight.w700, fontSize: 12),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 9,),
                              Text("No.Hp Orang tua", style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 12,)),
                              TextFormField(
                                style: GoogleFonts.openSans(fontWeight: FontWeight.w700, fontSize: 12),
                                decoration: InputDecoration(
                                  hintText: "No.Hp Orang tua",
                                  hintStyle: GoogleFonts.openSans(fontWeight: FontWeight.w700, fontSize: 12),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 30,)
                    ],
                  ),
                ));
          }
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
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
}
