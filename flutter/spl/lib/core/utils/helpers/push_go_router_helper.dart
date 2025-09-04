import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void pushGoRouterHelper({
  required BuildContext context,
  required String view,
  Object? extra,
  //to take thing when i navigate and give it to this view(i navigate to it)
}) {
  GoRouter.of(context).push(view, extra: extra);
}
