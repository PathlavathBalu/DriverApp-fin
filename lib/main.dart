import 'package:driverapp/DirectionProvider.dart';
import 'package:driverapp/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: SplashScreen(),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (_) => DirectionProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'DriverApp',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen(),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:map_launcher/map_launcher.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// void main() => runApp(MapLauncherDemo());

// class MapLauncherDemo extends StatelessWidget {
//   openMapsSheet(context) async {
//     try {
//       final coords = Coords(37.759392, -122.5107336);
//       final title = "Ocean Beach";
//       final availableMaps = await MapLauncher.installedMaps;

//       showModalBottomSheet(
//         context: context,
//         builder: (BuildContext context) {
//           return SafeArea(
//             child: SingleChildScrollView(
//               child: Container(
//                 child: Wrap(
//                   children: <Widget>[
//                     for (var map in availableMaps)
//                       ListTile(
//                         onTap: () => map.showMarker(
//                           coords: coords,
//                           title: title,
//                         ),
//                         title: Text(map.mapName),
//                         leading: SvgPicture.asset(
//                           map.icon,
//                           height: 30.0,
//                           width: 30.0,
//                         ),
//                       ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       );
//     } catch (e) {
//       print(e);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Map Launcher Demo'),
//         ),
//         body: Center(child: Builder(
//           builder: (context) {
//             return MaterialButton(
              // onPressed: () => openMapsSheet(context),
//               child: Text('Show Maps'),
//             );
//           },
//         )),
//       ),
//     );
//   }
// }