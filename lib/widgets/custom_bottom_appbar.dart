import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

List<IconData> iconListBottomAppBar = [
  Icons.bookmark_outline_rounded,
  Icons.notifications_none_rounded
];


Widget myCustomBottomAppBar(BuildContext context) {
  List<IconData> iconListBottomAppBar = [
    Icons.home,
    Icons.settings,
  ];

  return BottomAppBar(
    color: Colors.white,
    shape: const CircularNotchedRectangle(),
    notchMargin: 5,
    child: Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 80.0),
            child: IconButton(
              icon: const Icon(
                Icons.call_to_action_rounded,
                color: Colors.black54,
                size: 30,
              ),
              onPressed: () {

              },
            ),
          ),
          for (int i = 0; i < 2; i++)
            IconButton(
              icon: Icon(
                iconListBottomAppBar[i],
                color: Colors.black54,
                size: 30,
              ),
              onPressed: () {},
            ),
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromRGBO(38, 35, 33, 0.9),
            ),
            child: Padding(
              padding: const EdgeInsets.all(1.5),
              child: CircleAvatar(
                maxRadius: 15,
                backgroundImage: NetworkImage(
                    FirebaseAuth.instance.currentUser!.photoURL!),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

