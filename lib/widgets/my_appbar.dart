import 'package:flutter/material.dart';
import 'package:note/helpers.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height,
      // color: Color(0xff312D3E),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Spacer(),
              Align(
                alignment: Alignment.center,
                child: const Text(
                  'Noon Notes',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              Spacer(),
              Container(
                width: 50,
                height: 50,

                // color: Colors.red,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('images/noaman.HEIC'),
                  ),
                  borderRadius: BorderRadius.circular(12),
                  color: Color(0xFFD0B480),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      // color: Colors.red,
      decoration: BoxDecoration(
        // color: Color(0xff80D0C7),
        color: Color(0xff312D3E),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
        // gradient: LinearGradient(
        //   begin: Alignment.topCenter,
        //   end: Alignment.bottomCenter,
        //   stops: [
        //     0.1,
        //     0.9,
        //   ],
        //   colors: [
        //     Color(0xff0093E9),
        //     Color(0xff80D0C7),
        //   ],
        // ),
      ),
    );
  }
}
