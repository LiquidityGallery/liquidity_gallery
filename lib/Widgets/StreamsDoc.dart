import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StreamsDoc<T> extends StatelessWidget {
  final Stream<DocumentSnapshot<Map<String, dynamic>>> stream;

  final Widget Function(DocumentSnapshot<Map<String, dynamic>>) child;

  ///Better Streambuilder with shorter format.
  /// updated: merge to cloud_firestore 2.2.2
  const StreamsDoc(
      {Key? key,

      required this.child,
      required this.stream})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
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
