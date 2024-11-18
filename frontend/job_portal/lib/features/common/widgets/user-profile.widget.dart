import 'package:flutter/material.dart';

class UserProfileWidget extends StatefulWidget {
  const UserProfileWidget({super.key});

  @override
  State<UserProfileWidget> createState() => _UserProfileWidgetState();
}

class _UserProfileWidgetState extends State<UserProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 50,
          width: 50,
          decoration: const BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.all(
              Radius.circular(
                50,
              ),
            ),
          ),
          child: const Icon(
            Icons.person,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Suneel Pal",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text(
          "Senior UI / UX Developer",
          style: TextStyle(
            color: Colors.black45,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Divider(
          height: 0.4,
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
