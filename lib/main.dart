import 'package:flutter/material.dart';

import 'package:iconsax/iconsax.dart';
import 'package:note/controllers/bottomnav.dart';
import 'package:note/helpers.dart';
import 'package:note/screens/home.dart';
import 'package:note/screens/notes.dart';
import 'package:note/widgets/my_appbar.dart';
import 'package:note/widgets/nav.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MaterialColor brandColor = MaterialColor(0xFF312D3E, BrandColor);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NavNotify()),
        ChangeNotifierProvider(create: (context) => NoteView()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: brandColor,
            bottomNavigationBarTheme:
                BottomNavigationBarThemeData(backgroundColor: Colors.blue)),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<Widget> myWidget = [
    Home(),
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(size.width, 60), child: MyAppBar()),
        body: Stack(
          children: [
            ChangeNotifierProvider.value(
              value: NavNotify(),
              child: IndexedStack(
                children: myWidget,
                index: context.watch<NavNotify>().index,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                  width: size.width,
                  height: 100,
                  color: Colors.transparent,
                  child: MyBottomNav()),
            )
          ],
        ));
  }
}
