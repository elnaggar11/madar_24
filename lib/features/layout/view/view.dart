import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madar_24/features/cart/view/view.dart';
import 'package:madar_24/features/home/view/home_view.dart';
import 'package:madar_24/features/layout/cubit/layout_cubit.dart';
import 'package:madar_24/features/layout/cubit/layout_state.dart';
import 'package:madar_24/features/layout/widgets/custom_nav_bar.dart';
import 'package:madar_24/features/orders/view/view.dart';
import 'package:madar_24/features/profile/view/view.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key, this.index});
  final int? index;

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit()..initTabBar(this, widget.index ?? 0),
      child: BlocConsumer<LayoutCubit, LayoutStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = LayoutCubit.get(context);
          return Scaffold(
            body: TabBarView(
              controller: cubit.tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                const HomeView(),
                const OrdersView(),
                const CartView(),
                const ProfileView(),
              ],
            ),
            bottomNavigationBar: CustomBottomNavBar(
              currentIndex: cubit.tabController.index,
              onTap: cubit.changeTab,
            ),
            extendBody: true,
          );
        },
      ),
    );
  }
}
