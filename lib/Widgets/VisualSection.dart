import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ConfirmButton.dart';

class VisualSection extends StatelessWidget {
  final Color? backgroundcolor;
  final double? height;
  final String? title;
  final String? subtitle;
  final double titlefontsize;
  final Color? titlecolor;
  final bool? istitlebold;
  final TextStyle? titlefontfamily;
  final double? minheight;
  final double? subtitlefontsize;
  final Color? subtitlecolor;
  final bool? issubtitlebold;

  final TextStyle? subtitlefontfamily;
  final List<Widget>? children;

/// A main useful viusal layout mainly for Web design.
  ///
  /// it will auto adjest size show on big/small screen.
  ///
  /// Recommended custom widgets:
  ///
  /// DisplayFrame()  // A image container with prebuild title and subtitle. Auto-adjust layout
  ///
  ///DotPoint() // A colored Icon Widget with title and subtitle as a nice web point form display prebuild layout
  ///
  /// ListBoard() // Use a display board in web such as a service list/ price plan
  ///
  /// Use ListBoardItem in the ListBoard for better text
  ///
  /// HeroBoard() // Big Title and paragraph text for major web disply with great layout.
  const VisualSection(
      {Key? key,
      this.backgroundcolor,
      this.height,
      this.title,
      this.subtitle,
      this.titlefontsize = 23,
      this.titlecolor,
      this.istitlebold = true,
      this.subtitlefontsize,
      this.subtitlecolor,
      this.issubtitlebold = false,
      this.titlefontfamily,
      this.subtitlefontfamily,
      this.children,
      this.minheight = 500})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: backgroundcolor == null ? Colors.white54 : backgroundcolor,
      height: height,
      constraints: BoxConstraints(minHeight: minheight!),
      child: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 1000),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              title == null
                  ? Container()
                  : Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Text(
                        title!,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.raleway(
                            fontSize: titlefontsize,
                            color: titlecolor,
                            fontWeight: istitlebold == true
                                ? FontWeight.bold
                                : FontWeight.normal),
                      ),
                  ),
              subtitle == null
                  ? Container()
                  : Text(
                      subtitle!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: subtitlefontsize,
                          color: subtitlecolor,
                          fontWeight: issubtitlebold == true
                              ? FontWeight.bold
                              : FontWeight.normal),
                    ),
              Padding(padding: EdgeInsets.all(10)),
    Wrap(
    alignment: WrapAlignment.spaceEvenly,
    direction: Axis.horizontal,
    children: children!,
    ),
            ],
          ),
        ),
      ),
    );
  }
}

class DisplayFrame extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final Color? titlecolor;
  final Widget? child;
  final Color? subtitlecolor;


  ///A image container with prebuild title and subtitle. Auto-adjust layout
  const DisplayFrame({Key? key, this.title, this.subtitle, this.titlecolor, this.subtitlecolor, this.child}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 330,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {},
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
child: child,
                  decoration: BoxDecoration(
                    //  color: Colors.cyan,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[400]!,
                          blurRadius: 1.0,
                          spreadRadius: 0.5,
                        )
                      ]),
                  width: 330,
                  height: 260,
                ),
              ),
            ),
          ),
          title == null ? Container() : Padding(
            padding: const EdgeInsets.only(left: 8, top: 10, bottom: 6),
            child: Text(
              title!,
              style: GoogleFonts.raleway(fontWeight: FontWeight.bold, color: titlecolor==null ? Colors.black : titlecolor),
            ),
          ),
          subtitle == null ? Container() :  Padding(
            padding: const EdgeInsets.only(left: 8, top: 0, bottom: 10),
            child: Text(
              subtitle!,
              style: TextStyle(color: subtitlecolor==null ? Colors.black54 : subtitlecolor),
            ),
          )
        ],
      ),
    );
  }
}

class DotPoint extends StatelessWidget {
  final Color? dotcolor;
  final Icon? icon;
  final String? title;
  final String? subtitle;
  final Color? titlecolor;
  final Color? subtitlecolor;


  /// A colored Icon Widget with title and subtitle as a nice web point form display prebuild layout
  const DotPoint({Key? key, this.dotcolor, this.icon, this.title, this.subtitle, this.titlecolor, this.subtitlecolor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 330,
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(48.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: dotcolor ==null ? Colors.yellow : dotcolor,
                      borderRadius: BorderRadius.circular(48.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[400]!,
                          blurRadius: 0.0,
                          spreadRadius: 0.5,
                        )
                      ]),
                  width: 50,
                  height: 50,
                  child: Center(
                    child: icon ==null ? Icon(Icons.ac_unit) : icon,
                  ),
                ),
              ),
            ),
           title ==null ? Container() : Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 6),
              child: Text(
                title!,
                textAlign: TextAlign.center,
                style: GoogleFonts.raleway(fontWeight: FontWeight.bold, color: titlecolor ==null ? Colors.black : titlecolor),
              ),
            ),
            subtitle ==null ? Container() : Padding(
              padding: const EdgeInsets.only(top: 0, bottom: 10),
              child: Text(
                subtitle!,
                textAlign: TextAlign.center,
                style: TextStyle(color:  subtitlecolor ==null ? Colors.black54 : subtitlecolor),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ListBoard extends StatelessWidget {
  final String? title;

  final double? titlefontsize;
  final Widget? child;
  final Color? titlecolor;
  final String buttontext;
  final Color? buttoncolor;
  final void Function()? onpressed;
  final Color? backgroundcolor;
  final Color? buttontextcolor;
  final double? radius;


  /// ListBoard() // Use a display board in web such as a service list/ price plan
  ///
  /// Use ListBoardItem in the ListBoard for better text
  const ListBoard(
      {Key? key,
      this.title,
      this.titlefontsize = 27,
      this.titlecolor,
      this.backgroundcolor,
      this.radius = 5.0, this.child,required this.buttontext, this.buttoncolor, this.onpressed, this.buttontextcolor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(radius!),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  title == null
                      ? Container()
                      : Padding(
                          padding: const EdgeInsets.only(
                            top: 25.0,
                            left: 22,
                          ),
                          child: Text(
                            title!,
                            textAlign: TextAlign.start,
                            style: GoogleFonts.raleway(
                                fontSize: titlefontsize,
                                color: titlecolor == null
                                    ? Colors.black
                                    : titlecolor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
Padding(padding: EdgeInsets.all(10)),
child== null ? Container() : Padding(
  padding: const EdgeInsets.only(left: 22,bottom: 10),
  child:   child,
  
),
                  onpressed ==null ? Container() : Align(
                      alignment: Alignment.bottomCenter,
                      child: ConfirmButton(onPressed: () async {onpressed!;},text: buttontext, color: buttoncolor==null ? Colors.yellow : buttoncolor,textcolor: (buttontextcolor == null ? Colors.black87 : buttontextcolor),))
                ],
              ),
              decoration: BoxDecoration(
                  color:
                      backgroundcolor == null ? Colors.cyan : backgroundcolor,
                  borderRadius: BorderRadius.circular(radius!),
                  // border: Border.all(width: 10,color: Colors.cyanAccent),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[400]!,
                      blurRadius: 1.0,
                      spreadRadius: 0.5,
                    )
                  ]),
              constraints:
                  BoxConstraints(minHeight: 600, minWidth: 370, maxWidth: 420),
            ),
          ),
        ),
      ],
    );
  }
}

class ListBoardItem extends StatelessWidget {
  final Icon? icon;
  final bool? isicon;
  final double? iconsize;
  final String? text;
  final double? fontsize;

  ///ListBoardItem in the ListBoard for better text
  ///
  /// formatted Text with icon such as check mark, only for ListBoard
  const ListBoardItem({Key? key, this.icon, this.isicon=false, this.iconsize=17, this.text, this.fontsize=15}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: 5,bottom: 5),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Wrap(
          children: [
     isicon== true ?  (icon==null ? Icon(Icons.check,color: Colors.teal,size: iconsize!,) :icon!) : Container(),
            Padding(
              padding: const EdgeInsets.only(left: 5,),
              child: Text(text!,style: TextStyle(fontSize: fontsize)),
            ),
          ],
        ),
      ),
    );
  }
}


class HeroBoard extends StatelessWidget {
  final String? title;
  final double? titlefontsize;
  final String? subtitle;
  final double? subtitlefontsize;
  final Color? titlecolor;
  final Color? subtitlecolor;
  final void Function()? onPressed;
  final Color? buttoncolor;
  final double? radius;
  final Color? buttontextcolor;
  final String buttontext;


  ///Big Title and paragraph text for major web disply with great layout.
  const HeroBoard(
      {Key? key,
      this.title,
      this.subtitle,
      this.titlefontsize = 30,
      this.subtitlefontsize = 18,
      this.titlecolor,
      this.subtitlecolor,
      this.onPressed,
      this.buttoncolor,
      this.radius = 30,
      this.buttontextcolor,
      required this.buttontext})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            //constraints: BoxConstraints(minHeight: 300),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                title == null
                    ? Container()
                    : Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          title!,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.raleway(
                              fontSize: titlefontsize,
                              color: titlecolor == null
                                  ? Colors.black
                                  : titlecolor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                subtitle == null
                    ? Container()
                    : Padding(
                        padding: const EdgeInsets.only(top: 22),
                        child: Text(
                          subtitle!,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.raleway(
                            fontSize: subtitlefontsize!,
                            color: subtitlecolor ==null ? Colors.black87 : subtitlecolor,
                          ),
                        ),
                      ),
                onPressed == null
                    ? Container()
                    : ConfirmButton(
                        onPressed: () async {onPressed!;},
                        color:
                            buttoncolor == null ? Colors.yellow : buttoncolor,
                        text: buttontext,
                        radius: radius!,
                        minWidth: 140,
                        textcolor: buttontextcolor == null
                            ? Colors.black
                            : buttontextcolor,
                      )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
