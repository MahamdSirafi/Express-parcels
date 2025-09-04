import 'package:flutter/material.dart';
import 'package:spl/core/utils/helpers/widgets_bottom_navigation_bar_helper.dart';
import 'package:spl/features/home/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:spl/features/home/presentation/views/widgets/custom_drawer.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  int currentIndex = 0;
  //currentIndex(position the icon in BottomNavigationBar i clicked on it)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const CustomDrawer(),
      body: widgetsBottomNavigationBarHelper(scaffoldKey)[currentIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
