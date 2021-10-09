import 'package:flutter/material.dart';
import 'package:note/widgets/my_appbar.dart';

class AddNote extends StatelessWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(appBar: AppBar());
  }
}
