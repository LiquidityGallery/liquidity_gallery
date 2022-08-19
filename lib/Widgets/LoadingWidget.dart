import 'package:flutter/material.dart';
import 'package:liquidity_gallery/liquidity_gallery.dart';

class LoadingWidget extends StatefulWidget {
  final Future<dynamic> Function() load;
  final Duration? timeout;
  final Duration? willPop;

  const LoadingWidget(
      {Key? key, required this.load, this.timeout, this.willPop})
      : super(key: key);
  @override
  _LoadingWidgetState createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  late bool _isLoading;
  String? _error;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });
    try {
      await widget.load().timeout(widget.timeout ?? Duration(days: 1),
          onTimeout: () {
        throw 'Request timeout';
      });
      if (widget.willPop != null) {
        await Future.delayed(widget.willPop!);
        Navigator.pop(context);
      }
    } catch (e) {
      _error = e.toString();
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Loading...'),
                  CircularProgressIndicator.adaptive()
                ],
              ),
            )
          : _error != null
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.error),
                        Text('Error: $_error'),
                        Row(
                          children: [
                            Expanded(
                              child: ConfirmButton(
                                  radius: 0,
                                  //   color: Colors.grey[800],
                                  text: 'Retry',
                                  onPressed: () {
                                    init();
                                  }),
                            ),
                          ],
                        ),
                        Container(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: ConfirmButton(
                                    radius: 0,
                                    color: Colors.grey[800],
                                    text: 'Back',
                                    onPressed: () {
                                      Navigator.pop(context);
                                    }),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              : Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.done),
                      Text('Finish'),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Back')),
                    ],
                  ),
                ),
    );
  }
}
