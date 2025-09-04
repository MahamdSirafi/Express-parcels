import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/helpers/build_marker_helper.dart';
import 'package:spl/core/utils/helpers/move_camera_helper.dart';
import 'package:spl/features/track/presentation/managers/cubits/tracking_cubit/tracking_cubit.dart';
import 'package:spl/features/track/presentation/managers/cubits/tracking_cubit/tracking_state.dart';
import 'package:spl/features/track/presentation/views/widgets/custom_google_map_live_tracking.dart';
import 'package:spl/generator/assets.gen.dart';

class CustomLiveTrackingAndGoogleMap extends StatefulWidget {
  const CustomLiveTrackingAndGoogleMap({super.key});
  @override
  State<CustomLiveTrackingAndGoogleMap> createState() =>
      _CustomLiveTrackingAndGoogleMapState();
}

class _CustomLiveTrackingAndGoogleMapState
    extends State<CustomLiveTrackingAndGoogleMap> {
  final Completer<GoogleMapController> completer = Completer();
  //i use Completer because it can store the controller when the map is created
  BitmapDescriptor? truckIcon;
  //this parameter it's icon on map(truck), and in this line i just declare on this parameter, but in later time i will change value it sure
  LatLng currentLocation = const LatLng(33.5138, 36.2765);
  //location to truck icon for now
  late TrackingCubit trackingCubit;
  //shouldn't be use longer line in dispose method(context...), should be short
  Future<void> loadTruckIcon() async {
    truckIcon = await BitmapDescriptor.asset(
      const ImageConfiguration(size: Size(38, 44)),
      Assets.images.truckShipmentImage.path,
    ); //i load truck icon on map
    setState(() {});
    //i should rebuild loadTruckIcon on map because the truckIcon hasn't fixed place on map
  }

  @override
  void initState() {
    //will implement before build build method
    trackingCubit = context.read<TrackingCubit>();
    loadTruckIcon();
    trackingCubit.startTracking(parcelId: kParcelId);
    super.initState();
  }

  @override
  void dispose() {
    //will implement after getout from this view
    trackingCubit.stopTracking();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return BlocConsumer<TrackingCubit, TrackingState>(
      listener: (context, state) {
        if (state is SuccessTrackingState) {
          currentLocation = state.latLngInCubit;
          moveCameraHelper(latLng: state.latLngInCubit, completer: completer);
        }
        //when the state is Success so i assign longitude and latitude from backend to currentLocation parameter, and to moveCamera method
      },
      builder: (context, state) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(height * 0.016),
          child: CustomGoogleMapLiveTracking(
            markers: buildMarkerHelper(
              state: state,
              currentLocation: currentLocation,
              icon: truckIcon,
            ),
            onMapCreated: (controller) => completer.complete(controller),
          ),
        );
      },
    );
  }
}
