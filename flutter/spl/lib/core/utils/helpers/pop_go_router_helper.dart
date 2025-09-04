import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void popGoRouterHelper({required BuildContext context}) {
  GoRouter.of(context).pop();
}
