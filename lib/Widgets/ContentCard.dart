import 'package:flutter/material.dart';

class ContentCard extends StatelessWidget {
  final bool dense;
  final String text;
  final String subtitle;
  final Widget? icon;

  const ContentCard({Key? key, this.dense = false, this.text='', this.subtitle='', this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          constraints: BoxConstraints(maxWidth: 400),
          child: dense == false
              ? Card(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Container(
                              height: 185,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                               //   border: Border.all(width: 1.0),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          'https://picsum.photos/400/200'),
                                      fit: BoxFit.cover)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 9.0,
                              ),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  text,
                                  style: TextStyle(fontSize: 17),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 9.0,
                              ),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Wrap(
                                  children: [
                                    icon== null ?Container() : icon!,
                                    Text(
                                      subtitle,
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              : Card(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 13),
                                      child: Text(
                                        text,
                                        style: TextStyle(fontSize: 17),
                                      ),
                                    )),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    width: 120,
                                    height: 70,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                     //   border: Border.all(width: 1.0),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                'https://picsum.photos/400/200'),
                                            fit: BoxFit.cover)),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 9.0,
                              ),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Wrap(
                                  children: [
                                    icon== null ?Container() : icon!,
                                    Text(
                                      subtitle,
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )),
    );
  }
}
