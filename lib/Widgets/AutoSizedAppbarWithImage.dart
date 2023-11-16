import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:share_plus/share_plus.dart';

/// Normally place in a [SliverAppBar.flexibleSpace]
/// Default have a image on top and a title below
class AutoSizedAppBarWithImage extends StatelessWidget {
  AutoSizedAppBarWithImage(
      {super.key,
      required this.title,
      required this.imageUrls,
      this.style,
      required this.bottomHeight,
      this.bigImageMode = true});

  final bool bigImageMode;
  final List<String> imageUrls;
  final String title;
  final TextStyle? style;

  /// Need this to make sure the bottom does not cover this widget
  final double bottomHeight;

  final baseCacheManger = DefaultCacheManager();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, bc) {
        return SizedBox(
          height: bc.maxHeight - bottomHeight,
          child: Column(
            children: [
              Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Center(
                      child: GestureDetector(
                        child: Hero(
                          tag: 'imageHero',
                          child: CachedNetworkImage(
                            cacheManager: baseCacheManger,
                            imageUrl: imageUrls.first,
                            placeholder: (context, url) =>
                                const CircularProgressIndicator.adaptive(),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                        onTap: () {
                          if (bigImageMode) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => BigImage(
                                          imageUrls: imageUrls,
                                          baseCacheManager: baseCacheManger,
                                        )));
                          }
                        },
                      ),
                    ),
                  )),
              Expanded(
                child: Center(
                  child: AutoSizeText(
                    title,
                    style: style ?? Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class BigImage extends StatelessWidget {
  const BigImage(
      {super.key, required this.imageUrls, required this.baseCacheManager});
  final List<String> imageUrls;
  final BaseCacheManager baseCacheManager;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Images'),
      ),
      body: CarouselSlider(
        items: imageUrls
            .map((imageUrl) => Hero(
                  tag: 'imageHero',
                  child: GestureDetector(
                    onLongPress: () async {
                      final file =
                          await baseCacheManager.getSingleFile(imageUrl);
                      Share.shareFiles([file.path], subject: file.basename);
                    },
                    child: CachedNetworkImage(
                      cacheManager: baseCacheManager,
                      imageUrl: imageUrl,
                      placeholder: (context, progress) =>
                          const CircularProgressIndicator.adaptive(),
                      errorWidget: (context, progress, value) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ))
            .toList(),
        options: CarouselOptions(
          enableInfiniteScroll: false,
          height: MediaQuery.of(context).size.height,
          viewportFraction: 1.0,
          enlargeCenterPage: false,
        ),
      ),
    );
  }
}
