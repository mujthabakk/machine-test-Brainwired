import 'package:brainwired_machine_test/controller/user_controller/user_controller.dart';
import 'package:brainwired_machine_test/core/constants/home_page_constants/home_page_constants.dart';
import 'package:brainwired_machine_test/core/utils/color_palette.dart';
import 'package:brainwired_machine_test/view/pages/uaser_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  static const routePath = "/homepage";
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.read(homePageConstantsProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColorPalettes.cardbgcolor,
        centerTitle: true,
        title: Text(
          constants.userTxt,
          style: const TextStyle(fontSize: 32),
        ),
      ),
      body: ref.watch(fetchUserDataProvider).when(
            data: (data) => ListView.builder(
              itemBuilder: (context, index) => Container(
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: AppColorPalettes.cardbgcolor, width: 3))),
                child: ListTile(
                  leading: CircleAvatar(
                    child: Center(
                      child: Text(data[index].name?.substring(0, 1) ?? ""),
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      UserDetailsPage.routePath,
                      arguments: data[index],
                    );
                  },
                  title: Text(
                    data[index].name ?? constants.nulltext,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  subtitle: Text(
                    data[index].username ?? constants.nulltext,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
              itemCount: data.length,
            ),
            error: (error, stackTrace) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// error message text
                  Text(
                    error.toString(),
                    textAlign: TextAlign.center,
                  ),

                  IconButton(
                    onPressed: () {
                      ref.invalidate(fetchUserDataProvider);
                    },
                    icon: const Icon(Icons.refresh),
                  )
                ],
              ),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
    );
  }
}
