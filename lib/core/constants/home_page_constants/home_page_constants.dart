import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'home_page_constants.g.dart';

final class HomePageConstants {
  final userTxt = "USERS";
  final nulltext = "Unkmown";
}

@riverpod
HomePageConstants homePageConstants(HomePageConstantsRef ref) {
  return HomePageConstants();
}
