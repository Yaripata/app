import 'package:flutter/material.dart';
import 'routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

final navigatorkey = GlobalKey<NavigatorState>();

// ...

main() async {
  // data
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MaterialApp(
    navigatorKey: navigatorkey,
    debugShowCheckedModeBanner: true,
    onGenerateRoute: Routes.routes,
  ));
}
