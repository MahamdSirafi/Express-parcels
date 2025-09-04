import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spl/core/utils/routers/app_router.dart';
import 'package:spl/core/utils/service_locator/get_it_service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  setUp();
  runApp(const SPLApp());
}

class SPLApp extends StatelessWidget {
  const SPLApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}
