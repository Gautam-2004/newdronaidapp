import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/colors.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

// pickImage () async {

  
// FilePickerResult? pickedImg= 
//   await FilePicker.platform.pickFiles(type: FileType.image);
//   if( pickedImg != null){
//     return await File(pickedImg.files.single.path!).readAsBytes();
//   }
// }

class _InfoPageState extends State<InfoPage> {

  

  int _currentCarouselImage = 0;

  final List<String> imgList = [
    'assets/about_us.jpg',
    'assets/drone_hex.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 1.6,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: kPrimaryLightColor,
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 1.8,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(200),
                      ),
                    ),
                    child: Container(
                      padding: EdgeInsets.only(top: 140),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(
                                'Contact Us',
                                style: GoogleFonts.abel(
                                  fontSize: 50,
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            ListTile(
                              title: Text(
                                'Email Address',
                                style: GoogleFonts.abel(
                                  fontSize: 25,
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                'info@dronaid.in',
                                style: GoogleFonts.abel(
                                  fontSize: 20,
                                  color: primaryColor,
                                ),
                              ),
                            ),
                            ListTile(
                              title: Text(
                                'Address info',
                                style: GoogleFonts.abel(
                                  fontSize: 25,
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                'Dronaid WS, MIT Campus, Manipal, KA, IN 576104',
                                style: GoogleFonts.abel(
                                  fontSize: 20,
                                  color: primaryColor,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 200, // Specify the desired width
                      height: 200, // Specify the desired height
                      child: Image.asset(
                        'assets/logo_nobg.png',
                        fit: BoxFit
                            .contain, // Adjust the fit based on your needs
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height / 2.245,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(80),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height / 2.245,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(
                    top: 40,
                    bottom: 40,
                  ),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(80),
                        topRight: Radius.circular(80)),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        
                                                Container(
                          padding: EdgeInsets.only(left: 30),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Updates',
                              style: GoogleFonts.actor(
                                fontSize: 30,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CarouselSlider(
                          items: imgList
                              .map(
                                (e) => Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      print('object');
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(boxShadow: [
                                        BoxShadow(
                                          color: secondaryColor,
                                          blurRadius: 40,
                                        ),
                                      ]),
                                      child: ClipRRect(
                                        child: Image.asset(e),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          options: CarouselOptions(
                              initialPage: 0,
                              autoPlay: true,
                              autoPlayInterval: Duration(seconds: 2),
                              enlargeCenterPage: true,
                              onPageChanged: (value, _) {
                                setState(() {
                                  _currentCarouselImage = value;
                                });
                              }),
                        ),
                        Container(
                          height: 10,
                        ),
                        buildCarouselIndicator(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCarouselIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < imgList.length; i++)
          Container(
            margin: const EdgeInsets.all(5),
            height: i == _currentCarouselImage ? 7 : 5,
            width: i == _currentCarouselImage ? 7 : 5,
            decoration: BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.circle,
            ),
          ),
      ],
    );
  }
}