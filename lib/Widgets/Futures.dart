import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Futures<T> extends StatelessWidget {
  final Future<QuerySnapshot<Map<String, dynamic>>> future;

  final Widget Function(QuerySnapshot<Map<String, dynamic>>) child;
  final Widget? childOnError;
  final Widget childOnWaiting;

  ///Better Streambuilder with shorter format.
  /// updated: merge to cloud_firestore 2.2.2
  const Futures(
      {super.key,
      required this.child,
      required this.future,
      this.childOnError,
      this.childOnWaiting = const Center(
        child: CircularProgressIndicator(),
      )});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (BuildContext context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
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
          return childOnWaiting;
        }
//?/ Class做法
      },
    );
  }
}
