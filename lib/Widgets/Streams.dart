import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Streams<T> extends StatelessWidget {
  final Stream<QuerySnapshot> stream;
  final T object;
  final Widget Function(QuerySnapshot) child;


  ///Better Streambuilder with shorter format.
  const Streams({Key? key,required this.object, required this.child, required this.stream}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error.toString());
          return Center(
            child: Text(snapshot.error.toString()),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return child(snapshot.data!);
        }
//?/ Class做法

      },


    );
  }
}
