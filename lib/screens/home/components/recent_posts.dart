import 'package:cupertino_stepper/cupertino_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'sidebar_container.dart';

class RecentPosts extends StatelessWidget {
  const RecentPosts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SidebarContainer(
      title: "",
      child: Column(
        children: [
          RecentPostCard(
          ),
        ],
      ),
    );
  }
}

class RecentPostCard extends StatelessWidget {


  const RecentPostCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        child: Image.asset("assets/images/onlickcheckin.png"),
      ),
    );
  }
}


/*
Row(
children: [
Expanded(
flex: 2,
child: Image.asset(image),
),
SizedBox(width: kDefaultPadding),
Expanded(
flex: 5,
child: Text(
title,
maxLines: 2,
style: TextStyle(
fontFamily: "Raleway",
color: kDarkBlackColor,
fontWeight: FontWeight.bold,
height: 1.5,
),
),
),
],
)*/
