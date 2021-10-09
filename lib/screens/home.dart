// ignore_for_file: unnecessary_new

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:note/controllers/bottomnav.dart';
import 'package:note/dummy/note_model.dart';
import 'package:note/helpers.dart';
import 'package:note/widgets/note_card.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _items = [];
  bool? listState;
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/notes.json');
    final data = await jsonDecode(response);
    print(data);
    setState(() {
      _items = data;
    });
    // ...
  }

  @override
  void initState() {
    readJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    listState = context.watch<NoteView>().isGrid!;
    List<Color> color = [
      Color(0xffFDA247),
      Color(0xff7AC5F7),
      Color(0xffFDA4C2),
      Color(0xff1CCCC3),
    ];
    return Container(
      width: getSize(context).width,
      height: getSize(context).height,
      child: CustomScrollView(
        slivers: <Widget>[
          // SliverList(
          //   delegate: SliverChildListDelegate(
          //     [
          //       Text("Header 1"),
          //       Text("Header 2"),
          //       Text("Header 3"),
          //       Text("Header 4"),
          //     ],
          //   ),
          // ),

          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onTap: () {
                      // FocusScope.of(context).requestFocus(_focusNode);
                    },
                    decoration: InputDecoration(
                      // suffixIcon: const Icon(Icons.mail),
                      prefixIcon: const Icon(Iconsax.search_normal),
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      // labelText: 'Email',
                      hintText: 'Search for note...',
                      labelStyle: labelTextStyle,
                      hintStyle: hintTextStyle,
                    ),
                  ),
                ),
                ChangeNotifierProvider.value(
                  value: NoteView(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {
                          context.read<NoteView>().changeState(true);
                          print(context.read<NoteView>().isGrid);
                        },
                        icon: Icon(
                          Iconsax.element_3,
                          color: (context.watch<NoteView>().isGrid!)
                              ? BrandColor[900]
                              : BrandColor[100],
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      IconButton(
                        onPressed: () {
                          context.read<NoteView>().changeState(false);
                          print(context.read<NoteView>().isGrid);
                        },
                        icon: Icon(Iconsax.row_vertical,
                            color: (context.watch<NoteView>().isGrid!)
                                ? BrandColor[100]
                                : BrandColor[900]),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                    ],
                  ),
                ),
                // Container(
                //   width: getSize(context).width,
                //   child: StaggeredGridView.countBuilder(
                //     crossAxisCount: 2,
                //     itemCount: _items.length,
                //     mainAxisSpacing: 4.0,
                //     crossAxisSpacing: 4.0,
                //     itemBuilder: (context, index) {
                //       return Container(
                //         child: Card(
                //           child: Column(
                //             children: [
                //               // Image.network(images[index]),
                //               Text("Some Text"),
                //             ],
                //           ),
                //         ),
                //       );
                //     },
                //     staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                //   ),
                // ),
              ],
            ),
          ),

          (context.read<NoteView>().isGrid!)
              ? SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  delegate: SliverChildListDelegate(
                    _items.map((e) {
                      var item = NotesModel.fromJson(e);

                      return NoteCard(
                        color: color[_items.indexOf(e) % color.length],
                        model: item,
                      );
                    }).toList(),
                  ),
                )
              : SliverList(
                  delegate: SliverChildListDelegate(
                    _items.map((e) {
                      var item = NotesModel.fromJson(e);

                      return NoteCard2(
                        color: color[_items.indexOf(e) % color.length],
                        model: item,
                      );
                    }).toList(),
                  ),
                ),

          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  width: getSize(context).width,
                  height: 100,
                ),
              ],
            ),
          ),
        ],
      ),
    );

    // return Container(
    //   width: getSize(context).width,
    //   height: getSize(context).height,
    //   child: ListView(shrinkWrap: false, children: [
    //     // Container(
    //     //   height: 55,
    //     // ),
    //     // SvgPicture.asset(
    //     //   'images/note.svg',
    //     //   width: 150,
    //     // ),
    //     Padding(
    //       padding: const EdgeInsets.all(8.0),
    //       child: TextFormField(
    //         onTap: () {
    //           // FocusScope.of(context).requestFocus(_focusNode);
    //         },
    //         // focusNode: _focusNode,
    //         // textAlign: TextAlign.center,
    //         // controller: mailController,
    //         decoration: InputDecoration(
    //           // suffixIcon: const Icon(Icons.mail),
    //           prefixIcon: const Icon(Iconsax.search_normal),
    //           fillColor: Colors.white,
    //           border: OutlineInputBorder(
    //             borderSide: BorderSide.none,
    //             borderRadius: BorderRadius.circular(18),
    //           ),
    //           // labelText: 'Email',
    //           hintText: 'Search for note...',
    //           labelStyle: labelTextStyle,
    //           hintStyle: hintTextStyle,
    //         ),
    //       ),
    //     ),
    //     ChangeNotifierProvider.value(
    //       value: NoteView(),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.end,
    //         children: [
    //           IconButton(
    //             onPressed: () {
    //               context.read<NoteView>().changeState(true);
    //               print(context.read<NoteView>().isGrid);
    //             },
    //             icon: Icon(
    //               Iconsax.element_3,
    //               color: (context.watch<NoteView>().isGrid!)
    //                   ? BrandColor[900]
    //                   : BrandColor[100],
    //             ),
    //           ),
    //           SizedBox(
    //             width: 16,
    //           ),
    //           IconButton(
    //             onPressed: () {
    //               context.read<NoteView>().changeState(false);
    //               print(context.read<NoteView>().isGrid);
    //             },
    //             icon: Icon(Iconsax.row_vertical,
    //                 color: (context.watch<NoteView>().isGrid!)
    //                     ? BrandColor[100]
    //                     : BrandColor[900]),
    //           ),
    //           SizedBox(
    //             width: 16,
    //           ),
    //         ],
    //       ),
    //     ),

    //     // ...List.generate(
    //     //     1,
    //     //     (index) => Container(
    //     //           height: 80,
    //     //         )),
    //     ..._items.map((e) {
    //       var item = NotesModel.fromJson(e);

    //       return (context.read<NoteView>().isGrid!)
    //           ? NoteCard(
    //               color: color[_items.indexOf(e) % color.length],
    //               model: item,
    //             )
    //           : NoteCard2(
    //               model: item,
    //             );
    //     }).toList(),
    //     StaggeredGridView.countBuilder(
    //       crossAxisCount: 2,
    //       itemCount: _items.length,
    //       mainAxisSpacing: 4.0,
    //       crossAxisSpacing: 4.0,
    //       itemBuilder: (context, index) {
    //         return Container(
    //           child: Card(
    //             child: Column(
    //               children: [
    //                 // Image.network(images[index]),
    //                 Text("Some Text"),
    //               ],
    //             ),
    //           ),
    //         );
    //       },
    //       staggeredTileBuilder: (index) => StaggeredTile.fit(1),
    //     ),

    //     ...List.generate(
    //         1,
    //         (index) => Container(
    //               height: 80,
    //             ))
    //   ]),
    // );
  }
}

Widget grid() {
  return StaggeredGridView.countBuilder(
    crossAxisCount: 4,
    itemCount: 8,
    itemBuilder: (BuildContext context, int index) => new Container(
        color: Colors.green,
        child: Center(
          child: CircleAvatar(
            backgroundColor: Colors.pink,
            child: Text('$index'),
          ),
        )),
    staggeredTileBuilder: (int index) =>
        StaggeredTile.count(2, index.isEven ? 2 : 1),
    mainAxisSpacing: 4.0,
    crossAxisSpacing: 4.0,
  );
}
