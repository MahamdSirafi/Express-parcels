import 'package:flutter/material.dart';
import 'package:spl/features/track/presentation/views/widgets/custom_track_view_body.dart';

class TrackView extends StatelessWidget {
  const TrackView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: CustomTrackViewBody());
  }
}
