
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserProfileWidget extends StatelessWidget {
  const UserProfileWidget({
    super.key,
    required this.name,
    required this.radius
  });
  final String name;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      child: Center(
        child: Text(name.substring(0, 1),
            style: GoogleFonts.inter(fontWeight: FontWeight.w600)),
      ),
    );
  }
}
