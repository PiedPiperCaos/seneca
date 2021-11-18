import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    color: ,
                  )
                ),
                Expanded(
                  flex: 8,
                  child: Container()
                )
              ],
            ),  
          )
        ],
      ),
    );
  }
}
