import 'package:flutter/material.dart';
import 'package:note/helpers.dart';

class Notes extends StatelessWidget {
  const Notes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getSize(context).width,
      height: getSize(context).height,
      child: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Text("Header 1"),
                Text("Header 2"),
                Text("Header 3"),
                Text("Header 4"),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                    width: getSize(context).width,
                    height: 50,
                    color: Colors.blue),
                Container(
                    width: getSize(context).width,
                    height: 50,
                    color: Colors.red),
                Container(
                    width: getSize(context).width,
                    height: 50,
                    color: Colors.green),
                Container(
                    width: getSize(context).width,
                    height: 50,
                    color: Colors.orange),
                Container(
                    width: getSize(context).width,
                    height: 50,
                    color: Colors.blue),
                Container(
                    width: getSize(context).width,
                    height: 50,
                    color: Colors.red),
              ],
            ),
          ),
          SliverGrid(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            delegate: SliverChildListDelegate(
              [
                Container(
                    width: getSize(context).width,
                    height: 50,
                    color: Colors.blue),
                Container(
                    width: getSize(context).width,
                    height: 50,
                    color: Colors.green),
                Container(
                    width: getSize(context).width,
                    height: 50,
                    color: Colors.yellow),
                Container(
                    width: getSize(context).width,
                    height: 50,
                    color: Colors.orange),
                Container(
                    width: getSize(context).width,
                    height: 50,
                    color: Colors.blue),
                Container(
                    width: getSize(context).width,
                    height: 50,
                    color: Colors.red),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
