import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Streams<T> extends StatelessWidget {
  final Stream<QuerySnapshot<Map<String, dynamic>>> stream;

  final Widget Function(QuerySnapshot<Map<String, dynamic>>) child;
  final Widget childOnWaiting;


  ///Better Streambuilder with shorter format.
  /// updated: merge to cloud_firestore 2.2.2
  const Streams({Key? key, required this.child, required this.stream, this.childOnWaiting= const Center(
    child: CircularProgressIndicator(),
  )})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (BuildContext context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error.toString());
          return Center(
            child: Text(snapshot.error.toString()),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return childOnWaiting;
        } else {
          return child(snapshot.data!);
        }
//?/ Class做法
      },
    );
  }
}
