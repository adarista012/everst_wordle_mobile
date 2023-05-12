import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wordle_mobile/globals/widgets/hero_card_widget.dart';

import '../../view_models/list_of_cards_model.dart';

class HomeController extends GetxController {
  final ListOfCardsModel _listModel = Get.put(ListOfCardsModel());
  final List<HeroCardWidget> _listWidgets = [];
  bool _isLoading = false;

  HomeController() {
    _init();
  }

  void _init() async {
    await getList();
  }

  Future<void> reload() async {
    _init();
    update(['cards']);
  }

  Future<void> getList() async {
    _isLoading = true;
    await _listModel.getListOfCards().then((value) {
      _listWidgets.addAll(
        _listModel.listOfCards!.map(
          (e) => HeroCardWidget(card: e),
        ),
      );
      _isLoading = false;
      update(['cards']);
    });
  }

  Widget returnList() {
    if (_isLoading || _listWidgets.isEmpty) {
      return const SliverFillRemaining(
          child: Center(child: CircularProgressIndicator()));
    } else {
      return SliverList(
        delegate: SliverChildBuilderDelegate(
          (_, i) {
            return _listWidgets[i];
          },
          childCount: _listWidgets.length, // 1000 list items
        ),
      );
    }
  }
}
