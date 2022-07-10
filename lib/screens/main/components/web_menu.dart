import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/controllers/MenuController.dart';

import '../../../constants.dart';

class WebMenu extends StatelessWidget {
  final MenuController _controller = Get.put(MenuController());

  @override
  Widget build(BuildContext context) {
    return WebMenuItem();
  }
}

class WebMenuItem extends StatefulWidget {
  const WebMenuItem({
    Key? key,

  }) : super(key: key);



  @override
  _WebMenuItemState createState() => _WebMenuItemState();
}

class _WebMenuItemState extends State<WebMenuItem> {
  bool _isHover = false;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
          "Interface Reservation",style: GoogleFonts.lobster(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 20

      )
      ),
    );
  }
}
/*
InkWell(
onTap: widget.press,
onHover: (value) {
setState(() {
_isHover = value;
});
},
child: AnimatedContainer(
duration: kDefaultDuration,
margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
decoration: BoxDecoration(
border: Border(
bottom: BorderSide(color: _borderColor(), width: 3),
),
),
child: Text(
widget.text,
style: TextStyle(
color: Colors.white,
fontWeight: widget.isActive ? FontWeight.w600 : FontWeight.normal,
),
),
),
)*/
