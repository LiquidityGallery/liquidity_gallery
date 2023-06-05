import 'package:flutter/material.dart';

class ContentCard extends StatelessWidget {
  final bool dense;
  final Widget? child;
  final String? subtitle;
  final Widget? icon;
  final bool imageOnLeft;
  final String imageURL;
  final void Function()? onTap;

  const ContentCard(
      {Key? key,
      this.dense = false,
      this.imageOnLeft = true,
      this.subtitle,
      this.icon,
      required this.imageURL,
      @required this.onTap,
      this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Center(
        child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
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
                                        image: NetworkImage(imageURL),
                                        fit: BoxFit.cover)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 9.0,
                                ),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: child,
                                ),
                              ),
                              subtitle == null
                                  ? Container()
                                  : Padding(
                                      padding: const EdgeInsets.only(
                                        top: 9.0,
                                      ),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Wrap(
                                          children: [
                                            icon == null ? Container() : icon!,
                                            Text(
                                              subtitle!,
                                              style: const TextStyle(fontSize: 14),
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
                          padding: const EdgeInsets.all(9.0),
                          child: Column(
                            children: [
                              imageOnLeft == true
                                  ? Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            width: 120,
                                            height: 70,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                //   border: Border.all(width: 1.0),
                                                image: DecorationImage(
                                                    image:
                                                        NetworkImage(imageURL),
                                                    fit: BoxFit.cover)),
                                          ),
                                        ),
                                        Expanded(
                                            flex: 2,
                                            child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 13),
                                                child: child)),
                                      ],
                                    )
                                  : Row(
                                      children: [
                                        Expanded(
                                            flex: 2,
                                            child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 13),
                                                child: child)),
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            width: 120,
                                            height: 70,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                //   border: Border.all(width: 1.0),
                                                image: DecorationImage(
                                                    image:
                                                        NetworkImage(imageURL),
                                                    fit: BoxFit.cover)),
                                          ),
                                        ),
                                      ],
                                    ),
                              subtitle == null
                                  ? Container()
                                  : Padding(
                                      padding: const EdgeInsets.only(
                                        top: 9.0,
                                      ),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Wrap(
                                          children: [
                                            icon == null ? Container() : icon!,
                                            Text(
                                              subtitle!,
                                              style: const TextStyle(fontSize: 14),
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
      ),
    );
  }
}
