import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Futures.dart';

class FuturesDoc<T> extends StatelessWidget {
  final Future<DocumentSnapshot<Map<String, dynamic>>> future;

  final Widget Function(DocumentSnapshot<Map<String, dynamic>>) child;

  ///Better Streambuilder with shorter format.
  /// updated: merge to cloud_firestore 2.2.2
  const FuturesDoc(
      {Key? key,

      required this.child,
      required this.future})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (BuildContext context,
          AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error.toString());
          return Center(
            child: Text(snapshot.error.toString()),
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return child(snapshot.data!);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
//?/ Class做法
      },
    );
  }
}
