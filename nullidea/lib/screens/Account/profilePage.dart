import 'package:flutter/material.dart';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nullidea/screens/Login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';
import '../../handleRequests.dart';
import '../../theme.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

import '../../user.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File cropped;
  bool sessionEnded = false;
//TODO needed to preload data from cash
  //------------------------------------------------//

  Widget decideImage() {
    if (User.profilePhoto == null) {
      getImageFromAWS(User.email);
      return ClipRRect(
        borderRadius: new BorderRadius.circular(360),
        child: CachedNetworkImage(
          imageUrl: tempImageUrl,
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(
            Icons.person,
            size: 100,
            color: primaryColor,
          ),
          width: 100,
          height: 100,
        ),
      );
    } else {
      print("Sending request");
      getPhoto(User.email, User.profilePhoto);
      return ClipRRect(
        borderRadius: new BorderRadius.circular(360),
        child: Image.file(
          User.profilePhoto,
          width: 100,
          height: 100,
        ),
      );
    }
  }

  openGallery(BuildContext context) async {
    var picture = await ImagePicker().getImage(source: ImageSource.gallery);
    cropped = await ImageCropper.cropImage(
        sourcePath: picture.path,
        cropStyle: CropStyle.circle,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
        maxWidth: 1200,
        maxHeight: 1200,
        compressFormat: ImageCompressFormat.jpg);

    this.setState(() {
      User.profilePhoto = cropped;

      Navigator.of(context).pop();
    });
  }

  openCamera(BuildContext context) async {
    var picture = await ImagePicker().getImage(source: ImageSource.camera);
    cropped = await ImageCropper.cropImage(
        sourcePath: picture.path,
        cropStyle: CropStyle.circle,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
        maxWidth: 1000,
        maxHeight: 1000,
        compressFormat: ImageCompressFormat.jpg);

    this.setState(() {
      User.profilePhoto = cropped;
      Navigator.of(context).pop();
    });
  }

  Future<void> showChoiseDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: primaryColor,
          title: Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Text(
              "Open with:",
              style: GoogleFonts.ubuntuMono(
                  fontSize: 22.0,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
            ),
          ),
          content: SingleChildScrollView(
              child: ListBody(
            children: <Widget>[
              GestureDetector(
                child: Center(
                  child: Text(
                    "Gallery",
                    style: GoogleFonts.ubuntuMono(
                        fontSize: 20.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.black),
                  ),
                ),
                onTap: () {
                  openGallery(context);
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Divider(
                    color: Colors.black,
                    thickness: 1.5,
                    indent: 50,
                    endIndent: 50,
                  ),
                ),
              ),
              GestureDetector(
                child: Center(
                    child: Text(
                  "Camera",
                  style: GoogleFonts.ubuntuMono(
                      fontSize: 20.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                )),
                onTap: () {
                  openCamera(context);
                },
              )
            ],
          )),
        );
      },
    );
  }

  ListView profilePage(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 24, 0, 24),
              child: Container(
                alignment: Alignment.center,
                child: Row(children: [
                  Container(
                    height: 120,
                    decoration: ShapeDecoration(
                        shape: CircleBorder(
                            side: BorderSide(width: 2, color: primaryColor))),
                    child: FlatButton(
                      onPressed: () {
                        showChoiseDialog(context);
                      },
                      child: decideImage(),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: userextradata("Entries", primaryColor, 14.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: userextradata("234", Colors.white, 16.0),
                      ),
                      Padding(
                          padding: EdgeInsets.fromLTRB(18, 18, 0, 0),
                          child: userextradata("Rating", Colors.yellow, 16.0)),
                      Padding(
                          padding: EdgeInsets.fromLTRB(18, 0, 0, 18),
                          child: userextradata("4553", Colors.white, 20.0)),
                      Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: userextradata("Earned", primaryColor, 14.0)),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: userextradata("543", Colors.white, 16.0),
                      ),
                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: Container(
                      child: Image.asset(
                        'assets/images/trophy.png',
                        scale: 2,
                      ),
                      alignment: Alignment.topLeft,
                    ),
                  ),
                ]),
              ),
            ),
            Divider(
              color: primaryColor,
              thickness: 1.5,
              endIndent: 24,
              indent: 24,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Container(
            width: double.infinity,
            height: 110,
            decoration: BoxDecoration(
              color: Colors.grey.shade900,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        )
      ],
    );
  }

  Padding userdata(String text, Color color, double size) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: GoogleFonts.ubuntu(
            fontSize: size, fontWeight: FontWeight.w600, color: color),
      ),
    );
  }

  Text userextradata(String text, Color color, double size) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: GoogleFonts.ubuntu(
          fontSize: size, fontWeight: FontWeight.w600, color: color),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: profilePage(context),
    );
  }
}

void openEndDrawer() {
  scaffoldKeyAccountRouter.currentState.openEndDrawer();
}

Future<void> closeSession() async {
  final sessionStatus = await SharedPreferences.getInstance();
  await sessionStatus.setBool('isLogged', false);
  final sessionMail = await SharedPreferences.getInstance();
  await sessionMail.clear();
}

Drawer rightBar(BuildContext context) {
  return Drawer(
    child: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
      Container(
        child: Center(
          child: Text(
            User.username,
            style: GoogleFonts.ubuntu(
                fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black),
          ),
        ),
        height: 55,
        width: double.infinity,
        color: primaryColor,
      ),
      RaisedButton(
        color: Colors.black,
        onPressed: () {
          closeSession();

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Login()),
          );
        },
        child: settingsBar(Icons.exit_to_app, "Log Out", 0, 16),
      ),
      Expanded(
        child: Align(
          child: settingsBar(Icons.settings, "Settings", 16, 16),
          alignment: Alignment.bottomCenter,
        ),
      ),
    ]),
  );
}

Container settingsBar(IconData icon, String text, double left, double right) {
  return Container(
    child: Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(left, 0, right, 0),
          child: Icon(
            icon,
            color: primaryColor,
            size: 24,
          ),
        ),
        Text(
          text,
          style: GoogleFonts.ubuntu(
              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ],
    ),
    height: 55,
    color: Colors.black,
  );
}
