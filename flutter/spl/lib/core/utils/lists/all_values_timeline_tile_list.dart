import 'package:spl/features/track/presentation/managers/models/timeline_tile_model.dart';
import 'package:spl/generator/assets.gen.dart';

final List<TimelineTileModel> steps = [
  //this List to give the attributes values them
  //this(Assets.images.collectedImage.path) to access String(path this image), but this(Assets.images.collectedImage.image() or .svg()) to access Widget
  TimelineTileModel(
    label: 'Collected',
    isCompleted: true,
    image: Assets.images.collectedImage.path,
  ),
  TimelineTileModel(
    label: 'In Transit',
    isCompleted: true,
    image: Assets.images.inTransitImage.path,
  ),
  TimelineTileModel(
    label: 'Ready for shipment',
    isCompleted: false,
    image: Assets.images.inventoryImage.path,
  ),
  TimelineTileModel(
    label: 'Arrived in syria',
    isCompleted: false,
    image: Assets.images.locationImageS.path,
  ),
  TimelineTileModel(
    label: 'Out for delivery',
    isCompleted: false,
    image: Assets.images.inTransitImage.path,
  ),
];
