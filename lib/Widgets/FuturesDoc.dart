import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FuturesDoc<T> extends StatelessWidget {
  final Future<DocumentSnapshot<Map<String, dynamic>>> future;

  final Widget Function(DocumentSnapshot<Map<String, dynamic>>) child;
  final Widget? childOnError;

  ///Better Streambuilder with shorter format.
  /// updated: merge to cloud_firestore 2.2.2
  const FuturesDoc(
      {super.key, required this.child, required this.future, this.childOnError});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (BuildContext context,
          AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error.toString());
          return childOnError == null
              ? Center(
                  child: Text(snapshot.error.toString()),
                )
              : childOnError!;
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return child(snapshot.data!);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
//?/ Class做法
      },
    );
  }
}
