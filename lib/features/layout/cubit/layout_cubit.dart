import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madar_24/features/layout/cubit/layout_state.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(LayoutInitial());
  static LayoutCubit get(BuildContext context) => BlocProvider.of(context);

  late TabController tabController;

  void initTabBar(vsync, [int index = 0]) {
    tabController = TabController(length: 4, vsync: vsync, initialIndex: index);
  }

  void changeTab(int tab) {
    log(tab.toString());
    switch (tab) {
      case 0:
        tabController.animateTo(0);
        break;
      case 1:
        tabController.animateTo(1);
        break;
      case 2:
        tabController.animateTo(2);
        break;
      case 3:
        tabController.animateTo(3);
        break;
      case 4:
        tabController.animateTo(4);
        break;
      case 5:
        tabController.animateTo(5);
        break;
      default:
    }
    emit(LayoutChangeScreenState());
  }
}
