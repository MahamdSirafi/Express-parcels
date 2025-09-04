import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void goGoRouterHelper({required BuildContext context, required String view}) {
  GoRouter.of(context).go(view);
}
