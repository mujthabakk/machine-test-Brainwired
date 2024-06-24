import 'package:brainwired_machine_test/model/user_model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            user.name ?? "Unknown",
          )
        ],
      ),
    );
  }
}
