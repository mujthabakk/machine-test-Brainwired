import 'package:brainwired_machine_test/core/utils/color_palette.dart';
import 'package:brainwired_machine_test/core/utils/dynamic_size.dart';
import 'package:brainwired_machine_test/model/user_model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddressWidget extends StatelessWidget {
  const AddressWidget({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(
              Icons.pin_drop,
              size: 30,
            ),
          ),
          SizedBox(
            width: context.w(330),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "address:\n street: ${user.address?.street}",
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      color: AppColorPalettes.textcolor,
                      fontSize: 18),
                ),
                Text(
                  " city: ${user.address?.city}",
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      color: AppColorPalettes.textcolor,
                      fontSize: 18),
                ),
                Text(
                  " zipcode: ${user.address?.zipcode}",
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      color: AppColorPalettes.textcolor,
                      fontSize: 18),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
