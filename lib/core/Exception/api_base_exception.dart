import 'package:brainwired_machine_test/core/Exception/base_exception.dart';

class MyApiBaseException extends BaseException {
  final String? apiErrorMsg;

  MyApiBaseException({required this.apiErrorMsg})
      : super(
          message: apiErrorMsg ?? "An unknown error occured",
        );
}
