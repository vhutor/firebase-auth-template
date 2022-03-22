import 'package:flutter/material.dart';

// Colors
const kMainAppColor = Color.fromARGB(255, 65, 201, 183);
const kLoginPageColor = Color(0xFFF6F6F6);
const kLoginButtonColor = Color(0xFFFFFFFF);

// Decorations
const kLoginBoxDecoration = BoxDecoration(
  color: kLoginPageColor,
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(30),
    topRight: Radius.circular(30),
  ),
);

// TextStyles
const kMainTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 50,
  color: Colors.white,
);

const String propositionTab = 'Пропозиції';
const String eventTab = 'Події';

const List<Tab> myTabs = <Tab>[
  Tab(text: propositionTab),
  Tab(text: eventTab),
];

AppBar withMeAppAndTabBar = AppBar(
  backgroundColor: Colors.white,
  title: withMeTitle,
  bottom: const TabBar(
    tabs: myTabs,
    labelColor: kMainAppColor,
    unselectedLabelColor: Colors.grey,
  ),
);

AppBar withMeAppBar = AppBar(
  backgroundColor: Colors.white,
  title: withMeTitle,
);

Widget withMeTitle = const Center(
  child: Text(
    'With Me',
    style: TextStyle(color: kMainAppColor),
  ),
);

Widget subTitle = const Center(
  child: Text(
    'Ukraine',
    style: TextStyle(color: kMainAppColor),
  ),
);
