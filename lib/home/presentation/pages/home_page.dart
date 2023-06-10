import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:study_teach/core/widgets/nav_bar.dart';
import 'package:study_teach/home/presentation/states/home_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var scaffoldKey = GlobalKey<ScaffoldState>();

    return ref.watch(getUserProvider).when(
        data: (value) {
          return Scaffold(
            key: scaffoldKey,
            drawer: NavBar(),
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              //centerTitle: true,
              leading: IconButton(onPressed: () {
                scaffoldKey.currentState?.openDrawer();
              }, icon: Image.asset("assets/images/menu_icon.png"), tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,),
              title: Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/hand_icon.png"),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text("Hello ${value.name}", style: GoogleFonts.openSans(fontWeight: FontWeight.w600, fontSize: 20),),
                  ),
                  Image.asset("assets/images/user_avatar.png"),
                ],
              ),
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
