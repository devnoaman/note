import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:note/controllers/bottomnav.dart';
import 'package:note/screens/addnote.dart';
import 'package:provider/provider.dart';

class NavItem {
  IconData icon;
  int index;
  NavItem({
    required this.icon,
    required this.index,
  });
}

List<NavItem> items = [
  NavItem(icon: Iconsax.note5, index: 0),
  NavItem(icon: Iconsax.path, index: 1),
  NavItem(icon: Iconsax.task_square5, index: 2),
];

class MyBottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      alignment: Alignment.center,
      children: [
        CustomPaint(
          size: Size(size.width, 100),
          painter: BNBCustomPainter(height: 20),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 46),
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                NavButton(
                  item: items[0],
                ),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) {
                          return Container(
                            decoration: BoxDecoration(
                              // color: Color(0xff80D0C7),
                              color: Color(0xff312D3E),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 1), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  leading: Icon(
                                    Iconsax.note5,
                                    color: Colors.white,
                                  ),
                                  title: Text(
                                    'Add Note',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.pop(context);
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => AddNote()));
                                  },
                                ),
                                ListTile(
                                  leading: Icon(
                                    Iconsax.task_square5,
                                    color: Colors.white,
                                  ),
                                  title: Text(
                                    'New Task',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.pop(context);
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => AddNote()));
                                  },
                                ),
                                Container(
                                  height: 55,
                                )
                              ],
                            ),
                          );
                        });
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: Offset(0, 8), // changes position of shadow
                        ),
                      ],
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Icon(
                        items[1].icon,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                NavButton(
                  item: items[2],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class NavButton extends StatelessWidget {
  const NavButton({
    Key? key,
    required this.item,
  }) : super(key: key);

  final NavItem item;

  @override
  Widget build(BuildContext context) {
    var index = items.indexOf(item);
    var selectedIndex = context.read<NavNotify>().index;
    return ChangeNotifierProvider.value(
      value: NavNotify(),
      child: InkWell(
        child: (index != selectedIndex)
            ? Icon(
                item.icon,
                color: Colors.white30,
              )
            : Icon(
                item.icon,
                color: Colors.white,
              ),
        onTap: () {
          context.read<NavNotify>().change(index);
          print(context.read<NavNotify>().index);
        },
      ),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  final double height;
  BNBCustomPainter({
    required this.height,
  });
  @override
  void paint(Canvas canvas, Size size) {
    // final rect = offset & size,

    Paint paint = Paint()
      ..color = Color(0xff312D3E)
      // ..color = Colors.black87.withOpacity(0.3)
      ..style = PaintingStyle.fill;
    // ..imageFilter = ui.ImageFilter.blur(sigmaX: 8, sigmaY: 8);
    // ..blendMode = BlendMode.clear
    // ..shader = ui.Gradient.linear(
    //   Offset(0, 4),
    //   Offset(0, 10),
    //   [
    //     Color(0xff0093E9),
    //     Color(0xff80D0C7),
    //     // color2,
    //   ],
    // );

    Path path = Path();
    path.moveTo(0, height); // Start
    path.quadraticBezierTo(size.width * 0.5, 0, size.width, height);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, height);
    canvas.saveLayer(Offset.zero & size, Paint());
    canvas.restore();
    // canvas.drawShadow(path, Colors.black, 2, false);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
