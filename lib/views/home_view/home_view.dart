import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:wordle_mobile/views/home_view/home_controller.dart';
import '../../globals/widgets/home_sliver_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeController>(
        id: 'cards',
        init: HomeController(),
        builder: (_) {
          return RefreshIndicator(
            onRefresh: _.reload,
            child: CustomScrollView(
              slivers: [
                const HeroAppBar(),
                _.returnList(),
              ],
            ),
          );
        },
      ),
    );
  }
}
