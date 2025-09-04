import 'package:flutter/material.dart';
import 'package:spl/core/utils/classes/local_database/doubles_shared_preferences_class.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';

class CustomStarRatingShipmentDialog extends StatefulWidget {
  const CustomStarRatingShipmentDialog({super.key});
  @override
  State<CustomStarRatingShipmentDialog> createState() =>
      _CustomStarRatingShipmentDialogState();
}

class _CustomStarRatingShipmentDialogState
    extends State<CustomStarRatingShipmentDialog> {
  int rating = 0;
  //rating represents actual star count (1–5), not the position(index), i mean this parameter i will give it star number not star position
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.085),
      child: Row(
        children: List.generate(5, (index) {
          return IconButton(
            onPressed: () async {
              setState(() {
                rating = (rating == index + 1) ? 0 : index + 1;
              });
              //look i will give value to rating parameter but should take this value after condition, when the user click on some position to some start check if value rating parameter is equal value(index) next position
              //look List.generate like loop(i mean will be loop from 0 to 4) the user click on number four position and the rating parameter it's value 0 so (0 == (0)+1) so if yes give rating parameter this value(0) or if no give it this value((0)+1 so 1)
              //and now will go to icon attribute if 0 < 1 if yes appear on ui start icon if no appear on ui start_outline icon
              //if you click on number five star and you clicked again on number five star so look to condition rating = (5 == (4)+1)?0:(4)+1 so the rating will get on 0 so now the condition in icon attribute 4<0 sure no so will get on this icon(star_outline), so don't worry and you use same parameter for five icons i mean all parameters will get on same result
              await DoublesSharedPreferencesClass.saveRateMethodSharedPreferences(
                rate: rating,
              );
              //i get on value the rating parameter because in another file i want to send rating to api
            },
            icon: Icon(
              index < rating ? Icons.star : Icons.star_outline,
              color: StyleToColors.neonYellowColor,
            ),
          );
        }),
      ),
    );
  }
}
