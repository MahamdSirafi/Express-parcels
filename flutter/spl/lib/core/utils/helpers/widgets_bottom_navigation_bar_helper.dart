import 'package:flutter/material.dart';
import 'package:spl/features/home/presentation/views/widgets/custom_home_view_body.dart';
import 'package:spl/features/my_shipment/presentation/views/widgets/custom_my_shipment_view_body.dart';
import 'package:spl/features/profile/presentation/views/widgets/custom_profile_view_body.dart';
import 'package:spl/features/track/presentation/views/widgets/custom_track_view_body.dart';

List<Widget> widgetsBottomNavigationBarHelper(
  GlobalKey<ScaffoldState> scaffoldKey,
) => [
  CustomHomeViewBody(scaffoldKey: scaffoldKey),
  const CustomTrackViewBody(),
  const CustomMyShipmentViewBody(),
  const CustomProfileViewBody(),
];
//this((..) => [];) it's same((..){return [];})
