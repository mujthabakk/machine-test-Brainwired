import 'package:brainwired_machine_test/core/Exception/api_base_exception.dart';
import 'package:brainwired_machine_test/model/user_model/user_model.dart';
import 'package:dio/dio.dart';

class UserService {
  static Dio dio = Dio(); // Dio instance

  // Fetches user data from the API
  static Future<List<UserModel>> fetchData() async {
    try {
      // GET request
      final Response response = await dio.get(
        'https://jsonplaceholder.typicode.com/users',
      );

      // If response is OK (200)
      if (response.statusCode == 200) {
        final usersList = response.data as List<dynamic>; // Parse JSON

        // Map to UserModel list
        return usersList.map((data) => UserModel.fromJson(data)).toList()
          ..sort(
            (a, b) => a.name!.compareTo(b.name!),
          );
      } else {
        // Custom exception if not OK
        throw MyApiBaseException(apiErrorMsg: response.statusMessage);
      }
    } on DioException catch (e) {
      // Dio-specific exception
      throw MyApiBaseException(apiErrorMsg: e.message);
    } catch (e) {
      // General exception
      throw MyApiBaseException(apiErrorMsg: 'An unexpected error occurred');
    }
  }
}
