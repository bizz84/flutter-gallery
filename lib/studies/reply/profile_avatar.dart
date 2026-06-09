import 'package:flutter/material.dart';

class const ProfileAvatar({
  super.key,
  required final String avatar,
  final double radius = 20,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: CircleAvatar(
        radius: radius,
        backgroundColor: Theme.of(context).cardColor,
        child: ClipOval(
          child: Image.asset(
            avatar,
            gaplessPlayback: true,
            package: 'flutter_gallery_assets',
            height: 42,
            width: 42,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
