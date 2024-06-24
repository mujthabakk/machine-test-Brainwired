import 'package:brainwired_machine_test/core/Exception/base_exception.dart';
import 'package:brainwired_machine_test/model/user_model/user_model.dart';
import 'package:brainwired_machine_test/service/user_service/user_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'user_controller.g.dart';

@riverpod
Future<List<UserModel>> fetchUserData(FetchUserDataRef ref) async {
  try {
    return await UserService.fetchData();
  } on BaseException catch (e) {
    throw e.message;
  }
}
