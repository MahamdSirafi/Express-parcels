import 'package:flutter/material.dart';
import 'package:spl/features/home/presentation/views/widgets/custom_all_home_view_section.dart';

class CustomHomeViewBody extends StatelessWidget {
  const CustomHomeViewBody({super.key, required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: CustomAllHomeViewSection(scaffoldKey: scaffoldKey),
        ),
      ],
      //i can't use 1: SliverFillRemaining(hasScrollBody:false,) with 2: BottomNavigationBar, because 1 it's mean(you should take all rest the view until if you don't need to do scroll(hasScrollBody: false)), and 2 you need to take const size from view in all views in mobile so will happen conflict in concept this two cases
    );
  }
}
