import 'package:flutter/material.dart';

import 'BubbleTile.dart';
import 'MailboxContainer.dart';

class InfoButton extends StatelessWidget {
  final Function() onTap;
  final Icon icon;
  final Widget child;
  final Color? color;
  const InfoButton({Key? key, required this.onTap, required this.icon, required this.child, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   BubbleTile(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Stack(
          children: [
            Row(children: [
              Expanded(child: icon),
              Expanded(
                flex: 2,
                child: child,
              ),


            ],),
            Align(
                alignment: Alignment.bottomRight  ,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.arrow_forward_ios,color: Colors.white,),
                )),
          ],
        ),
      ),


      backgroundColor: color?? Colors.cyan[800],
      height: 200,
    );
  }
}
