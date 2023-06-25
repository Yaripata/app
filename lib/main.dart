import 'package:flutter/material.dart';
// import 'package:lulu_app/auth.dart';
// import 'package:lulu_app/menu.dart';
import 'routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
//import 'package:firebase_auth/firebase_auth.dart';

final navigatorkey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    navigatorKey: navigatorkey,
    debugShowCheckedModeBanner: true,
    // home: StreamBuilder<User?>(
    //   stream: FirebaseAuth.instance.authStateChanges(),
    //   builder: (context, AsyncSnapshot<User?> snapshot) {
    //     if (snapshot.hasData && snapshot.data != null) {
    //       return const Menu();
    //     } else if (snapshot.connectionState == ConnectionState.waiting) {
    //       return const Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     }
    //     return Auth();
    //   },
    //),
    onGenerateRoute: Routes.routes,
  ));
}
