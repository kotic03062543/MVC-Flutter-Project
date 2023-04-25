import 'package:flutter/material.dart';
import 'package:newsapp/model/news.dart';

class NewsItem extends StatefulWidget {
  final Newslist? newslist;
  final int index;

  NewsItem({super.key, required this.newslist, required this.index});

  @override
  State<NewsItem> createState() => _NewsItemState();
}

class _NewsItemState extends State<NewsItem> {
  @override
  Widget build(BuildContext context) {
    int paddingbetween = 10;
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width - paddingbetween,
        height: 150,
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          // clipBehavior: Clip.hardEdge,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child:
                        widget.newslist!.articles![widget.index].urlToImage !=
                                null
                            ? Image.network(
                                '${widget.newslist!.articles![widget.index].urlToImage}',
                                width: 130,
                                height: 110,
                                fit: BoxFit.cover,
                              )
                            : Image.asset(
                                'assets/images/loading.jpg',
                                width: 130,
                                height: 110,
                                fit: BoxFit.cover,
                              ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 100,
                          child: Text(
                            '${widget.newslist!.articles![widget.index].description}',
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  '${widget.newslist!.articles![widget.index].author}',
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                              Text(
                                  '${widget.newslist!.articles![widget.index].publishedAt!.substring(0, 10)}'),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
