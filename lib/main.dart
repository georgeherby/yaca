import 'package:crypto_app/old/api/asset_list_startup.dart';
import 'package:crypto_app/old/market/assets_data_table.dart';
import 'package:crypto_app/old/market/market_view.dart';
import 'package:crypto_app/old/models/asset_list_startup.dart';
import 'package:crypto_app/ui/consts/colours.dart';
import 'package:crypto_app/ui/screens/favourite_assets_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'core/viewmodels/asset_view_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AssetViewModel>(
      create: (_) => AssetViewModel(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: LightThemeColors().primary,
          accentColor: LightThemeColors().accent,
          appBarTheme: AppBarTheme(
            elevation: 2,
            color: LightThemeColors().appBarColour,
            brightness: Brightness.light,
            iconTheme: IconThemeData(color: Colors.black),
          ),
          primaryTextTheme: TextTheme(headline6: TextStyle(color: Colors.black)),
          navigationRailTheme: NavigationRailThemeData(
            backgroundColor: LightThemeColors().scaffoldBackground,
            selectedIconTheme: IconThemeData(color: LightThemeColors().primary),
            selectedLabelTextStyle: TextStyle(color: LightThemeColors().primary),
          ),
          scaffoldBackgroundColor: LightThemeColors().scaffoldBackground,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: DarkThemeColors().primary,
          accentColor: DarkThemeColors().accent,
          appBarTheme: AppBarTheme(
              elevation: 2,
              color: DarkThemeColors().appBarColour,
              brightness: Brightness.dark,
              iconTheme: IconThemeData(color: Colors.white)),
          navigationRailTheme: NavigationRailThemeData(
            backgroundColor: DarkThemeColors().scaffoldBackground,
            selectedIconTheme: IconThemeData(color: DarkThemeColors().primary),
            selectedLabelTextStyle: TextStyle(color: DarkThemeColors().primary),
          ),
          scaffoldBackgroundColor: DarkThemeColors().scaffoldBackground,
          primaryTextTheme: TextTheme(headline6: TextStyle(color: Colors.white)),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        home: MyHomePage(key: const Key("home_screen_key"), title: 'Cryptocurrency'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({required Key key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(children: [
        NavigationRail(
          minWidth: 55.0,
          groupAlignment: 0.0,
          selectedIndex: _selectedIndex, //_selectedIndex,
          onDestinationSelected: (int index) {
            if (_selectedIndex != index) {
              setState(() {
                _selectedIndex = index;
              });
            }
          },
          labelType: NavigationRailLabelType.all,
          destinations: [
            NavigationRailDestination(
                icon: Icon(CupertinoIcons.graph_square),
                selectedIcon: Icon(CupertinoIcons.graph_square_fill),
                label: Text(
                  "Market",
                )),
            NavigationRailDestination(
                icon: Icon(CupertinoIcons.star),
                selectedIcon: Icon(CupertinoIcons.star_fill),
                label: Text(
                  "Favourites",
                )),
            // NavigationRailDestination(
            //     icon: Icon(CupertinoIcons.triangle),
            //     selectedIcon: Icon(CupertinoIcons.triangle_fill),
            //     label: Text(
            //       "Portfolio",
            //     )),
            NavigationRailDestination(
                icon: Icon(CupertinoIcons.news),
                selectedIcon: Icon(CupertinoIcons.news_solid),
                label: Text(
                  "News",
                ))
          ],
        ),
        showPage(_selectedIndex)
      ]),
    );
  }

  Widget showPage(int index) {
    switch (index) {
      case 0:
        return Expanded(
            child: FutureBuilder<AssetListStartup>(
          future: fetchAssetListStartup(http.Client()),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error);
              print(snapshot.stackTrace);
            }

            return snapshot.hasData
                ? MarketView(marketDetails: snapshot.data!.marketDetails)
                : Center(
                    child: CupertinoActivityIndicator(),
                  );
          },
        ));
      case 1:
        return Expanded(
          child: FavouriteAssetsScreen(),
        );
      // case 2:
      //   return Expanded(
      //     child: Scaffold(
      //       body: Center(
      //         child: Text("Portfolio"),
      //       ),
      //     ),
      //   );
      case 2:
        return Expanded(
          child: Scaffold(
            body: Center(
              child: Text("News"),
            ),
          ),
        );
      default:
        return Icon(CupertinoIcons.exclamationmark);
    }
  }
}
