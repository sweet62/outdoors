import 'package:first_project/Page/MapPage.dart';
import 'package:first_project/Style/Theme.dart';
import 'package:first_project/widgets/LocationInfo.dart';
import 'package:flutter/material.dart';
import 'package:first_project/Page/PlacesPage.dart';
import 'Page/PalcePage.dart';
import 'package:provider/provider.dart';




void main() {

  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => WeatherTheme()),],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  // Этот виджет является корнем вашего приложения.

  @override
  Widget build(BuildContext context) {
    return LocationInheritedWidget(//даёт доступ к
      child: MaterialApp(
          title: 'Flutter Demo',
          // theme: ThemeData(
          //   primarySwatch: Colors.blue,
          // ),
        theme: Provider.of<WeatherTheme>(context).currentTheme,
          initialRoute: "/",
          onGenerateRoute: getRouds,
      ),
    );
  }

  Route getRouds(RouteSettings settings){
    late Widget pageToDisplay;

    switch(settings.name){
      case "/": pageToDisplay = PlacesPage(); break;
      case "/city":
        {
          pageToDisplay = WeatherPage(
            placemark: (settings.arguments as Map)["placemark"],
          );
          break;
        }
      case "/map" :{
          pageToDisplay = MapPage();
          break;
        }
      }

    return MaterialPageRoute(
        builder: (BuildContext context){
          return pageToDisplay;
      }
    );
  }
}
