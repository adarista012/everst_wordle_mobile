import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:wordle_mobile/views/character_ar_view/character_ar_view.dart';
import 'package:wordle_mobile/views/character_detail_view/character_detail_view.dart';
import 'package:wordle_mobile/views/home_view/home_view.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: '/', page: () => const HomeView()),
  GetPage(name: '/detail', page: () => const CharacterDetailView()),
  GetPage(name: '/ar', page: () => const CharacterArView()),
];
