import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:study_teach/home/data/repositories/data_repository.dart';
import 'package:study_teach/home/presentation/pages/home_page.dart';

import '../../../main.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key, this.name, this.surname}) : super(key: key);

  final String? name;
  final String? surname;

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController controller;

  @override
  void initState() {
    super.initState();
    controller = CameraController(cameras[0], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      print(e);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  takePhoto() async {
    await controller.setFlashMode(FlashMode.auto);
    final file = await controller.takePicture();
    await DataRepository().saveAvatar(file.path);
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomePage()), (route) => false);
    //Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: CameraPreview(controller),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                        child: FloatingActionButton(
                          heroTag: "btn1",
                          backgroundColor: Colors.red,
                          onPressed: () async {
                            if(!controller.value.isInitialized) {
                              return null;
                            }
                            if(controller.value.isTakingPicture) {
                              return null;
                            }
                            try {
                              takePhoto();
                            } on CameraException catch (e) {
                              return null;
                            }
                          }, child: const Icon(Icons.camera),)
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}