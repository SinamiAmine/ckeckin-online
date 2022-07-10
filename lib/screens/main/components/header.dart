import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/controllers/MenuController.dart';
import 'package:news/responsive.dart';

import '../../../constants.dart';
import 'socal.dart';
import 'web_menu.dart';

class Header extends StatelessWidget {
  final MenuController _controller = Get.put(MenuController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: kDarkBlackColor,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              constraints: BoxConstraints(maxWidth: kMaxWidth),
              padding: EdgeInsets.all(kDefaultPadding),
              child: Column(
                children: [
                  Row(
                    children: [
                      if (!Responsive.isDesktop(context))
                        IconButton(
                          icon: Icon(
                            Icons.menu,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            _controller.openOrCloseDrawer();
                          },
                        ),
                      //Image.asset("assets/images/onlickcheckin.png",height: 100,width: 100,),
                      Text("Check In Online",style: GoogleFonts.lobster(
                        color: Colors.red,
                        fontWeight: FontWeight.w600,
                        fontSize: 20

                      )),
                      Spacer(),
                      if (Responsive.isDesktop(context)) WebMenu(),
                      Spacer(),
                      // Socal
                      Socal(),
                    ],
                  ),
                  SizedBox(height: kDefaultPadding ),
                 /* Text(
                    "Interface Reservation",style: GoogleFonts.lobster(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20

                  )
                  ),*/
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: kDefaultPadding),
                    child: Text(
                      "Effectuez directement votre réservation à tout moment et où que vous soyez, \nrouvez à coup sûr les coordonnées et tarifs de plusieurs établissements.\n En quelques clics, découvrez les solutions tarifaires les plus attractives et accédez aux meilleures offres disponibles dans tout le pays.",
                      textAlign: TextAlign.center,
                        style: GoogleFonts.secularOne(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 16
                        )
                    ),
                  ),
                  if (Responsive.isDesktop(context))
                    SizedBox(height: kDefaultPadding),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
