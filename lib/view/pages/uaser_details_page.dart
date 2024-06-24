import 'package:brainwired_machine_test/core/utils/color_palette.dart';
import 'package:brainwired_machine_test/core/utils/dynamic_size.dart';
import 'package:brainwired_machine_test/model/user_model/user_model.dart';
import 'package:brainwired_machine_test/view/widgets/Address_widget.dart';
import 'package:brainwired_machine_test/view/widgets/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class UserDetailsPage extends ConsumerWidget {
  static const routePath = "/userDetailspage";

  const UserDetailsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// passed data
    final user = ModalRoute.of(context)?.settings.arguments as UserModel;

    return Scaffold(
      backgroundColor: AppColorPalettes.cardbgcolor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              width: double.infinity,
              height: context.h(300),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                gradient: LinearGradient(
                  colors: [
                    AppColorPalettes.purple1,
                    AppColorPalettes.purple2,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                      child: UserProfileWidget(
                    radius: 42,
                    name: user.name?.substring(0, 1) ?? "",
                  )),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      user.name ?? "Unkmown",
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          color: AppColorPalettes.white500,
                          fontSize: 26),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.phone),
                      Text(
                        user.phone ?? "Unkmown",
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w300,
                            color: AppColorPalettes.textcolor,
                            fontSize: 20),
                      ),
                    ],
                  ),
                ],
              )),
          SizedBox(
            height: context.h(20),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Icon(Icons.email),
                      ),
                      Text(
                        "email: ${user.email}",
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            color: AppColorPalettes.textcolor,
                            fontSize: 18),
                      ),
                    ],
                  ),
                  const Divider(),
                  AddressWidget(user: user),
                  const Divider(),
                  Text(
                    "companyName:\n ${user.company!.name}",
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        color: AppColorPalettes.textcolor,
                        fontSize: 18),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.language),
                        TextButton(
                            onPressed: ()async {
                           await   launchUrl(
                                mode: LaunchMode.externalApplication,
                                Uri.parse(user.website!),
                              );
                            },
                            child: Text(
                              "website: ${user.website}",
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  color: AppColorPalettes.textcolor,
                                  fontSize: 18),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
